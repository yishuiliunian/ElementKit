//
//  EKNavigationControllerElement.m
//  Pods
//
//  Created by stonedong on 16/4/26.
//
//

#import "EKNavigationControllerElement.h"

@implementation EKNavigationControllerElement
{
    EKElement* _rootElement;
}
- (instancetype) initWithRootElement:(EKElement *)element
{
    self = [super init];
    if (!self) {
        return self;
    }
    _rootElement = element;
    return self;
}

- (UIResponder*) createResponser
{
    UINavigationController* controller = [[UINavigationController alloc] initWithRootViewController:[_rootElement createResponser]];
    return controller;
}
@end
