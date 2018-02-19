//
//  UILabel+DynamicSize.m
//  MobileAcquiringCore
//
//  Created by админ on 12.03.14.
//  Copyright (c) 2014 AOW. All rights reserved.
//

#import "UILabel+DynamicSize.h"

@implementation UILabel (DynamicSize)

-(float)resizeToFit
{
    float height = [self expectedHeight];
    CGRect newFrame = [self frame];
    newFrame.size.height = height;
    [self setFrame:newFrame];
    return newFrame.origin.y + newFrame.size.height;
}

-(float)expectedHeight
{
    [self setNumberOfLines:0];
    
    CGSize maximumLabelSize = CGSizeMake(self.frame.size.width,MAXFLOAT);
    
    CGSize expectedLabelSize = CGSizeZero;

    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0)
    {        
        CGRect labelRect = [self.text boundingRectWithSize:maximumLabelSize
                                                   options:NSStringDrawingUsesLineFragmentOrigin
                                                attributes:@{NSFontAttributeName:self.font}
                                                   context:nil];
        
        expectedLabelSize = labelRect.size;
    }
    else
    {
        [self setLineBreakMode:UILineBreakModeWordWrap];
        
        expectedLabelSize = [[self text] sizeWithFont:[self font]
                                    constrainedToSize:maximumLabelSize
                                        lineBreakMode:[self lineBreakMode]];
    }
    
    return expectedLabelSize.height;
}

@end
