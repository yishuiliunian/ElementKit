//
//  EKCellElement.m
//  Pods
//
//  Created by stonedong on 16/2/9.
//
//

#import "EKCellElement.h"

@implementation EKCellElement

- (instancetype) init
{
    self = [super init];
    if (!self) {
        return self;
    }
    _viewClass = UITableViewCell.class;
    return self;
}

- (NSString*) cellIdentifier
{
    return NSStringFromClass(_viewClass);
}

- (void) setSuperTableView:(UITableView *)superTableView
{
    if (_superTableView != superTableView) {
        _superTableView = superTableView;
    }
}

- (void) willBeginHandleResponser:(UITableViewCell*)responser
{
    [super willBeginHandleResponser:responser];
    responser.selectionStyle = UITableViewCellSelectionStyleNone;
}



- (void) handleSelectedInViewController:(UIViewController *)vc
{
    
}

- (void) handleAction
{
    
}

- (UIViewController*) hostViewController
{
    if ([self.superTableView.nextResponder isKindOfClass:[UIViewController class]]) {
        return (UIViewController*)self.superTableView.nextResponder;
    }
    return nil;
}

- (NSIndexPath*) visibleIndexPath
{
    return     [self.superTableView indexPathForCell:self.uiEventPool];
}

- (void) reloadUI
{
    NSIndexPath* indexPath = [self.superTableView indexPathForCell:self.uiEventPool];
    if (!indexPath) {
        return;
    }
    if (indexPath.row == NSNotFound || indexPath.section == NSNotFound) {
        return;
    }
    [self.superTableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}

- (void) scrollToVisible
{
    NSIndexPath* indexPath = [self.superTableView indexPathForCell:self.uiEventPool];
    if (!indexPath) {
        return;
    }
    if (indexPath.row == NSNotFound || indexPath.section == NSNotFound) {
        return;
    }
    [self.superTableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionBottom animated:YES];
}
@end
