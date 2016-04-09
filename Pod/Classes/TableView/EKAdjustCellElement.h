//
//  EKAdjustCellElement.h
//  Pods
//
//  Created by stonedong on 16/3/8.
//
//

#import "EKCellElement.h"
@class EKAdjustTableViewCell;
@interface EKAdjustCellElement : EKCellElement
@property (nonatomic, assign) double cellHeight;
- (void) layoutCell:(EKAdjustTableViewCell*)cell;
@end
