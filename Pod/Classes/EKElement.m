//
//  EKElement.m
//  Pods
//
//  Created by stonedong on 16/2/9.
//
//

#import "EKElement.h"
#import "EKAction.h"
#import "EKEventBus.h"
#import "NSObject+EventBus.h"
#import "EKWeakContanier.h"
@interface EKElement ()
@property (nonatomic, weak) UIView* linkedView;
@end


@implementation EKElement
{
    NSMutableArray* _childElement;
}
- (instancetype) init
{
    self = [super init];
    if (!self) {
        return self;
    }
    _childElement = [NSMutableArray new];
    return self;
}

- (UIResponder*) createResponser
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
- (void) willBeginHandleResponser:(UIResponder *)view
{
    _uiEventPool = view;
    [view setEventBus:[self eventBus]];
    for (EKElement* ele in _childElement) {
        [ele willBeginHandleResponser:ele.linkedView];
    }
    view.attachedElement = self;
}
- (void) didBeginHandleResponser:(UIResponder *)view
{
    for (EKElement* ele in _childElement) {
        [ele didBeginHandleResponser:ele.linkedView];
    }
}

- (void) willRegsinHandleResponser:(UIResponder *)view
{
    for (EKElement* ele in _childElement) {
        [ele willRegsinHandleResponser:ele.linkedView];
    }
}

- (void) didRegsinHandleResponser:(UIResponder *)view
{
    [view setEventBus:nil];
    for (EKElement* ele in _childElement) {
        [ele didRegsinHandleResponser:ele.linkedView];
    }
    view.attachedElement = nil;
}

- (void) setSuperElement:(EKElement *)superElement
{
    if (_superElement != superElement) {
        _superElement = superElement;
    }
}

- (void) addChildElement:(EKElement *)element linkedView:(UIView*)view
{
    NSParameterAssert(element);
    [_childElement addObject:element];
    element.superElement = self;
    element.linkedView = view;
}

- (void) __removeChildElement:(EKElement*)element
{
    [_childElement removeObject:element];
    element.superElement = nil;
    element.linkedView = nil;
}

- (void) removeFromeSuper
{
    [self.superElement __removeChildElement:self];
}
- (NSArray*)allChildElement
{
    return [_childElement copy];
}
@end



static void* kEKElementWeakStoreKey = &kEKElementWeakStoreKey;


@implementation UIResponder (ElementXX)

- (void) setAttachedElement:(EKElement *)attachedElement
{
    [self ekSetWeakValue:attachedElement forKey:kEKElementWeakStoreKey];
}

- (EKElement*) attachedElement
{
    return [self ekGetWeakValueForKey:kEKElementWeakStoreKey];
}
@end
