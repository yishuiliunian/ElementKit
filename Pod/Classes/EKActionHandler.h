//
//  EKActionHandler.h
//  Pods
//
//  Created by stonedong on 16/2/10.
//
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@class EKAction;
@protocol EKActionHandler <NSObject>
@property (nonatomic, weak) id<EKActionHandler> nextResponser;
- (void) ekHandleAction:(EKAction*)action fromView:(UIView*)view;

@end
