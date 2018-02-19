//
//  BaseReusableCell.m
//  MKBShop
//
//  Created by админ on 24.10.13.
//  Copyright (c) 2013 AOW. All rights reserved.
//

#import "BaseReusableCell.h"
#import "SkinManager.h"

@implementation BaseReusableCell

- (void) awakeFromNib
{
    [super awakeFromNib];
    
    [self applyDesign];
}

+ (NSString*) reuseIdentifier
{
    return [NSString stringWithFormat:@"%@ReuseIdentifier", [[self class] description]];
}

- (NSString*) reuseIdentifier
{
    return [[self class] reuseIdentifier];
}

- (void) applyDesign
{
//    UIView *selectionView = [[UIView alloc]initWithFrame:self.bounds];
//    
////    [selectionView setBackgroundColor:[SKIN_MANAGER colorForKey:SkinManagerColorMainApplicationColor]];
//      [selectionView setBackgroundColor:[UIColor clearColor]];
//    self.selectedBackgroundView = selectionView;
//    
//    [selectionView release];
}

@end
