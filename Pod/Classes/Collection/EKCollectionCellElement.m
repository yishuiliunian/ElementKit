//
//  EKCollectionCellElement.m
//  Pods
//
//  Created by stonedong on 16/4/9.
//
//

#import "EKCollectionCellElement.h"

@implementation EKCollectionCellElement

- (void) registeCellInfoToCollectionView:(UICollectionView*)collectionView
{
    [collectionView registerClass:_viewClass forCellWithReuseIdentifier:self.cellIdentify];
}

- (NSString*) cellIdentify
{
    if (!_cellIdentify) {
        _cellIdentify = NSStringFromClass(_viewClass);
    }
    return _cellIdentify;
}

- (void) loadContentWithCell:(UICollectionViewCell *)cell
{
    
}

@end
