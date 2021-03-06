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
{
    double _cellHeight;
}
@property (nonatomic, assign) double cellHeight;
@property  (nonatomic, strong, readonly, getter=uiEventPool) EKAdjustTableViewCell * activeCell;
- (void) layoutCell:(EKAdjustTableViewCell*)cell;
@end
