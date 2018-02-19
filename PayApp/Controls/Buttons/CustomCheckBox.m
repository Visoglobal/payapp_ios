//
//  YellowButton.m
//  Squirrel
//
//  Created by Алексей  on 20.05.14.
//  Copyright (c) 2014 ArtOfWeb. All rights reserved.
//

#import "CustomCheckBox.h"
#define selectedImage [UIImage imageNamed:@"payapp_menu_vost_chekup.png"]
#define unselectedImage [UIImage imageNamed:@"payapp_menu_vost_chek.png"]

@implementation CustomCheckBox

- (void) awakeFromNib
{
    
    borderWidth = 0;
    bgColorPassive = [UIColor clearColor];
    bgColorActive = [UIColor clearColor];
    [self setImage:selectedImage forState:UIControlStateSelected];
    [self setImage:unselectedImage forState:UIControlStateNormal];
    [self centerButtonAndImageWithSpacing:10];
    [self setBaseState];
}

-(id)init
{
    self = [super init];
    if (self) {
        [self awakeFromNib];
    }
    return self;
}

-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self awakeFromNib];
    }
    return self;
}

-(void)setHighlighted:(BOOL)highlighted{
    if (!highlighted){
        self.selected = !self.selected;
    }
}

- (void)centerButtonAndImageWithSpacing:(CGFloat)spacing {
    CGFloat insetAmount = spacing / 2.0;
    self.imageEdgeInsets = UIEdgeInsetsMake(0, -insetAmount, 0, insetAmount);
    self.titleEdgeInsets = UIEdgeInsetsMake(0, insetAmount, 0, -insetAmount);
    self.contentEdgeInsets = UIEdgeInsetsMake(0, insetAmount, 0, insetAmount);
    self.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
}
@end
