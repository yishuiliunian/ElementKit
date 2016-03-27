//
//  EKAdjustTableElement.m
//  Pods
//
//  Created by stonedong on 16/3/8.
//
//

#import "EKAdjustTableElement.h"
#import "EKAdjustCellElement.h"
@implementation EKAdjustTableElement

- (instancetype) init
{
    self = [super init];
    if (!self) {
        return self;
    }
    _defaultCellHeight = 44;
    return self;

}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    EKElement* ele = (EKElement*)[_dataController objectAtIndexPath:EKIndexPathFromNS(indexPath)];
    if ([ele respondsToSelector:@selector(cellHeight)]) {
        return [(EKAdjustCellElement*)ele  cellHeight];
    } else {
        return _defaultCellHeight;
    }
}

@end
