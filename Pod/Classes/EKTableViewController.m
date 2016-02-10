//
//  EKTableViewController.m
//  Pods
//
//  Created by stonedong on 16/2/10.
//
//

#import "EKTableViewController.h"
#import "EKTableElement.h"
@implementation EKTableViewController


- (instancetype) initWithStyle:(UITableViewStyle)style element:(EKTableElement *)element
{
    self = [self initWithStyle:style];
    if (!self) {
        return self;
    }
    _tableElement = element;
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
    NSAssert(_tableElement, @"table element is nil");
    self.view = [_tableElement createView];
    NSAssert([self.view isKindOfClass:UITableView.class], @"can't init the root table view with %@",self.view);
    UITableView* tableView = (UITableView*)self.view;
    self.tableView = tableView;
}

- (void) viewDidLoad
{
    [super viewDidLoad];
}


- (void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [_tableElement willDisplayView:self.tableView];
}

- (void) viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [_tableElement willEndDisplayView:self.tableView];
}


- (void) viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [_tableElement didDisplayView:self.tableView];
}

- (void) viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    [_tableElement didEndDisplayView:self.tableView];
}


@end
