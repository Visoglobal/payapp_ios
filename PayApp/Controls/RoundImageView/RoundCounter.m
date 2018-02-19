//
//  RoundCounter.m
//  Squirrel
//
//  Created by Алексей  on 19.05.14.
//  Copyright (c) 2014 ArtOfWeb. All rights reserved.
//

#import "RoundCounter.h"

@implementation RoundCounter

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(void)viewDidLoad{
    [self addLable];
    [self setUserInteractionEnabled:NO];
}

-(void)addLable{
    if (!countLabel) {
        countLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
        [countLabel setTextColor:[UIColor whiteColor]];
                                  
        [countLabel setBackgroundColor:[UIColor clearColor]];
        
        [countLabel  setTextAlignment:NSTextAlignmentCenter];
        [countLabel setFont:regularFontWithSize(18)];
        [self addSubview:countLabel];
        [countLabel setUserInteractionEnabled:NO];
    }
    
    extern NSString * const SkinManagerColorCounterViewBgColor;
    extern NSString * const SkinManagerColorCounterViewDigitsColor;

    
}

-(void)setCount:(int)_count{
    [self addLable];
    countLabel.text = [NSString stringWithFormat:@"%i",_count];
}

- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    
    CGContextRef contextRef = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(contextRef, [[UIColor whiteColor] CGColor]);
    CGRect circlePoint = (CGRectMake(rect.origin.x, rect.origin.y, rect.size.width, rect.size.height));
    
    CGContextFillEllipseInRect(contextRef, circlePoint);
}

@end
