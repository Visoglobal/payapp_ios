//
//  DetailPlaceDataScroll.h
//  MobileBank
//
//  Created by админ on 27.06.13.
//  Copyright (c) 2013 админ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AutoDataScroll : UIScrollView
{
    CGFloat newItemOrignY;
}

- (void) addItem:(UIView*)_item;
- (void) clearScroll;
- (CGFloat) getCurrentPositionY;
@end
