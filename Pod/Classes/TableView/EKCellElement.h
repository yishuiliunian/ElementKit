//
//  EKCellElement.h
//  Pods
//
//  Created by stonedong on 16/2/9.
//
//

#import "EKElement.h"

typedef void(^EKHanldeAction)(UIViewController* vc);

@interface EKCellElement : EKElement
{
    __weak UITableView* _superTableView;
}
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

- (void) scrollToVisible;
@end
