//
//  EKTableDataController.m
//  Pods
//
//  Created by stonedong on 16/2/9.
//
//

#import "EKTableDataController.h"

#import "EKEventBus.h"
#import "NSObject+EventBus.h"

@implementation EKTableDataController
{
    NSMutableArray* _dataArray;
}

@synthesize element = _element;
- (instancetype) init
{
    self = [super init];
    if (!self) {
        return self;
    }
    _dataArray = [NSMutableArray new];
    return self;
}

- (void) setSectionData:(NSArray*)array
{
    _dataArray = [NSMutableArray new];
    for (NSArray* a  in array) {
        [_dataArray addObject:[NSMutableArray arrayWithArray:a]];
    }
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
    [anObject setEventBus:[_element eventBus]];
    return path;
}

- (EKIndexPath) addObject:(id)anObject atSection:(EKSection)sectioin
{
    if (sectioin == _dataArray.count) {
        [_dataArray addObject:[NSMutableArray new]];
    }
    [(NSMutableArray*)[_dataArray objectAtIndex:sectioin] addObject:anObject];
    EKIndexPath path;
    path.section = sectioin;
    path.row = [_dataArray[sectioin] count] - 1;
    [anObject setEventBus:[_element eventBus]];
    return path;
}
- (void) updateObject:(id)anObject atIndexPath:(EKIndexPath)indexPath
{
    _dataArray[indexPath.section][indexPath.row] = anObject;
    [anObject setEventBus:[_element eventBus]];
}

- (void) updateObjects:(NSArray *)array
{
    if (_dataArray.count ==0) {
        [_dataArray addObject:[NSMutableArray new]];
    }
    NSMutableArray* willInsertArray=_dataArray.lastObject;
    for (EKElement* el in array) {
        if (![willInsertArray containsObject:el]) {
            [willInsertArray addObject:el];
        }
    }
    [self map:^(id e) {
        [e setEventBus:[_element eventBus]];
    }];
}

- (void) sortUseBlock:(NSComparisonResult(^)(id  _Nonnull obj1, id  _Nonnull obj2))block
{
    for (NSMutableArray* array in _dataArray) {
        [array sortUsingComparator:block];
    }
}
- (void) clean
{
    _dataArray = [NSMutableArray new];
}

- (void) map:(void (^)(id  e))map
{
    if (!map) {
        return;
    }

    for (NSArray* array  in _dataArray) {
        for (EKElement* e in array) {
            map(e);
        }
    }
}

- (NSInteger) numbersOfObject
{
    int num = 0;
    for (NSArray* array in _dataArray) {
        num += array.count;
    }
    return num;
}

- (NSIndexPath*)indexPathOfObject:(id)anobject
{
    for (int i = 0; i < _dataArray.count ; i++) {
        NSArray* eles = _dataArray[i];
        for (int j = 0; j < eles.count; j++) {
            if (anobject == eles[j]) {
                return [NSIndexPath indexPathForRow:j inSection:i];
            }
        }
    }
    return [NSIndexPath indexPathForRow:NSNotFound inSection:NSNotFound];
}

- (instancetype) copyWithZone:(NSZone *)zone
{
    EKTableDataController* dataController = [[EKTableDataController allocWithZone:zone] init];
    [dataController setSectionData:_dataArray];
    return dataController;
}

- (void) updateObjects:(NSArray *)array atSection:(NSInteger)index
{
    NSAssert(index <= _dataArray.count, @"数据越界了");
    NSMutableArray * datas = [NSMutableArray arrayWithArray:array];
    if (index == _dataArray.count) {
        [_dataArray addObject:datas];
    } else {
        _dataArray[index] = datas;
    }
    
    for (id e  in array) {
        [e setEventBus:self.eventBus];
    }
}

- (void) changeObjectToFirst:(id)object
{
    if (_dataArray.count == 0 || [_dataArray[0] count] == 0) {
        [self addObject:object];
    } else {
        NSMutableArray* array = _dataArray[0];
        NSInteger index = [array indexOfObject:object];
        if (index != NSNotFound) {
            [array exchangeObjectAtIndex:0 withObjectAtIndex:index];
        } else {
            [array insertObject:object atIndex:0];
        }
    }
}
@end
