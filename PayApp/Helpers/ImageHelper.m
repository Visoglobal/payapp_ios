//
//  ImageHelper.m
//  PayApp
//
//  Created by Alexey on 26.01.16.
//  Copyright © 2016 Alexey. All rights reserved.
//

#import "ImageHelper.h"
#import "DeviceHelper.h"

@implementation ImageHelper


+(UIImage *)resizeImage:(UIImage *)image toSize:(CGSize)size
{
    float width = size.width;
    float height = size.height;
    
    UIGraphicsBeginImageContext(size);
    CGRect rect = CGRectMake(0, 0, width, height);
    
    [image drawInRect: rect];
    
    UIImage *smallImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return smallImage;
}


+(NSString*)getBase64StringFromImage:(UIImage *)image
{
    if (!image)
        return nil;

    if ([DeviceHelper isIOS7])
       return [UIImagePNGRepresentation(image) base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
    else
    {
        NSData *decodedData = [[NSData alloc] initWithData:UIImagePNGRepresentation(image)];
        return [[NSString alloc] initWithData:decodedData encoding:NSUTF8StringEncoding];
    }
}


+(NSURL*)getNormalizedImageUrlWithClientId:(NSString*)clientId andSession:(NSString*)session
{
    if (clientId && session)
    {
        NSString* imageUrlString = [NSString stringWithFormat:@"%@images?imageId=%@&sessionId=%@",cfgServerURL,
                                    [self normalizedStringFromString:clientId],
                                    [self normalizedStringFromString:session]];
        NSURL* imageUrl = [NSURL URLWithString:imageUrlString];
        
        return imageUrl;
    }
    return nil;
}

+(NSString*)normalizedStringFromString:(NSString*)baseString
{
    if (baseString)
        return (NSString *)CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(NULL,(CFStringRef)baseString,NULL,(CFStringRef)@"!*'();:@&=+$,/?%#[]",kCFStringEncodingUTF8));
    
    return nil;
}

+(void)getImageFromRequest:(NSMutableURLRequest*)request withCompletion:(void (^)(UIImage* image))completion
{
    [request addValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    
    [NSURLConnection sendAsynchronousRequest:request
                                       queue:[NSOperationQueue mainQueue]
                           completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
                               if (!error){
                                   if (completion)
                                       completion([UIImage imageWithData:data]);
                               }else
                                   if (completion)
                                       completion(nil);
                               
                           }];
}

@end
