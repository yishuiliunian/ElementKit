//
//  EKTableDataController.h
//  Pods
//
//  Created by stonedong on 16/2/9.
//
//

#import <Foundation/Foundation.h>

#import "EKIndexPath.h"



@interface EKTableDataController : NSObject

- (NSInteger) numberOfSections;
- (NSInteger) numberAtSection:(EKSection)section;

- (id<NSObject>) objectAtIndexPath:(EKIndexPath)indexPath;
- (NSArray*) objectsForSections:(EKSection)section;
- (EKIndexPath) addObject:(id)anObject;
- (EKIndexPath) addObject:(id)anObject atSection:(EKSection)sectioin;
- (void) updateObject:(id)anObject atIndexPath:(EKIndexPath)indexPath;
- (void) clean;
@end
