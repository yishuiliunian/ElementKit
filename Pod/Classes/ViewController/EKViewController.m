//
//  EKViewController.m
//  Pods
//
//  Created by stonedong on 16/4/26.
//
//

#import "EKViewController.h"
#import "EKElement.h"
@interface EKViewController ()

@end

@implementation EKViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.element willBeginHandleResponser:self];
}

- (void) viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self.element didBeginHandleResponser:self];
}


- (void) viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self.element willRegsinHandleResponser:self];
}

- (void) viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    [self.element didRegsinHandleResponser:self];
}
@end
