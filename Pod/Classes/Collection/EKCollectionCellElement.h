//
//  EKCollectionCellElement.h
//  Pods
//
//  Created by stonedong on 16/4/9.
//
//

#import <ElementKit/ElementKit.h>

@interface EKCollectionCellElement : EKElement
{
    NSString* _cellIdentify;
}
@property (nonatomic, strong, readonly) NSString* cellIdentify;
- (void) registeCellInfoToCollectionView:(UICollectionView*)collectionView;
- (void) loadContentWithCell:(UICollectionViewCell*)cell;
- (UIResponder*) createResponser UNAVAILABLE_ATTRIBUTE;
@end
