//
//  CustomBorderedButton.h
//  Squirrel
//
//  Created by Алексей  on 20.05.14.
//  Copyright (c) 2014 ArtOfWeb. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^ActionBlock)();

@interface CustomBorderedButton : UIButton
{
    UIColor* borderColorActive;
    UIColor* borderColorPassive;
    UIColor* bgColorActive;
    UIColor* bgColorPassive;
    UIColor* bgColorDisable;
    UIColor* borderColorDisable;
    CGFloat  borderWidth;
    ActionBlock _actionBlock;
}

-(void)setBaseState;
-(void) handleControlEvent:(UIControlEvents)event withBlock:(ActionBlock) action;

@end
