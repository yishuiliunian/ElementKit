//
//  EKTextFiledCell.m
//  ElementKit
//
//  Created by stonedong on 16/2/10.
//  Copyright © 2016年 stonedong. All rights reserved.
//

#import "EKTextFiledCell.h"

@implementation EKTextFiledCell
- (instancetype) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (!self) {
        return self;
    }
    _textfiled  = [UITextField new];
    [self.contentView addSubview:_textfiled];
    return self;
}

- (void) layoutSubviews
{
    [super layoutSubviews];
    _textfiled.frame = self.contentView.bounds;
}
@end
