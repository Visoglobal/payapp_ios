//
//  CustomBorderedButton.m
//  Squirrel
//
//  Created by Алексей  on 20.05.14.
//  Copyright (c) 2014 ArtOfWeb. All rights reserved.
//

#import "CustomBorderedButton.h"
#import <QuartzCore/QuartzCore.h>

@implementation CustomBorderedButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        borderWidth = 1.5f;
        [self setBaseState];
    }
    return self;
}

-(void)setBaseState{
    if (borderColorPassive) {
        [[self layer] setBorderWidth:borderWidth];
        [[self layer] setBorderColor:[borderColorPassive CGColor]];
    }
    if (bgColorPassive) {
        [self setBackgroundColor:bgColorPassive];
    }
}

-(void)setSelectedState{
    if (borderColorActive) {
        [[self layer] setBorderWidth:borderWidth];
        [[self layer] setBorderColor:[borderColorActive CGColor]];
    }
    if (bgColorActive) {
        [self setBackgroundColor:bgColorActive];
    }

}
-(void)setDisableState{
    if (borderColorDisable) {
        [[self layer] setBorderWidth:borderWidth];
        [[self layer] setBorderColor:[borderColorDisable CGColor]];
    }
    if (bgColorDisable) {
        [self setBackgroundColor:bgColorDisable];
    }
    
}

-(void)setHighlighted:(BOOL)highlighted{
    [super setHighlighted:highlighted];
    if (!highlighted) {
        [self setBaseState];
    }else{
        [self setSelectedState];
    }
}

-(void)setSelected:(BOOL)selected{
    [super setSelected:selected];
    if (!selected) {
        [self setBaseState];
    }else{
        [self setSelectedState];
    }
}

-(void)setEnabled:(BOOL)enabled{
    [super setEnabled:enabled];
    if (enabled) {
        [self setBaseState];
    }else{
        [self setDisableState];
    }
}

- (void) awakeFromNib
{
    borderWidth = 1.5f;
    [self setBaseState];
}

-(void) handleControlEvent:(UIControlEvents)event  withBlock:(ActionBlock) action
{
    _actionBlock = [action copy];
    [self addTarget:self action:@selector(callActionBlock:) forControlEvents:event];
}

-(void) callActionBlock:(id)sender{
    if (_actionBlock)
        _actionBlock();
}

@end
