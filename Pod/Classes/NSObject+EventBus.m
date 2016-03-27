//
//  NSObject+EventBus.m
//  Pods
//
//  Created by stonedong on 16/3/8.
//
//

#import "NSObject+EventBus.h"
#import "EKWeakContanier.h"
static void* kEKEventBus = &kEKEventBus;
@implementation NSObject (EventBus)
- (void) setEventBus:(id)eventBus
{
    [self ekSetWeakValue:eventBus forKey:kEKEventBus];
}

- (id) eventBus
{
    return [self ekGetWeakValueForKey:kEKEventBus];
}



@end
