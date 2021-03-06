//
//  EKCollectionViewController.m
//  Pods
//
//  Created by stonedong on 16/4/9.
//
//

#import "EKCollectionViewController.h"
#import "EKElement.h"
#import "EKCollectionElement.h"
#import "NSObject+EventBus.h"

@interface EKCollectionViewController ()
{
    EKEventBus* _eventBus;
}
@end

@implementation EKCollectionViewController

- (instancetype) initWithElement:(EKCollectionElement *)element
{
    self = [super initWithNibName:nil bundle:nil];
    if (!self) {
        return self;
    }
    _element = element;
    _eventBus = [EKEventBus new];
    self.eventBus = _eventBus;
    _element.eventBus = _eventBus;
    return self;
}

- (UICollectionView*) collectionView
{
    if (!_collectionView) {
        _collectionView = [_element createResponser];
    }
    return _collectionView;
}

- (void) loadView
{
    if (_element) {
        self.view = self.collectionView;
    } else {
        self.view = [UIView new];
    }
}

- (void) viewDidLoad
{
    [super viewDidLoad];
}
- (void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [_element willBeginHandleResponser:self];
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
