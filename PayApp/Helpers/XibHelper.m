//
//  XibHelper.m
//  PayApp
//
//  Created by Alexey on 12.10.15.
//  Copyright © 2015 Alexey. All rights reserved.
//

#import "XibHelper.h"
#import "DeviceHelper.h"

@implementation XibHelper

+ (NSString*) viewControllerXibNameWithName:(NSString*)viewControllerXibName
{
    if([DeviceHelper isIphone4])
        return [NSString stringWithFormat:@"%@_iphone4",viewControllerXibName];
    
    return viewControllerXibName;
}

@end
