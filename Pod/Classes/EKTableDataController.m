//
//  EKTableDataController.m
//  Pods
//
//  Created by stonedong on 16/2/9.
//
//

#import "EKTableDataController.h"



@implementation EKTableDataController
{
    NSMutableArray* _dataArray;
}

- (instancetype) init
{
    self = [super init];
    if (!self) {
        return self;
    }
    _dataArray = [NSMutableArray new];
    return self;
}
- (NSInteger) numberOfSections
{
    return [_dataArray count];
}
- (NSInteger) numberAtSection:(EKSection)section
{
    return [[_dataArray objectAtIndex:section] count];
}
- (id<NSObject>) objectAtIndexPath:(EKIndexPath)indexPath
{
    return _dataArray[indexPath.section][indexPath.row];
}
- (NSArray*) objectsForSections:(EKSection)section
{
    return _dataArray[section];
}
- (EKIndexPath) addObject:(id)anObject
{
    if (_dataArray.lastObject) {
        [(NSMutableArray*)_dataArray.lastObject addObject:anObject];
    } else {
        NSMutableArray* array = [NSMutableArray new];
        [array addObject:anObject];
        [_dataArray addObject:array];
    }
    
    EKIndexPath path;
    path.section = self.numberOfSections - 1;
    path.row = [self numberAtSection:path.section] - 1;
    return path;
}
- (EKIndexPath) addObject:(id)anObject atSection:(EKSection)sectioin
{
    [(NSMutableArray*)[_dataArray objectAtIndex:sectioin] addObject:anObject];
    EKIndexPath path;
    path.section = sectioin;
    path.row = [_dataArray[sectioin] count] - 1;
    return path;
}
- (void) updateObject:(id)anObject atIndexPath:(EKIndexPath)indexPath
{
    _dataArray[indexPath.section][indexPath.row] = anObject;
}
- (void) clean
{
    _dataArray = [NSMutableArray new];
}

@end
