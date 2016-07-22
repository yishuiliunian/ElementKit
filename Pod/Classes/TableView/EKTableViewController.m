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
    UITableView* _responseTableView;
}

- (instancetype) initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (!self) {
        return self;
    }
    return self;
}
- (instancetype) initWithElement:(EKTableElement *)element
{
    self = [self initWithNibName:nil bundle:nil];
    if (!self) {
        return self;
    }
    _eventBus = [EKEventBus new];
    self.eventBus = _eventBus;
    _tableElement = element;
    _tableElement.eventBus = _eventBus;
    _tableElement.dataController.element = _tableElement;
    _tableElement.env = self;
    return self;
}
- (UITableView*) tableView{
    if (!_responseTableView) {
        _responseTableView = [_tableElement createResponser];
    }
    return _responseTableView;
}

- (void) loadView
{
    UITableView* tableView = self.tableView;
    self.view = tableView;
}

- (DZAdjustTableView*) adjustTableView
{
    return (DZAdjustTableView*) self.tableView;
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


- (void) viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [_tableElement didBeginHandleResponser:self];
}

- (void) viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [_tableElement willRegsinHandleResponser:self];
}
- (void) viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    [_tableElement didRegsinHandleResponser:self];
}


@end
