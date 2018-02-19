//
//  YellowButton.m
//  Squirrel
//
//  Created by Алексей  on 20.05.14.
//  Copyright (c) 2014 ArtOfWeb. All rights reserved.
//

#import "AuthorizeGrayButton.h"

#define borderPassive [UIColor colorWithRed:(153/255.0) green:(153/255.0) blue:(153/255.0) alpha:1]
#define borderActive [UIColor colorWithRed:(181/255.0) green:(137/255.0) blue:(10/255.0) alpha:1]
#define bgPassive [UIColor clearColor]
#define bgActive [UIColor colorWithRed:(242/255.0) green:(180/255.0) blue:(0/255.0) alpha:1]

@implementation AuthorizeGrayButton

- (void) awakeFromNib
{
    [self ajustView];
}

-(void) ajustView
{
    borderWidth = 1.0f;
    borderColorPassive = borderPassive;
    borderColorActive = borderActive;
    [self setTitleColor:borderPassive forState:UIControlStateNormal];
    [self setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
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
