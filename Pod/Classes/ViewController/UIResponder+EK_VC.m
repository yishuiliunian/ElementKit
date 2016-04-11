//
//  UIResponder+EK_VC.m
//  Pods
//
//  Created by stonedong on 16/4/10.
//
//

#import "UIResponder+EK_VC.h"

@implementation UIResponder (EK_VC)
- (UIViewController*) responserViewController
{
    if ([self.nextResponder isKindOfClass:[UIViewController class]]) {
        return self.nextResponder;
    } else {
        if (self.nextResponder) {
            return [self.nextResponder responserViewController];
        } else {
            return nil;
        }
    }
}
@end
