//
//  EKTableViewController.m
//  Pods
//
//  Created by stonedong on 16/2/10.
//
//

#import "EKTableViewController.h"
#import "EKTableElement.h"
#import "EKEventBus.h"
#import "NSObject+EventBus.h"
@implementation EKTableViewController
{
    EKEventBus* _eventBus;
}

- (instancetype) initWithStyle:(UITableViewStyle)style element:(EKTableElement *)element
{
    self = [self initWithStyle:style];
    if (!self) {
        return self;
    }
    _eventBus = [EKEventBus new];
    _tableElement = element;
    _tableElement.eventBus = _eventBus;
    _tableElement.dataController.element = _tableElement;
    return self;
}

- (instancetype) initWithElement:(EKTableElement *)element
{
    self = [self initWithStyle:UITableViewStylePlain element:element];
    if (!self) {
        return self;
    }
    return self;
}


- (void) loadView
{
    UITableView* tableView = [_tableElement createResponser];
    self.tableView = tableView;
    self.view = tableView;
}

- (void) viewDidLoad
{
    [super viewDidLoad];
    self.tableView.dataSource   = _tableElement;
    self.tableView.delegate     = _tableElement;
}


- (void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [_tableElement willBeginHandleResponser:self];
}

- (void) viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [_tableElement didBeginHandleResponser:self];
}


- (void) viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [_tableElement willRegsinHandleResponser:self];
}


- (void) viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    [_tableElement didRegsinHandleResponser:self];
}


@end
