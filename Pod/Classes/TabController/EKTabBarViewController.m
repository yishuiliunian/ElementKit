//
//  EKTabBarViewController.m
//  Pods
//
//  Created by stonedong on 16/4/28.
//
//

#import "EKTabBarViewController.h"
#import "EKElement.h"
#import "DZAlphaView.h"
@interface EKTabBarViewController () <UIGestureRecognizerDelegate>
{
    DZAlphaView* _tabbarMaskView;
}
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
- (void) viewDidLoad
{
    [super viewDidLoad];
    UITapGestureRecognizer* tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleDoubleClick:)];
    tap.numberOfTapsRequired = 2;
    tap.numberOfTouchesRequired= 1;
    tap.delegate = self;
    tap.delaysTouchesBegan = YES;
    _tabbarMaskView = [DZAlphaView new];
//    [_tabbarMaskView addGestureRecognizer:tap];
//    [self.tabBar addSubview:_tabbarMaskView];
//    [self.tabBar addGestureRecognizer:tap];
}

- (void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [_element willBeginHandleResponser:self];
}
- (BOOL) gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldBeRequiredToFailByGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
{
    return NO;
}

- (BOOL) gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRequireFailureOfGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
{
    return NO;
}


- (BOOL) gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
{
    return YES;
}
- (void) handleDoubleClick:(UITapGestureRecognizer*)tap
{
    if (tap.state == UIGestureRecognizerStateRecognized) {
        
        NSLog(@"handle !!");
    }
}

- (void) viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    _tabbarMaskView.frame = self.tabBar.bounds;
    [self.tabBar bringSubviewToFront:_tabbarMaskView];
}

- (void) viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [_element willRegsinHandleResponser:self];
    
}


- (void) viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [_element didBeginHandleResponser:self];
}

- (void) viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    [_element didRegsinHandleResponser:self];
}



@end
