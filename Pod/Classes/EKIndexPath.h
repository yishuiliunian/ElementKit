//
//  EKIndexPath.h
//  Pods
//
//  Created by stonedong on 16/2/9.
//
//

#import <Foundation/Foundation.h>


typedef struct {
    long row;
    long section;
}EKIndexPath;

extern  const EKIndexPath EKIndexPathInvaild;

typedef long EKSection;
typedef long EKRow;


FOUNDATION_STATIC_INLINE  EKIndexPath EKIndexPathFromNS(NSIndexPath* indexPath) {
    return  (EKIndexPath){indexPath.row, indexPath.section};
}
