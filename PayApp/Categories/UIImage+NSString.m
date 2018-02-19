//
//  UIImage+NSString.m
//  MobileAcquiringCore
//
//  Created by админ on 28.07.14.
//  Copyright (c) 2014 AOW. All rights reserved.
//

#import "UIImage+NSString.h"

@implementation UIImage (NSString)

+ (UIImage *) imageFromText:(NSString *)text imageSize:(CGSize)imageSize fontSize:(CGFloat)fontSize
{
    // set the font type and size
    UIFont *font = [UIFont systemFontOfSize:fontSize];
    
    CGSize size  = [text sizeWithFont:font];
    
    // check if UIGraphicsBeginImageContextWithOptions is available (iOS is 4.0+)
    if (UIGraphicsBeginImageContextWithOptions != NULL)
        UIGraphicsBeginImageContextWithOptions(imageSize,NO,0.0);
    else
        // iOS is < 4.0
        UIGraphicsBeginImageContext(imageSize);
    
    // optional: add a shadow, to avoid clipping the shadow you should make the context size bigger
    //
    // CGContextRef ctx = UIGraphicsGetCurrentContext();
    // CGContextSetShadowWithColor(ctx, CGSizeMake(1.0, 1.0), 5.0, [[UIColor grayColor] CGColor]);
    
    // draw in context, you can use also drawInRect:withFont:
    [text drawAtPoint:CGPointMake((imageSize.width - size.width)/2., (imageSize.height - size.height)/2.) withFont:font];
    
    // transfer image
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

@end
