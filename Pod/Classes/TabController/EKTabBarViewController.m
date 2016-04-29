//
//  EKTabBarViewController.m
//  Pods
//
//  Created by stonedong on 16/4/28.
//
//

#import "EKTabBarViewController.h"
#import "EKElement.h"
@interface EKTabBarViewController ()

@end

@implementation EKTabBarViewController

@synthesize element = _element;
- (instancetype) initWithElement:(EKElement *)element
{
    self = [super init];
    if (!self) {
        return self;
    }
    _element = element;
    return self;
}

- (void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [_element willBeginHandleResponser:self];
}

- (void) viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [_element didBeginHandleResponser:self];
}


- (void) viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [_element willRegsinHandleResponser:self];
}

- (void) viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    [_element didRegsinHandleResponser:self];
}



@end
