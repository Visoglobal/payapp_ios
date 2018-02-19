//
//  SkinSingleton.h
//  MobileAcquiring
//
//  Created by Алексей  on 03.09.13.
//
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#define SKIN_MANAGER [SkinManager sharedSkinManager]

CG_INLINE int
hexValueFromString(NSString *string)
{
    int n = 0;
    sscanf([string UTF8String], "%x", &n);
    return n;
}


extern NSString * const SkinManagerImageCellBgImage;

//Colors
extern NSString * const SkinManagerColorNavigationBarBackSeparator;

//Fonts
extern NSString * const SkinManagerFontRegular;


@interface SkinManager : NSObject
{
    NSDictionary* skinDictionary;
}

@property (nonatomic, copy) NSString * filename;

+(SkinManager *)sharedSkinManager;

@property (nonatomic, readonly) float cornerRadius;
@property (nonatomic, readonly) float borderWidth;
@property (nonatomic, readonly) CGSize navigationBarTitleShadowOffset;

- (UIColor*) colorForKey:(NSString*)key;
- (UIImage*) imageForKey:(NSString*)key;
- (UIFont*) fontByKey:(NSString*)fontName size:(CGFloat)size;
- (UIColor*) colorFromRgbInt:(int)rgbValue;

@end
