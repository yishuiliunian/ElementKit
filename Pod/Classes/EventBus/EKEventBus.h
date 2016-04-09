//
//  EKEventBus.h
//  Pods
//
//  Created by stonedong on 16/3/8.
//
//

#import <Foundation/Foundation.h>

@interface EKEventBus : NSObject

/**
 *  remove an event hanlder
 *
 *  @param handler  removed event handler
 *  @param selector the respone port , if nil will it remove all
 */
- (void) removeHandler:(id)handler prot:(SEL)selector;


- (void) addHandler:(id)handler priority:(CGFloat)priority port:(SEL)selector;


@end
