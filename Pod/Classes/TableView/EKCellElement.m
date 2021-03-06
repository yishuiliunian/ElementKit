//
//  EKCellElement.m
//  Pods
//
//  Created by stonedong on 16/2/9.
//
//

#import "EKCellElement.h"
#import "UIResponder+EK_FindHost.h"
#import "EKEventBus.h"
#import "NSObject+EventBus.h"
@implementation EKCellElement
@dynamic activeCell;
- (instancetype) init
{
    self = [super init];
    if (!self) {
        return self;
    }
    _viewClass = UITableViewCell.class;
    _showRightArrow = NO;
    _selectionStyle = UITableViewCellSelectionStyleDefault;
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
    if (self.showRightArrow) {
        responser.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    } else {
        responser.accessoryType = UITableViewCellAccessoryNone;
    }
    if (responser.selectionStyle != self.selectionStyle) {
        responser.selectionStyle = self.selectionStyle;
    }
}


- (void) handleSelectedInViewController:(UIViewController *)vc
{
    if (self.ek_handleAction) {
        self.ek_handleAction(vc);
    }
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
    [self.superTableView beginUpdates];
    NSIndexPath* indexPath = [self.superTableView indexPathForCell:self.uiEventPool];
    [self.superTableView endUpdates];
    return indexPath;
}

- (void) reloadUI
{
    [self reloadUIWithAnimation:UITableViewRowAnimationNone];
}

- (void) reloadUIWithAnimation:(UITableViewRowAnimation)animation
{
    NSIndexPath* indexPath = [self.superTableView indexPathForCell:self.uiEventPool];
    if (!indexPath) {
        return;
    }
    if (indexPath.row == NSNotFound || indexPath.section == NSNotFound) {
        return;
    }
    [self.superTableView beginUpdates];
    [self.superTableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:animation];
    [self.superTableView endUpdates];
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

- (void) notifyRemoveThisElement
{
    if (self.eventBus) {
        [self.eventBus performSelector:@selector(onHanldeRemoveElement:) withObject:self];
    }
}

- (void) onHandleDeleteEditing
{
    
}
@end
