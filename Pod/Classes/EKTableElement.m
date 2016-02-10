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

- (UIView*) createView
{
    UITableView* tableView = (UITableView*)[super createView];
    tableView.delegate = self;
    tableView.dataSource = self;
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
        cell = [element createView];
    }
    return cell;
}


- (void) tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    EKCellElement* element = (EKCellElement*)[_dataController objectAtIndexPath:EKIndexPathFromNS(indexPath)];
    [element willDisplayView:cell];
    cell.ekActionResponser= element;
    [element didDisplayView:cell];

}

- (void) tableView:(UITableView *)tableView didEndDisplayingCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    EKCellElement* element = (EKCellElement*)[_dataController objectAtIndexPath:EKIndexPathFromNS(indexPath)];
    [element willEndDisplayView:cell];
    cell.ekActionResponser = nil;
    [element didEndDisplayView:cell];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    EKCellElement* element = (EKCellElement*)[_dataController objectAtIndexPath:EKIndexPathFromNS(indexPath)];
    [element handleSelectedInViewController:self.env];
}


- (UITableView*) tableView
{
    return (UITableView*)self.displayView;
}

#pragma Live Circle
- (void) willDisplayView:(UITableView*)view
{
    [super willDisplayView:view];
    if (_firstDisplay) {
        [self reloadData];
        _firstDisplay = NO;
    }
}
- (void) didDisplayView:(UITableView*)view
{
    [super didDisplayView:view];
}
- (void) willEndDisplayView:(UITableView*)view
{
    [super willEndDisplayView:view];
}
- (void) didEndDisplayView:(UITableView*)view
{
    [super didEndDisplayView:view];
}
@end
