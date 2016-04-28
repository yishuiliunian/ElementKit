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


@implementation EKTableElement
- (instancetype) init
{
    self = [super init];
    if (!self) {
        return self;
    }
    _firstDisplay  = YES;
    _viewClass = UITableView.class;
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
    EKCellElement* element = (EKCellElement*)[_dataController objectAtIndexPath:EKIndexPathFromNS(indexPath)];
    [element willRegsinHandleResponser:cell];
    cell.ekActionResponser = nil;
    element.superTableView = nil;
    [element didRegsinHandleResponser:cell];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    EKCellElement* element = (EKCellElement*)[_dataController objectAtIndexPath:EKIndexPathFromNS(indexPath)];
    [element handleSelectedInViewController:self.uiEventPool];
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
}

- (void) reloadData
{
    
}
@end
