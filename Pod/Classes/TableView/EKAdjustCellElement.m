//
//  EKAdjustCellElement.m
//  Pods
//
//  Created by stonedong on 16/3/8.
//
//

#import "EKAdjustCellElement.h"

@implementation EKAdjustCellElement
- (instancetype) init
{
    self = [super init];
    if (!self) {
        return self;
    }
    _cellHeight = 44.f;
    return self;
}

- (void) layoutCell:(EKAdjustTableViewCell *)cell
{
    
}
@end
