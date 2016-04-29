//
//  EKEventBus.m
//  Pods
//
//  Created by stonedong on 16/3/8.
//
//

#import "EKEventBus.h"
#import <objc/runtime.h>

@interface EKEventHandler : NSObject
@property (nonatomic, weak) id handler;
@property (nonatomic, assign) double priority;
@property (nonatomic, assign) SEL port;
@end

@implementation EKEventHandler

- (BOOL) isEqual:(EKEventHandler*)object
{
    if (object.handler != _handler) {
        return NO;
    }
    if (sel_isEqual(_port, object.port)) {
        return NO;
    }

    return YES;
}

@end


@implementation EKEventBus
{
    NSMutableArray* _handlerArray;
}

- (instancetype) init
{
    self = [super init];
    if (!self) {
        return self;
    }
    _handlerArray = [NSMutableArray new];
    return self;

}
- (void) addHandler:(id)handler priority:(CGFloat)priority port:(SEL)selector
{
    EKEventHandler* h = [EKEventHandler new];
    h.handler = handler;
    h.priority = priority;
    h.port = selector;
    
    for (EKEventHandler* h in _handlerArray) {
        if (h.handler == handler && sel_isEqual(h.port, selector)) {
            return;
        }
    }
    [_handlerArray addObject:h];
}

- (void) removeHandler:(id)handler prot:(SEL)selector
{
    EKEventHandler* hwilldel;
    for (EKEventHandler* h in _handlerArray) {
        if (h.handler ==handler) {
            hwilldel = h;
            break;
        }
    }
    [_handlerArray removeObject:hwilldel];
}
- (id) forwardingTargetForSelector:(SEL)aSelector
{
    for (EKEventHandler* h in _handlerArray) {
        if ([h.handler respondsToSelector:aSelector]) {
            return h.handler;
        }
    }
    return nil;
}
@end
