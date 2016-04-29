//
//  EKTabBarViewController.h
//  Pods
//
//  Created by stonedong on 16/4/28.
//
//

#import <UIKit/UIKit.h>
@class EKElement;
@interface EKTabBarViewController : UITabBarController
@property (nonatomic, strong, readonly) EKElement* element;
- (instancetype) init  UNAVAILABLE_ATTRIBUTE;
- (instancetype) initWithElement:(EKElement*)element;
@end
