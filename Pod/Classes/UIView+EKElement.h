//
//  UIView+EKElement.h
//  Pods
//
//  Created by stonedong on 16/2/10.
//
//

#import <UIKit/UIKit.h>
#import "EKActionHandler.h"
@class EKElement;
@interface UIView (EKElement)
@property (nonatomic, weak) id<EKActionHandler> ekActionResponser;

@end
