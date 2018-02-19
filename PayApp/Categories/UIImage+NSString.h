//
//  UIImage+NSString.h
//  MobileAcquiringCore
//
//  Created by админ on 28.07.14.
//  Copyright (c) 2014 AOW. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (NSString)

+ (UIImage *) imageFromText:(NSString *)text imageSize:(CGSize)size fontSize:(CGFloat)fontSize;

@end
