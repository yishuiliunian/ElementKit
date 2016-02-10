//
//  EKElement.m
//  Pods
//
//  Created by stonedong on 16/2/9.
//
//

#import "EKElement.h"
#import "EKAction.h"
@implementation EKElement
- (UIView*) createView
{
    if (_viewClass) {
        return [_viewClass new];
    } else {
        return nil;
    }
}

- (void) ekHandleAction:(EKAction *)action fromView:(UIView *)view
{
    if ([self respondsToSelector:action.selector]) {
        NSMethodSignature *sig= [[self class] instanceMethodSignatureForSelector:action.selector];
        NSInvocation *invocation=[NSInvocation invocationWithMethodSignature:sig];
        [invocation setTarget:self];
        for (int i = 0; i < action.playload.count; i++) {
            id p = action.playload[i];
            [invocation setArgument:(void*)p atIndex:i+2];
        }
        [invocation invoke];
    } else {
        [self.nextResponser ekHandleAction:action fromView:view];
    }
}
- (void) willDisplayView:(UIView*)view
{
    _displayView = view;
}
- (void) didDisplayView:(UIView*)view
{
    
}
- (void) willEndDisplayView:(UIView*)view
{
}
- (void) didEndDisplayView:(UIView*)view
{
    _displayView = nil;
}
@end
