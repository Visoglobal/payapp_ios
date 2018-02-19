//
//  YellowButton.m
//  Squirrel
//
//  Created by Алексей  on 20.05.14.
//  Copyright (c) 2014 ArtOfWeb. All rights reserved.
//

#import "MainButton.h"

#define borderPassive [UIColor whiteColor]
#define borderActive [UIColor colorWithRed:(28/255.0) green:(117/255.0) blue:(130/255.0) alpha:1]
#define bgPassive [UIColor whiteColor]
#define bgActive [UIColor colorWithRed:(0/255.0) green:(128/255.0) blue:(146/255.0) alpha:1]
#define titlePassive [UIColor colorWithRed:(0/255.0) green:(151/255.0) blue:(172/255.0) alpha:1]
#define titleActive [UIColor whiteColor]


@implementation MainButton

- (void) awakeFromNib
{
    [self ajustView];
}

-(void) ajustView
{
    borderWidth = 1.0f;
    self.layer.cornerRadius = 4;
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
