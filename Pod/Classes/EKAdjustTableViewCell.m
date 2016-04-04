//
//  EKAdjustTableViewCell.m
//  Pods
//
//  Created by stonedong on 16/4/4.
//
//

#import "EKAdjustTableViewCell.h"
#import "UIView+EKElement.h"
@interface NSObject()
- (void) layoutCell:(EKAdjustTableViewCell*)cell;
@end


@implementation EKAdjustTableViewCell

- (void) layoutSubviews
{
    [super layoutSubviews];
    [self.ekActionResponser performSelector:@selector(layoutCell:) withObject:self];
}
@end
