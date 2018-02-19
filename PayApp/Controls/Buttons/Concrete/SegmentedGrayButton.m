//
//  YellowButton.m
//  Squirrel
//
//  Created by Алексей  on 20.05.14.
//  Copyright (c) 2014 ArtOfWeb. All rights reserved.
//

#import "SegmentedGrayButton.h"

#define borderPassive [UIColor colorWithRed:(28/255.0) green:(117/255.0) blue:(130/255.0) alpha:1]
#define borderActive [UIColor colorWithRed:(28/255.0) green:(117/255.0) blue:(130/255.0) alpha:1]

#define bgPassive [UIColor clearColor]
#define bgActive [UIColor colorWithRed:(33/255.0) green:(138/255.0) blue:(153/255.0) alpha:1]

#define titlePassive [UIColor colorWithRed:(0/255.0) green:(151/255.0) blue:(172/255.0) alpha:1]
#define titleActive [UIColor whiteColor]


@implementation SegmentedGrayButton

- (void) awakeFromNib
{
    [self ajustButton];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self ajustButton];
    }
    return self;
}

- (id)init
{
    self = [super init];
    if (self) {
        [self ajustButton];
    }
    return self;
}

-(void)setHighlighted:(BOOL)highlighted{
    
}

-(void) ajustButton{
    borderWidth = 2.0f;
    borderColorPassive = borderPassive;
    borderColorActive = borderActive;
    [self setTitleColor:titlePassive forState:UIControlStateNormal];
    [self setTitleColor:titleActive forState:UIControlStateHighlighted];
    [self setTitleColor:titleActive forState:UIControlStateSelected];
    
    [self.titleLabel setFont:regularFontWithSize(15)];
    [self.titleLabel setNumberOfLines:0];
    [self.titleLabel setTextAlignment:NSTextAlignmentCenter];
    bgColorPassive = bgPassive;
    bgColorActive = bgActive;
    [self setBaseState];
}

@end
