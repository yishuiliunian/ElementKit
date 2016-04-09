//
//  NSObject+EventBus.h
//  Pods
//
//  Created by stonedong on 16/3/8.
//
//

#import <Foundation/Foundation.h>
#import "EKEventBus.h"
@interface NSObject (EventBus)
@property (nonatomic, weak) id eventBus;
@end
