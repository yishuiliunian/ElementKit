//
//  EKTextFiledElement.m
//  ElementKit
//
//  Created by stonedong on 16/2/10.
//  Copyright © 2016年 stonedong. All rights reserved.
//

#import "EKTextFiledElement.h"
#import "EKTextFiledCell.h"

@interface EKTextFiledElement () <UITextFieldDelegate>

@end

@implementation EKTextFiledElement

- (instancetype) init
{
    self = [super init];
    if (!self) {
        return self;
    }
    _viewClass = [EKTextFiledCell class];
    return self;
}

- (EKTextFiledCell*) cell
{
    return (EKTextFiledCell*)self.displayView;
}

- (void) willDisplayView:(EKTextFiledCell *)cell
{
    [super willDisplayView:cell];
    cell.textfiled.delegate = self;
    cell.textfiled.text = self.textValue;
    cell.textfiled.placeholder = @"中国人民银行";
    [cell.textfiled addTarget:self action:@selector(textFieldDataChanged:) forControlEvents:UIControlEventAllEditingEvents];
}

- (void) textFieldDataChanged:(UITextField*)textfiled
{
    _textValue = textfiled.text;
}

- (void) didEndDisplayView:(EKTextFiledCell *)cell
{
    [super willDisplayView:cell];
    cell.textfiled.delegate = nil;
    [cell.textfiled removeTarget:self action:@selector(textFieldDataChanged:) forControlEvents:UIControlEventAllEditingEvents];
}

@end
