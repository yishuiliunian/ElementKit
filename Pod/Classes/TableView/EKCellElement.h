//
//  EKCellElement.h
//  Pods
//
//  Created by stonedong on 16/2/9.
//
//

#import "EKElement.h"

@interface EKCellElement : EKElement
{
    __weak UITableView* _superTableView;
}
@property (nonatomic, strong, readonly) NSString* cellIdentifier;
@property (nonatomic,weak) UITableView* superTableView;


- (void) handleSelectedInViewController:(UIViewController*)vc;

@end
