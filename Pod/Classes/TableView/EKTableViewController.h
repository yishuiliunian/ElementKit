//
//  EKTableViewController.h
//  Pods
//
//  Created by stonedong on 16/2/10.
//
//

#import <UIKit/UIKit.h>
@class EKTableElement;
@interface EKTableViewController : UIViewController
{
    EKTableElement* _tableElement;
}
@property (nonatomic, strong) UITableView* tableView;
@property (nonatomic, strong, readonly) EKTableElement* tableElement;
- (instancetype) initWithElement:(EKTableElement*)element;
@end
