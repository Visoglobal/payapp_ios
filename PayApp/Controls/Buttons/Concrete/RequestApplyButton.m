//
//  YellowButton.m
//  Squirrel
//
//  Created by Алексей  on 20.05.14.
//  Copyright (c) 2014 ArtOfWeb. All rights reserved.
//

#import "RequestApplyButton.h"

#define borderPassive [UIColor clearColor]
#define borderActive [UIColor clearColor]
#define bgPassive [UIColor colorWithRed:(27/255.0) green:(117/255.0) blue:(131/255.0) alpha:1]
#define bgActive [UIColor colorWithRed:(118/255.0) green:(159/255.0) blue:(162/255.0) alpha:1]
#define bgDisable [UIColor colorWithRed:(201/255.0) green:(205/255.0) blue:(205/255.0) alpha:1]
#define titlePassive [UIColor colorWithRed:(255.0/255.0) green:(255.0/255.0) blue:(255.0/255.0) alpha:1]
#define titleActive [UIColor colorWithRed:(255.0/255.0) green:(255.0/255.0) blue:(255.0/255.0) alpha:1]


@implementation RequestApplyButton

- (void) awakeFromNib
{
    [self ajustView];
}

-(void) ajustView
{//Ω
    borderWidth = 1.0f;
    borderColorPassive = borderPassive;
    borderColorActive = borderActive;
    [self setTitleColor:titlePassive forState:UIControlStateNormal];
    [self setTitleColor:titleActive forState:UIControlStateHighlighted];
    [self.titleLabel setFont:regularFontWithSize(14)];
    bgColorPassive = bgPassive;
    bgColorActive = bgActive;
    bgColorDisable = bgDisable;
    [self setBaseState];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self ajustView];
    }
    return self;
}

@end
