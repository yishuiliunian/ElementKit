//
//  EKTableDataController.h
//  Pods
//
//  Created by stonedong on 16/2/9.
//
//

#import <Foundation/Foundation.h>

#import "EKIndexPath.h"


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
- (void) updateObjects:(NSArray *)array atSection:(NSInteger)index;
- (void) changeObjectToFirst:(id)object;

- (NSArray*) insertHeaderObjects:(NSArray *)objects atSection:(NSInteger)section;
//
- (BOOL) containsObject:(EKElement*)element;

/**
 *  排序
 *
 *  @param block 使用的block
 */
- (void) sortUseBlock:(NSComparisonResult(^)(id  _Nonnull obj1, id  _Nonnull obj2))block;
@end
