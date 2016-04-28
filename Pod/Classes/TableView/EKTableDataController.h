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
@interface EKTableDataController : NSObject
@property (nonatomic, assign, readonly) NSInteger numbersOfObject;
@property (nonatomic, weak) id element;

- (NSInteger) numberOfSections;
- (NSInteger) numberAtSection:(EKSection)section;

- (id<NSObject>) objectAtIndexPath:(EKIndexPath)indexPath;
- (NSArray*) objectsForSections:(EKSection)section;
- (EKIndexPath) addObject:(id)anObject;
- (EKIndexPath) addObject:(id)anObject atSection:(EKSection)sectioin;
- (void) updateObject:(id)anObject atIndexPath:(EKIndexPath)indexPath;
- (void) clean;
- (void) map:(void(^)(id e))map;
- (NSIndexPath*)indexPathOfObject:(id)anobject;
- (void) updateObjects:(NSArray*)array;
- (void) updateSectionObjects:(NSArray*)sectionsArray;
@end
