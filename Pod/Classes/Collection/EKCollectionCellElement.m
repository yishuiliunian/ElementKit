//
//  EKCollectionCellElement.m
//  Pods
//
//  Created by stonedong on 16/4/9.
//
//

#import "EKCollectionCellElement.h"

@implementation EKCollectionCellElement

- (instancetype) init
{
    self = [super init];
    if (!self) {
        return self;
    }
    _viewClass = [UICollectionViewCell class];
    return self;
}
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
- (UIViewController*) hostViewController
{
    if ([self.superCollectionView.nextResponder isKindOfClass:[UIViewController class]]) {
        return (UIViewController*)self.superCollectionView.nextResponder;
    }
    return nil;
}


@end
