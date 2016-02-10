//
//  EKWeakContanier.h
//  Pods
//
//  Created by stonedong on 16/2/9.
//
//

#import <Foundation/Foundation.h>

@interface NSObject (WeakContainer)
- (void) ekSetWeakValue:(id)value forKey:(void*)key;
- (id) ekGetWeakValueForKey:(void*)key;
@end
