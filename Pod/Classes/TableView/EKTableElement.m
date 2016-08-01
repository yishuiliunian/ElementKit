//
//  EKTableElement.m
//  Pods
//
//  Created by stonedong on 16/2/9.
//
//

#import "EKTableElement.h"
#import "EKCellElement.h"
#import "UIView+EKElement.h"
#import "EKIndexPath.h"
#import <DZAdjustFrame/DZAdjustTableView.h>
#import "NSObject+EventBus.h"
@interface EKTableElement () <EKCellElementEvents>

@end

@implementation EKTableElement
- (instancetype) init
{
    self = [super init];
    if (!self) {
        return self;
    }
    _firstDisplay  = YES;
    _viewClass = DZAdjustTableView.class;
    _dataController = [EKTableDataController new];
    return self;
}

- (UIResponder*) createResponser
{
    UITableView* tableView = (UITableView*)[super createResponser];
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.tableFooterView = [UIView new];
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    return tableView;
}


- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return _dataController.numberOfSections;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_dataController numberAtSection:section];
}

- (UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    EKCellElement* element = (EKCellElement*)[_dataController objectAtIndexPath:EKIndexPathFromNS(indexPath)];
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:element.cellIdentifier];
    if (!cell) {
        cell = (UITableViewCell*)[element createResponser];
    }
    return cell;
}


- (void) tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    EKCellElement* element = (EKCellElement*)[_dataController objectAtIndexPath:EKIndexPathFromNS(indexPath)];
    element.superTableView = tableView;
    [element willBeginHandleResponser:cell];
    cell.ekActionResponser= element;
    dispatch_async(dispatch_get_main_queue(), ^{
         [element didBeginHandleResponser:cell];
    });

}

- (void) tableView:(UITableView *)tableView didEndDisplayingCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    EKCellElement* element = cell.ekActionResponser;
    [element willRegsinHandleResponser:cell];
    cell.ekActionResponser = nil;
    [element didRegsinHandleResponser:cell];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    EKCellElement* element = (EKCellElement*)[_dataController objectAtIndexPath:EKIndexPathFromNS(indexPath)];
    UITableViewCell* cell = [tableView cellForRowAtIndexPath:indexPath];
    [cell setSelected:NO animated:YES];
    [element handleSelectedInViewController:self.uiEventPool];
}
- (void) tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


- (UITableView*) tableView
{
    return [(UITableViewController*)self.uiEventPool tableView];
}

#pragma Live Circle
- (void) willBeginHandleResponser:(UIResponder *) responser {
    [super willBeginHandleResponser:responser];
    if (_firstDisplay) {
        [self reloadData];
        _firstDisplay = NO;
    }
    [self.eventBus addHandler:self priority:1 port:@selector(onHanldeRemoveElement:)];
}

- (void) reloadData
{
    [self.tableView reloadData];
}

- (void) scrollToEnd
{
    if (self.tableView) {
        NSInteger section = [self.tableView.dataSource numberOfSectionsInTableView:self.tableView];
        if (section == 0) {
            return;
        }
        NSInteger row = [self.tableView.dataSource tableView:self.tableView numberOfRowsInSection:section -1];
        if (row == 0) {
            return;
        }
        NSIndexPath* indexpath = [NSIndexPath indexPathForRow:row-1 inSection:section-1];
        [self.tableView scrollToRowAtIndexPath:indexpath atScrollPosition:UITableViewScrollPositionBottom animated:YES];
    }
    
}

- (void) onHanldeRemoveElement:(EKElement *)ele
{
    NSIndexPath* indexpath = [_dataController indexPathOfObject:ele];
    if (indexpath && indexpath.row != NSNotFound) {
        [_dataController removeObjectAtIndexPath:EKIndexPathFromNS(indexpath)];
        if (indexpath.row == 0 && [_dataController numberAtSection:indexpath.section] == 0) {
            [self.tableView deleteSections:[NSIndexSet indexSetWithIndex:indexpath.section] withRowAnimation:UITableViewRowAnimationAutomatic];
        } else {
            [self.tableView deleteRowsAtIndexPaths:@[indexpath] withRowAnimation:UITableViewRowAnimationAutomatic];
        }
    }
    
}
@end
