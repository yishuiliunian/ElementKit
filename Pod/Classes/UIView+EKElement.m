//
//  UIView+EKElement.m
//  Pods
//
//  Created by stonedong on 16/2/10.
//
//

#import "UIView+EKElement.h"
#import "EKWeakContanier.h"

static void* kEKElementStoreKey = &kEKElementStoreKey;

@implementation UIView (EKElement)

- (id<EKActionHandler>) ekActionResponser
{
    return [self ekGetWeakValueForKey:kEKElementStoreKey];
}

- (void) setEkActionResponser:(id<EKActionHandler>)ekActionResponser
{
    [self ekSetWeakValue:ekActionResponser forKey:kEKElementStoreKey];
}

@end
