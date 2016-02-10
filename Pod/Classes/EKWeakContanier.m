//
//  EKWeakContanier.m
//  Pods
//
//  Created by stonedong on 16/2/9.
//
//

#import "EKWeakContanier.h"
#import <objc/runtime.h>
@interface EKWeakContanier : NSObject
@property (nonatomic, weak) id object;
@end
@implementation EKWeakContanier
@end


void EKStoreWeakValue(NSObject* container, void* key ,id value){
    EKWeakContanier* weakC = [EKWeakContanier new];
    weakC.object = value;
    
    objc_setAssociatedObject(container, key, weakC, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

id EKGetWekaValue(NSObject* container, void* key)
{
    return objc_getAssociatedObject(container, key);
}




@implementation NSObject(WeakContainer)

- (void) ekSetWeakValue:(id)value forKey:(void *)key
{
    EKStoreWeakValue(self, key, value);
}

- (id) ekGetWeakValueForKey:(void *)key
{
    return EKGetWekaValue(self, key);
}

@end


