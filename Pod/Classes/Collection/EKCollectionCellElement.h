//
//  EKCollectionCellElement.h
//  Pods
//
//  Created by stonedong on 16/4/9.
//
//

#import "EKElement.h"

@interface EKCollectionCellElement : EKElement
{
    NSString* _cellIdentify;
}
@property (nonatomic, strong, readonly) NSString* cellIdentify;
@property (nonatomic,weak) UICollectionView* superCollectionView;
@property (nonatomic, weak, readonly) UIViewController* hostViewController;
- (void) registeCellInfoToCollectionView:(UICollectionView*)collectionView;
- (void) loadContentWithCell:(UICollectionViewCell*)cell;
- (UIResponder*) createResponser UNAVAILABLE_ATTRIBUTE;
@end
