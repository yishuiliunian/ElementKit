//
//  EKMessageTableElement.m
//  ElementKit
//
//  Created by stonedong on 16/2/10.
//  Copyright © 2016年 stonedong. All rights reserved.
//

#import "EKMessageTableElement.h"
#import "EKMessageElement.h"
#import "EKTextFiledElement.h"
@implementation EKMessageTableElement

- (void) reloadData
{
    for (int i = 0; i < 100; i++) {
        if (i %2) {
            [_dataController addObject:[EKMessageElement new]];
        } else {
            [_dataController addObject:[EKTextFiledElement new]];
        }
    }
    [self.tableView reloadData];
}
@end
