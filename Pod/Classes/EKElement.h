//
//  EKElement.h
//  Pods
//
//  Created by stonedong on 16/2/9.
//
//

#import <Foundation/Foundation.h>
#import "EKActionHandler.h"

@interface EKElement : NSObject <EKActionHandler>
{
    Class _viewClass;
}
@property (nonatomic, weak, readonly) UIView* displayView;

- (UIView*) createView;
- (void) willDisplayView:(UIView*)view;
- (void) didDisplayView:(UIView*)view;
- (void) willEndDisplayView:(UIView*)view;
- (void) didEndDisplayView:(UIView*)view;
@end
