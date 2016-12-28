//
//  EKCellElement.h
//  Pods
//
//  Created by stonedong on 16/2/9.
//
//

#import "EKElement.h"

typedef void(^EKHanldeAction)(UIViewController* vc);


@class EKElement;
@protocol EKCellElementEvents <NSObject>

- (void) onHanldeRemoveElement:(EKElement*)ele;

@end

@interface EKCellElement : EKElement
{
    __weak UITableView* _superTableView;
}
@property  (nonatomic, strong, readonly, getter=uiEventPool) UITableViewCell* activeCell;
@property (nonatomic, assign) UITableViewCellSelectionStyle selectionStyle;
@property (nonatomic, strong, readonly) NSString* cellIdentifier;
@property (nonatomic,weak) UITableView* superTableView;
@property (nonatomic, weak, readonly) UIViewController* hostViewController;
@property (nonatomic, strong, readonly) NSIndexPath* visibleIndexPath;
@property (nonatomic, assign) BOOL showRightArrow;
@property (nonatomic, strong) EKHanldeAction ek_handleAction;
- (void) handleSelectedInViewController:(UIViewController*)vc;
/**
 *  重新加载界面信息
 */
- (void) reloadUI;

- (void) reloadUIWithAnimation:(UITableViewRowAnimation)animation;

- (void) scrollToVisible;

/**
 *  通知删除改元素
 */
- (void) notifyRemoveThisElement;

/**
 *  响应右滑删除
 */
- (void) onHandleDeleteEditing;
@end
