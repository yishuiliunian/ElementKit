//
//  EKElement.h
//  Pods
//
//  Created by stonedong on 16/2/9.
//
//

#import <Foundation/Foundation.h>
#import "EKActionHandler.h"

@protocol  EKUIResponseHandler<NSObject>
- (UIResponder*) createResponser;
- (void) willBeginHandleResponser:(UIResponder*)responser;
- (void) didBeginHandleResponser:(UIResponder*)responser;
- (void) willRegsinHandleResponser:(UIResponder*)responser;
- (void) didRegsinHandleResponser:(UIResponder*)responser;

@end



@interface EKElement : NSObject <EKActionHandler, EKUIResponseHandler>
{
    Class _viewClass;
}
@property (nonatomic, weak, readonly) UIResponder* uiEventPool;

@end
