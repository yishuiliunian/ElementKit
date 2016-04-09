//
//  EKCollectionViewController.h
//  Pods
//
//  Created by stonedong on 16/4/9.
//
//

#import <UIKit/UIKit.h>

@class EKCollectionElement;
@interface EKCollectionViewController : UIViewController
{
    EKCollectionElement* _element;
}
@property (nonatomic, strong) UICollectionView* collectionView;
- (instancetype) initWithElement:(EKCollectionElement*)element;
@end
