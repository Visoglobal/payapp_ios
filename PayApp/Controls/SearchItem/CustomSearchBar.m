//
//  CustomSearchBar.m
//  MKBShop
//
//  Created by Алексей  on 05.11.13.
//  Copyright (c) 2013 AOW. All rights reserved.
//

#import "CustomSearchBar.h"
#import "DeviceHelper.h"

@implementation CustomSearchBar

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        // Initialization code
    }
    return self;
}

-(id)init{
   return [super init];
    
}

-(id)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
        if ([DeviceHelper isIOS7])
        {
            [self setBackgroundColor:[UIColor clearColor]];
            [self setBarTintColor:[UIColor colorWithRed:248/255 green:248/255 blue:248/255 alpha:248/255]];
            [[UITextField appearanceWhenContainedIn:[UISearchBar class], nil] setFont:regularFontWithSize(16)];
            [UITextField appearanceWhenContainedIn:[UISearchBar class], nil].layer.borderColor = [[UIColor lightGrayColor] CGColor];
            self.placeholder = @"                                                                                             ";       //костыль для IOS7
            [self setBackgroundImage:[UIImage imageNamed:@"m4b_shop_app_searchBG.png"]];
            
        }else{
            [[self.subviews objectAtIndex:0] removeFromSuperview];
            self.backgroundColor = [UIColor colorWithRed:248/255 green:248/255 blue:248/255 alpha:248/255];
            [self setImage:[UIImage imageNamed:@"m4b_shop_app_searchIcon.png"] forSearchBarIcon:UISearchBarIconSearch state:UIControlStateNormal];
        }
    }
    return self;
}

- (void)layoutSubviews {
    
    if (![DeviceHelper isIOS7]){
        UITextField *searchField;
        NSUInteger numViews = [self.subviews count];
        for(int i = 0; i < numViews; i++) {
            if([[self.subviews objectAtIndex:i] isKindOfClass:[UITextField class]]) { //conform?
                searchField = [self.subviews objectAtIndex:i];
            }
        }
        if(searchField) {

                [searchField setFont:regularFontWithSize(16)];
                searchField.textColor = [UIColor blackColor];
                [searchField setBackground: [UIImage imageNamed:@"empty.png"] ];
                [searchField setBackgroundColor:[UIColor whiteColor]];
                [searchField setBorderStyle:UITextBorderStyleLine];
                searchField.layer.borderColor = [[UIColor lightGrayColor] CGColor];
                searchField.layer.borderWidth = 1;
                [searchField.layer setCornerRadius:4.0f];
                [[searchField valueForKey:@"textInputTraits"] setValue:[UIColor grayColor] forKey:@"insertionPointColor"];
                [searchField addTarget:nil action:@selector(resignFirstResponder) forControlEvents:UIControlEventTouchUpInside];
        }
    }
    [super layoutSubviews];
}

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event
{
    if (!CGRectContainsPoint(self.bounds, point))
        [self endEditing:YES];
    
    return [super pointInside:point withEvent:event];
}

@end
