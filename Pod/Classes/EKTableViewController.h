//
//  EKTableViewController.h
//  Pods
//
//  Created by stonedong on 16/2/10.
//
//

#import <UIKit/UIKit.h>
@class EKTableElement;
@interface EKTableViewController : UITableViewController
{
    EKTableElement* _tableElement;
}

- (instancetype) initWithElement:(EKTableElement*)element;
- (instancetype) initWithStyle:(UITableViewStyle)style element:(EKTableElement*)element;
@end
