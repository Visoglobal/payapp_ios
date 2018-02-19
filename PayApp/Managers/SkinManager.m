//
//  SkinSingleton.m
//  MobileAcquiring
//
//  Created by Алексей  on 03.09.13.
//
//

#import "SkinManager.h"

#define sFontsKey @"Fonts"
#define sFontsTitleKey @"Title"
#define sFontsNameKey @"FontName"

#define sImagesKey @"Images"
#define sImageTitleKey @"Title"
#define sImageFileKey @"File"

#define sColorsKey @"Colors"
#define sColorTitleKey @"Title"
#define sColorValueKey @"ColorValue"
#define sValueKey @"Value"
#define sCustomValueKey @"Custom"

NSString * const SkinManagerImage = @"";
NSString * const SkinManagerColor = @"";

//Images
NSString * const SkinManagerImageMainScreenLogo = @"LoginLogo";


//Colors
NSString * const SkinManagerColorMainApplicationColor = @"MainApplicationColor";

//Fonts
NSString * const SkinManagerFontFieldTitle = @"Register1TextFieldDescriptionFont";

static SkinManager * sharedSkinManager = NULL;

@implementation SkinManager

+ (SkinManager *)sharedSkinManager
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        if (sharedSkinManager == NULL)
        {
            sharedSkinManager = [SkinManager new];
        }
        
    });
    
    return sharedSkinManager;
}

- (id)init
{
    self = [super init];
    if (self) {

    }
    return self;
}

- (void) setFilename:(NSString *)filename
{
    if (_filename != filename)
    {
        _filename = [filename copy];
    }
    
    [self loadSkinResource];
}

- (void) loadSkinResource
{
    if (!_filename || _filename.length == 0)
        return;
    
    NSString* plistPath = [[NSBundle mainBundle] pathForResource:_filename ofType:@"plist"];
    NSDictionary* skinDictionaryTmp = [NSDictionary dictionaryWithContentsOfFile:plistPath];
    
    if (skinDictionaryTmp && skinDictionaryTmp.count)
    {
        skinDictionary = skinDictionaryTmp;
    }
}


#pragma mark Custom

- (float) cornerRadius
{
    return [[self customValueByKey:@"CornerRadius"] floatValue];
}

- (float) borderWidth
{
    return [[self customValueByKey:@"BorderWidth"] floatValue];
}

- (CGSize) navigationBarTitleShadowOffset
{
    return CGSizeFromString([self customValueByKey:@"NavigationBarTitleShadowOffset"]);
}

#pragma mark - Data Methods

- (NSArray*) fontsArray
{
    return [skinDictionary  objectForKey:sFontsKey];
}

- (NSArray*) imagesArray
{
    return [skinDictionary  objectForKey:sImagesKey];
}

- (NSArray*) colorsArray
{
    return [skinDictionary  objectForKey:sColorsKey];
}

- (NSArray*)customValuesArray
{
    return [skinDictionary  objectForKey:sCustomValueKey];
}


#pragma mark - Common Methods

- (UIImage*) imageForKey:(NSString*)imageName
{
    for (NSDictionary* image in [self imagesArray])
    {
        if ([[image objectForKey:sImageTitleKey] isEqualToString: imageName])
            return [UIImage imageNamed:[image objectForKey:sImageFileKey]];
    }
    
    NSLog(@"SKIN_MANAGER can't find image for key '%@'", imageName);
    
    return nil;
}

- (UIColor*) colorForKey:(NSString*)colorName
{
    for (NSDictionary* color in [self colorsArray])
        if ([[color objectForKey:sColorTitleKey] isEqualToString: colorName])
        {
            NSString * colorString = [color objectForKey:sColorValueKey];
            
            if ([colorString isEqualToString: @"clearColor"])
                return [UIColor clearColor];
            
            int colorInt = hexValueFromString(colorString);
            
            return [self colorFromRgbInt:colorInt];
        }
    
    NSLog(@"SKIN_MANAGER can't find color for key '%@'", colorName);
    
    return [UIColor clearColor];
}

- (NSString*) customValueByKey:(NSString*)valueName
{
    for (NSDictionary* custom in [self customValuesArray])
        if ([[custom objectForKey:sFontsTitleKey] isEqualToString: valueName])
            return [custom objectForKey:sValueKey];

    NSLog(@"SKIN_MANAGER can't find customValue for key '%@'", valueName);
    
    return nil;
}

- (UIFont*) fontByKey:(NSString*)fontName size:(CGFloat)size
{
    for (NSDictionary* font in [self fontsArray])
        if ([[font objectForKey:sFontsTitleKey] isEqualToString: fontName])
        {
            NSString * fontName = [font objectForKey:sFontsNameKey];
            
            return [UIFont fontWithName:fontName size:size];
        }
    
    NSLog(@"SKIN_MANAGER can't find font for key '%@'", fontName);
    
    return nil;
}

- (UIColor*) colorFromRgbInt:(int)rgbValue
{
    return [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0];
}


@end
