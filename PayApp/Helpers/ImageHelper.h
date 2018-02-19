//
//  ImageHelper.h
//  PayApp
//
//  Created by Alexey on 26.01.16.
//  Copyright © 2016 Alexey. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ImageHelper : NSObject

+(NSString*)normalizedStringFromString:(NSString*)baseString;
+(NSURL*)getNormalizedImageUrlWithClientId:(NSString*)clientId andSession:(NSString*)session;
+(void)getImageFromRequest:(NSMutableURLRequest*)request withCompletion:(void (^)(UIImage* image))completion;
+(NSString*)getBase64StringFromImage:(UIImage *)image;
+(UIImage *)resizeImage:(UIImage *)image toSize:(CGSize)size;

@end
