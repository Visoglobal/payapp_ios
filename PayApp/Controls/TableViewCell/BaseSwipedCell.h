//
//  BaseSwipedCell.h
//  PayApp
//
//  Created by Alexey on 17.12.15.
//  Copyright © 2015 Alexey. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseReusableCell.h"

@class BaseSwipedCell;

@protocol BaseSwipedCellDelegate <NSObject>

- (void)cellItemDeleteClicked:(BaseSwipedCell*)cell;
- (void)cellItemEditeClicked:(BaseSwipedCell*)cell;

@end

@interface BaseSwipedCell : BaseReusableCell
{
    BOOL animated;
    BOOL isHidden;
    UIView* buttonsView;
}

@property (nonatomic, assign) id <BaseSwipedCellDelegate> delegate;
-(void)updateItems;

@end
