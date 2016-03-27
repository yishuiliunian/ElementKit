//
//  EKMessageCell.m
//  ElementKit
//
//  Created by stonedong on 16/2/10.
//  Copyright © 2016年 stonedong. All rights reserved.
//

#import "EKMessageCell.h"

@interface EKMessageCell ()

@end

@implementation EKMessageCell

- (instancetype) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (!self) {
        return self;
    }
    _bubuleImageView = [UIImageView new];
    [self.contentView addSubview:_bubuleImageView];
    return self;
}

- (void) layoutSubviews
{
    [super layoutSubviews];
    _bubuleImageView.frame = self.contentView.bounds;
}

@end
