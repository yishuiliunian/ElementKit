//
//  EKTextFiledElement.h
//  ElementKit
//
//  Created by stonedong on 16/2/10.
//  Copyright © 2016年 stonedong. All rights reserved.
//

#import <ElementKit/EKCellElement.h>

@class EKTextFiledCell;
@interface EKTextFiledElement : EKCellElement
@property (nonatomic, weak, readonly) EKTextFiledCell* cell;
@property (nonatomic, strong) NSString* textValue;
@end
