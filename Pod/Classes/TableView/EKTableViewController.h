//
//  EKTableViewController.h
//  Pods
//
//  Created by stonedong on 16/2/10.
//
//

#import <UIKit/UIKit.h>
#import <DZAdjustFrame.h>
@class EKTableElement;
@class DZAdjustTableView;
@interface EKTableViewController : UITableViewController
{
    EKTableElement* _tableElement;
}
@property (nonatomic, strong, readonly) EKTableElement* tableElement;
@property (nonatomic, weak, readonly) DZAdjustTableView* adjustTableView;
- (instancetype) initWithElement:(EKTableElement*)element;
@end
