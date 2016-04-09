//
//  EKCollectionElement.m
//  Pods
//
//  Created by stonedong on 16/4/9.
//
//

#import "EKCollectionElement.h"
#import "EKCollectionCellElement.h"
#import "EKIndexPath.h"
#import "EKTableDataController.h"
@implementation EKCollectionElement
{
    BOOL _firstDisplay;
}
- (instancetype) init
{
    self = [super init];
    if (!self) {
        return self;
    }
    _firstDisplay = YES;
    _dataController = [EKTableDataController new];
    return self;
}
- (void) reloadData
{
    [_dataController map:^(EKCollectionCellElement* e) {
        [e registeCellInfoToCollectionView:self.collectionView];
    }];
    [self.collectionView reloadData];
}

- (UICollectionView*) collectionView
{
    return [(UICollectionViewController*)self.uiEventPool collectionView];
}

- (UIResponder*) createResponser
{
    UICollectionView* collectionView = [[UICollectionView alloc] initWithFrame:[UIScreen mainScreen].bounds collectionViewLayout:[UICollectionViewFlowLayout new]];
    collectionView.delegate = self;
    collectionView.dataSource = self;
    return collectionView;
}

- (NSInteger) collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [_dataController numberAtSection:section];
}

- (NSInteger) numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return _dataController.numberOfSections;
}

- (UICollectionViewCell*) collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    EKCollectionCellElement* element = [_dataController objectAtIndexPath:EKIndexPathFromNS(indexPath)];
    NSString* identify = element.cellIdentify;
    UICollectionViewCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:identify forIndexPath:indexPath];
    [element loadContentWithCell:cell];
    return cell;
}

- (void) collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath
{
    EKCollectionCellElement* element = [_dataController objectAtIndexPath:EKIndexPathFromNS(indexPath)];
    [element willBeginHandleResponser:cell];
    [element didBeginHandleResponser:cell];
}

- (void) collectionView:(UICollectionView *)collectionView didEndDisplayingCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath
{
    EKCollectionCellElement* element = [_dataController objectAtIndexPath:EKIndexPathFromNS(indexPath)];
    [element willRegsinHandleResponser:cell];
    [element didRegsinHandleResponser:cell];
}



#pragma EK element life circle

- (void) willBeginHandleResponser:(UIResponder *)responser
{
    [super willBeginHandleResponser:responser];
    if (_firstDisplay) {
        [self reloadData];
        _firstDisplay = NO;
    }
}

@end
