//
//  EKAction.h
//  Pods
//
//  Created by stonedong on 16/2/10.
//
//

#import <Foundation/Foundation.h>

@interface EKAction : NSObject
@property (nonatomic, strong, readonly) NSString* type;
@property (nonatomic, strong, readonly) NSArray* playload;
@property (nonatomic, assign, readonly) SEL selector;

+ (instancetype) new UNAVAILABLE_ATTRIBUTE;
- (instancetype) init UNAVAILABLE_ATTRIBUTE;
- (instancetype) initWithSEL:(NSString*)selector;
- (instancetype) initWithSEL:(NSString *)selector playload:(NSArray*)playLoad;
@end
