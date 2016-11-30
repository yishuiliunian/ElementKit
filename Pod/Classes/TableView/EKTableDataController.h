//
//  EKTableDataController.h
//  Pods
//
//  Created by stonedong on 16/2/9.
//
//

#import <Foundation/Foundation.h>

#import "EKIndexPath.h"

NS_ASSUME_NONNULL_BEGIN
@class EKElement;
@interface EKTableDataController : NSObject <NSCopying, NSFastEnumeration>
@property (nonatomic, assign, readonly) NSInteger numbersOfObject;
@property (nonatomic, weak) id element;

- (NSInteger) numberOfSections;
- (NSInteger) numberAtSection:(EKSection)section;

- (id<NSObject>) objectAtIndexPath:(EKIndexPath)indexPath;
- (NSArray*) objectsForSections:(EKSection)section;
- (EKIndexPath) addObject:(id)anObject;
- (EKIndexPath) addObject:(id)anObject atSection:(EKSection)sectioin;
- (EKIndexPath) insertObject:(id)anObject atRow:(EKRow)row atSection:(EKSection)section;
- (void) updateObject:(id)anObject atIndexPath:(EKIndexPath)indexPath;
- (void) clean;
- (void) map:(void(^)(id e))map;
- (NSIndexPath*)indexPathOfObject:(id)anobject;
- (void) updateObjects:(NSArray*)array;
- (void) updateSectionObjects:(NSArray*)sectionsArray;
/**
 *  直接替换指定section位置的所有元素
 *
 *  @param array 将要替换的元素列表
 *  @param index 制定的Section
 */
- (BOOL) replaceObjects:(NSArray *)array atSection:(NSInteger)index;

/**
 *  更新指定Section位置的元素，如果改元素存在则进行替换操作，如果不存在则插入到末尾位置
 *
 *  @param array 将要更新的元素列表
 *  @param index 指定的Section位置
 */
- (void) updateObjects:(NSArray *)array atSection:(NSInteger)index;
- (void) changeObjectToFirst:(id)object;
- (NSObject*) removeObjectAtIndexPath:(EKIndexPath)indexPath;

- (NSArray*) insertHeaderObjects:(NSArray *)objects atSection:(NSInteger)section;
//
- (BOOL) containsObject:(EKElement*)element;

/**
 *  排序
 *
 *  @param block 使用的block
 */
- (void) sortUseBlock:(NSComparisonResult(^)(id  _Nonnull obj1, id  _Nonnull obj2))block;


/**
 *  遍历存储在DataController中的所有的元素
 *
 *  @param map 对元素进行操作或者检查元素的特定属性
 */
- (void)  traverse:(void(^)(id e, int section ,int row, bool* willStop))map;
@end
NS_ASSUME_NONNULL_END
