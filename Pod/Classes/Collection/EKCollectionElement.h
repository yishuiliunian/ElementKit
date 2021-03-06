//
//  EKCollectionElement.h
//  Pods
//
//  Created by stonedong on 16/4/9.
//
//

#import "EKElement.h"
#import <UIKit/UIKit.h>
@class EKTableDataController;
@interface EKCollectionElement : EKElement <UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>
{
    EKTableDataController* _dataController;
}
@property (nonatomic, weak, readonly) UICollectionView* collectionView;
@property (nonatomic, strong, readonly) EKTableDataController* dataController;
- (UICollectionViewLayout*) createCollectionLayout;
- (void) reloadData;

@end
