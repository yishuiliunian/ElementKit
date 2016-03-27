//
//  EKMessageElement.m
//  ElementKit
//
//  Created by stonedong on 16/2/10.
//  Copyright © 2016年 stonedong. All rights reserved.
//

#import "EKMessageElement.h"
#import "EKMessageCell.h"

@implementation EKMessageElement

- (instancetype) init
{
    self = [super init];
    if (!self) {
        return self;
    }
    _viewClass = EKMessageCell.class;
    return self;
}

- (void) willDisplayView:(EKMessageCell*)cell
{
    UIImage* image = [UIImage imageNamed:@"bubble_regular"];
    UIEdgeInsets inset = {17.5, 24, 17.5,24};
    image = [image resizableImageWithCapInsets:inset resizingMode:UIImageResizingModeStretch];
    cell.bubuleImageView.image = image;
}


@end
