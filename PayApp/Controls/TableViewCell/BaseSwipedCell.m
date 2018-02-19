//
//  BaseSwipedCell.m
//  PayApp
//
//  Created by Alexey on 17.12.15.
//  Copyright © 2015 Alexey. All rights reserved.
//

#import "BaseSwipedCell.h"

@implementation BaseSwipedCell

- (void) applyDesign
{
        buttonsView = [[UIView alloc] initWithFrame:CGRectMake(self.frame.size.width, 0, 70, self.frame.size.height)];
        UIButton* editButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 5, buttonsView.frame.size.width, buttonsView.frame.size.height/2-5)];
        [editButton setBackgroundImage:[UIImage imageNamed:@"payapp_menu_vost_dop_butt_red.png"] forState:UIControlStateNormal];
        [editButton setBackgroundImage:[UIImage imageNamed:@"payapp_menu_vost_dop_butt_red_hover.png"] forState:UIControlStateHighlighted];
        [editButton setBackgroundImage:[UIImage imageNamed:@"payapp_menu_vost_dop_butt_red_hover.png"] forState:UIControlStateSelected];
        [editButton addTarget:self action:@selector(editButtonClick) forControlEvents:UIControlEventTouchUpInside];
        
        UIButton* deleteButton = [[UIButton alloc] initWithFrame:CGRectMake(0, buttonsView.frame.size.height/2-1, buttonsView.frame.size.width, buttonsView.frame.size.height/2-6)];
        [deleteButton setBackgroundImage:[UIImage imageNamed:@"payapp_menu_vost_dop_butt_kill.png"] forState:UIControlStateNormal];
        [deleteButton setBackgroundImage:[UIImage imageNamed:@"payapp_menu_vost_dop_butt_kill_hover.png"] forState:UIControlStateHighlighted];
        [deleteButton setBackgroundImage:[UIImage imageNamed:@"payapp_menu_vost_dop_butt_kill_hover.png"] forState:UIControlStateSelected];
        [deleteButton addTarget:self action:@selector(deleteButtonlCick) forControlEvents:UIControlEventTouchUpInside];
        
        [buttonsView addSubview:editButton];
        [buttonsView addSubview:deleteButton];
        [self addSubview:buttonsView];
        isHidden = YES;
}

-(void)updateItems
{
        buttonsView.frame = CGRectMake(self.frame.size.width, 0, buttonsView.frame.size.width, buttonsView.frame.size.height);
        self.contentView.frame = CGRectMake(0, self.contentView.frame.origin.y, self.contentView.frame.size.width, self.contentView.frame.size.height);
}

-(void)deleteButtonlCick
{
    if ([self.delegate respondsToSelector:@selector(cellItemDeleteClicked:)])
        [self.delegate cellItemDeleteClicked:self];
}

-(void)editButtonClick
{
    if ([self.delegate respondsToSelector:@selector(cellItemEditeClicked:)])
        [self.delegate cellItemEditeClicked:self];
}

-(IBAction)swipe:(UISwipeGestureRecognizer*)sender
{
    
        if (!animated&&((sender.direction == UISwipeGestureRecognizerDirectionRight && !isHidden) || (sender.direction == UISwipeGestureRecognizerDirectionLeft && isHidden)))
        {
            animated = YES;
    
            if (isHidden) {
    
                buttonsView.frame = CGRectMake(self.frame.size.width, 0, buttonsView.frame.size.width, buttonsView.frame.size.height);
                self.contentView.frame = CGRectMake(0, self.contentView.frame.origin.y, self.contentView.frame.size.width, self.contentView.frame.size.height);
    
                [UIView animateWithDuration:0.1 delay:0 options:UIViewAnimationOptionBeginFromCurrentState | UIViewAnimationOptionCurveEaseInOut animations:^{
                    buttonsView.frame = CGRectMake(self.frame.size.width-buttonsView.frame.size.width-10, 0, buttonsView.frame.size.width, buttonsView.frame.size.height);
                    self.contentView.frame = CGRectMake(-(buttonsView.frame.size.width), self.contentView.frame.origin.y, self.contentView.frame.size.width, self.contentView.frame.size.height);
                } completion:^(BOOL finished) {
                    isHidden = NO;
                    animated = NO;
                }];
    
            }else{
    
                buttonsView.frame = CGRectMake(self.frame.size.width-buttonsView.frame.size.width, 0, buttonsView.frame.size.width, buttonsView.frame.size.height);
                self.contentView.frame = CGRectMake(-(buttonsView.frame.size.width+10), self.contentView.frame.origin.y, self.contentView.frame.size.width, self.contentView.frame.size.height);
                [UIView animateWithDuration:0.1 delay:0 options:UIViewAnimationOptionBeginFromCurrentState | UIViewAnimationOptionCurveEaseInOut animations:^{
                    buttonsView.frame = CGRectMake(self.frame.size.width, 0, buttonsView.frame.size.width, buttonsView.frame.size.height);
                    self.contentView.frame = CGRectMake(0, self.contentView.frame.origin.y, self.contentView.frame.size.width, self.contentView.frame.size.height);
                } completion:^(BOOL finished) {
                    isHidden = YES;
                    animated = NO;
                }];
    
            }
    
        }
}


@end
