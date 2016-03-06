//
//  EKTableChange.h
//  Pods
//
//  Created by stonedong on 16/2/10.
//
//

#import <Foundation/Foundation.h>
#import "EKIndexPath.h"
#ifndef __EKIndexPath
#define __EKIndexPath
@class EKCellElement;
@interface EKTableChange : NSObject
@property (nonatomic, strong) EKCellElement* element;
@property (nonatomic, assign) EKIndexPath indexPath;
@end

FOUNDATION_STATIC_INLINE EKTableChange* EKTC(EKCellElement* element, EKIndexPath indexPath ) {
    EKTableChange* c = [EKTableChange new];
    c.element = element;
    c.indexPath = indexPath;
    return c;
}
#endif
