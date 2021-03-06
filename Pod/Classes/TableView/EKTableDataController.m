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
    if (_dataArray.count > section) {
        return [[_dataArray objectAtIndex:section] count];
    } else {
        return 0;
    }

}
- (id<NSObject>) objectAtIndexPath:(EKIndexPath)indexPath
{
    return _dataArray[indexPath.section][indexPath.row];
}
- (NSArray*) objectsForSections:(EKSection)section
{
    if (_dataArray.count > section) {
        return [_dataArray[section] copy];
    }
    return [NSArray array];
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

- (EKIndexPath) insertObject:(id)anObject atRow:(EKRow)row atSection:(EKSection)section
{
    NSAssert(section <= _dataArray.count, @"section越界");
    NSMutableArray* array = nil;
    if (section == _dataArray.count) {
        array = [NSMutableArray new];
        [_dataArray addObject:array];
    } else {
        array = _dataArray[section];
    }
    
    NSAssert(row <= array.count, @"row 越界");

    [array insertObject:anObject atIndex:row];

    EKIndexPath path = {row,section};
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
    for (EKElement* el in [array copy]) {
        if (![willInsertArray containsObject:el]) {
            [willInsertArray addObject:el];
        } else {
            NSInteger index = [willInsertArray indexOfObject:el];
            [willInsertArray replaceObjectAtIndex:index withObject:el];
        }
    }
    [self map:^(id e) {
        [e setEventBus:[_element eventBus]];
    }];
}

- (void) sortUseBlock:(NSComparisonResult(^)(id  _Nonnull obj1, id  _Nonnull obj2))block
{
    for (NSMutableArray* array in [_dataArray copy]) {
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

    for (NSArray* array  in [_dataArray copy]) {
        for (EKElement* e in [array copy]) {
            map(e);
        }
    }
}

- (void)  traverse:(void(^)(id e, int section ,int row, bool* willStop))map {
    if (!map) {
        return;
    }
    NSArray* dataArray = [_dataArray copy];
    for (int section = 0; section < dataArray.count; section++) {
        NSArray* sectionArray = [dataArray[section] copy];
        for (int row = 0; row < sectionArray.count; row++) {
            BOOL willStop = NO;
            id element = sectionArray[row];
            map(element, section, row, &willStop);
        }
    }
}


- (NSInteger) numbersOfObject
{
    int num = 0;
    for (NSArray* array in [_dataArray copy]) {
        num += array.count;
    }
    return num;
}

- (NSIndexPath*)indexPathOfObject:(id)anobject
{
    for (int i = 0; i < _dataArray.count ; i++) {
        NSArray* eles = _dataArray[i];
        for (int j = 0; j < eles.count; j++) {
            if ([anobject isEqual:eles[j]]) {
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

- (BOOL) replaceObjects:(NSArray *)array atSection:(NSInteger)index
{
    if (index >= _dataArray.count) {
        for (int i = _dataArray.count; i < index; i++) {
            [_dataArray addObject:[NSMutableArray new]];
        }
    }
    NSMutableArray * datas = [NSMutableArray arrayWithArray:array];
    BOOL insert = NO;
    if (index == _dataArray.count) {
        insert = YES;
        [_dataArray addObject:datas];
    } else {
        _dataArray[index] = datas;
    }
    
    for (id e  in array) {
        [e setEventBus:[_element eventBus]];
    }
    return insert;
}

- (void) updateObjects:(NSArray *)array atSection:(NSInteger)index
{
    NSAssert(index <= _dataArray.count, @"数据越界了");
    if (index == _dataArray.count) {
        NSMutableArray * datas = [NSMutableArray arrayWithArray:array];
        [_dataArray addObject:datas];
    } else {
        NSMutableArray* datas = _dataArray[index];
        for (id ele in array) {
            if ([datas containsObject:ele]) {
                NSInteger eleIndex = [datas indexOfObject:ele];
                [datas replaceObjectAtIndex:eleIndex withObject:ele];
            } else {
                [datas addObject:ele];
            }
        }
    }
    for (id e  in array) {
        [e setEventBus:[_element eventBus]];
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

- (BOOL) containsObject:(EKElement*)element
{
    __block BOOL contains = NO;
    [self map:^(id e) {
        if ([e isEqual:element]) {
            contains = YES;
        }
    }];
    return contains;
}

- (NSArray*) insertHeaderObjects:(NSArray *)objects atSection:(NSInteger)section
{
    NSAssert(section <= _dataArray.count, @"无法隔空插入");
    if (!objects.count) {
        return nil;
    }
    NSMutableArray* array = nil;
    if (section == _dataArray.count) {
        array = [NSMutableArray new];
        [_dataArray addObject:array];
    } else {
        array = _dataArray[section];
    }
    NSMutableArray* indexpaths = [NSMutableArray new];
    for (int i = 0; i < objects.count; i++) {
        [indexpaths addObject:[NSIndexPath indexPathForRow:i  inSection:section]];
    }
    for (NSObject* object in objects) {
        object.eventBus = [_element eventBus];
    }
    [array insertObjects:objects atIndexes:[NSIndexSet indexSetWithIndexesInRange:NSMakeRange(0, objects.count)]];
    return indexpaths;
}

- (NSUInteger)countByEnumeratingWithState:(NSFastEnumerationState *)state objects:(id __unsafe_unretained [])buffer count:(NSUInteger)len
{
    
}

- (NSObject*) removeObjectAtIndexPath:(EKIndexPath)indexPath
{
    NSObject* object;
    if (indexPath.section  >= _dataArray.count) {
        return nil;
    }
    NSMutableArray* array = _dataArray[indexPath.section];
    if (indexPath.row >= array.count) {
        return nil;
    }
    object = [array objectAtIndex:indexPath.row];
    [array removeObjectAtIndex:indexPath.row];
    if (array.count == 0) {
        [_dataArray removeObjectAtIndex:indexPath.section];
    }
    return object;
}

@end
