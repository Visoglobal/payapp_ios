//
//  BaseSearchCell.m
//  MKBShop
//
//  Created by админ on 08.11.13.
//  Copyright (c) 2013 AOW. All rights reserved.
//

#import "BaseSearchCell.h"
#import "DeviceHelper.h"
//search
#define kSearchSelectionTextColor [UIColor whiteColor]
#define kSearchSelectionBgColor [UIColor lightGrayColor]

@implementation BaseSearchCell

- (void)selectAllInsertionOfText:(NSString*)_searchedString
{
    for (UILabel * oneLabel in _searchTargets)
    {
        if ([oneLabel isKindOfClass:[UILabel class]])
            [self selectAllInsertionOfText:_searchedString inLable:oneLabel];
    }
}

-(void) selectAllInsertionOfText:(NSString*)_searchedString inLable:(UILabel*)_replacementLabel
{
    if (_searchedString.length>0)
    {
        NSRange searchRange = NSMakeRange(0,_searchedString.length);
        NSRange foundRange;
        while (searchRange.location < _replacementLabel.text.length)
        {
            searchRange.length = _replacementLabel.text.length-searchRange.location;
            foundRange = [[_replacementLabel.text uppercaseString] rangeOfString:[_searchedString uppercaseString] options:NSCaseInsensitiveSearch range:searchRange];
            
            if (foundRange.location != NSNotFound && [DeviceHelper isIOS6])
            {
                searchRange.location = foundRange.location+foundRange.length;
                
                NSDictionary *firstAttributes = [NSDictionary dictionaryWithObjectsAndKeys:kSearchSelectionTextColor,NSForegroundColorAttributeName,kSearchSelectionBgColor,NSBackgroundColorAttributeName,nil];
                NSMutableAttributedString *attributedString = _replacementLabel.attributedText.length>0?(NSMutableAttributedString*)_replacementLabel.attributedText:[[NSMutableAttributedString alloc] initWithString:_replacementLabel.text];
                [attributedString setAttributes:firstAttributes range:foundRange];
                _replacementLabel.attributedText = attributedString;
                
            } else {
                break;
            }
        }
    }
}

@end
