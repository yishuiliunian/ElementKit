//
//  EKCellElement.m
//  Pods
//
//  Created by stonedong on 16/2/9.
//
//

#import "EKCellElement.h"

@implementation EKCellElement

- (instancetype) init
{
    self = [super init];
    if (!self) {
        return self;
    }
    _viewClass = UITableViewCell.class;
    return self;
}

- (NSString*) cellIdentifier
{
    return NSStringFromClass(_viewClass);
}

- (void) setSuperTableView:(UITableView *)superTableView
{
    if (_superTableView != superTableView) {
        _superTableView = superTableView;
        if (_viewClass) {
            [_superTableView registerClass:_viewClass forCellReuseIdentifier:self.cellIdentifier];
        }
    }
}



- (void) handleSelectedInViewController:(UIViewController *)vc
{
    
}

- (void) handleAction
{
    
}

@end
