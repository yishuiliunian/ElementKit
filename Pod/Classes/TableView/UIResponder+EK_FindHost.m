//
//  UIResponder+EK_FindHost.m
//  Pods
//
//  Created by stonedong on 16/7/1.
//
//

#import "UIResponder+EK_FindHost.h"

@implementation UIResponder (EK_FindHost)
- (UIViewController*) EK_HostViewController
{
    if ([self isKindOfClass:[UIViewController class]]) {
        return self;
    }
    if (self.nextResponder) {
        return self.nextResponder.EK_HostViewController;
    } else {
        return nil;
    }
}
@end
