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
- (id) createResponser;

@property (nonatomic, weak, readonly) UIResponder* uiEventPool;
@end

#pragma Add Child Element
@interface EKElement ()
@property (nonatomic, strong, readonly) NSArray* allChildElement;
- (void) addChildElement:(EKElement*)element;
@end

#pragma Child Element Functions

@interface EKElement ()
/* if the element will be sorted, to return this
 * */
@property (nonatomic, assign, readonly) int64_t compareIdentifier;
@property (nonatomic, weak) EKElement* superElement;
- (void) removeFromeSuper;
@end



@interface UIResponder (ElementXX)
@property (nonatomic, weak) EKElement* attachedElement;
@end
