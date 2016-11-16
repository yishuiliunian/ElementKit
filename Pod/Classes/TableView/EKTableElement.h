//
//  EKTableElement.h
//  Pods
//
//  Created by stonedong on 16/2/9.
//
//

#import "EKElement.h"
#import "EKTableDataController.h"
#import <UIKit/UIKit.h>
@interface EKTableElement : EKElement <UITableViewDelegate, UITableViewDataSource>
{
    @protected
    BOOL _firstDisplay;
    EKTableDataController* _dataController;
}
@property (nonatomic, strong, readonly) EKTableDataController * dataController;
@property (nonatomic, weak, readonly) UITableView* tableView;
@property (nonatomic, weak) UIViewController* env;
/**
 *  滚动到Table尾部
 */
- (void) scrollToEnd;
- (void) reloadData;
//

@end
