//
//  YellowButton.m
//  Squirrel
//
//  Created by Алексей  on 20.05.14.
//  Copyright (c) 2014 ArtOfWeb. All rights reserved.
//

#import "ClearButton.h"

#define borderPassive [UIColor clearColor]
#define borderActive [UIColor clearColor]
#define bgPassive [UIColor clearColor]
#define bgActive [UIColor clearColor]
#define titlePassive [UIColor colorWithRed:(0/255.0) green:(151/255.0) blue:(172/255.0) alpha:1]
#define titleActive [UIColor colorWithRed:(0/255.0) green:(151/255.0) blue:(172/255.0) alpha:1]


@implementation ClearButton

- (void) awakeFromNib
{
    [self ajustView];
}

-(void) ajustView
{
    borderWidth = 1.0f;
    borderColorPassive = borderPassive;
    borderColorActive = borderActive;
    [self setTitleColor:titlePassive forState:UIControlStateNormal];
    [self setTitleColor:titleActive forState:UIControlStateHighlighted];
    [self.titleLabel setFont:regularFontWithSize(18)];
    bgColorPassive = bgPassive;
    bgColorActive = bgActive;
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
