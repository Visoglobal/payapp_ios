//
//  BaseReusableCell.h
//  MKBShop
//
//  Created by админ on 24.10.13.
//  Copyright (c) 2013 AOW. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseReusableCell : UITableViewCell{
    IBOutlet UIImageView* bgImageView;
}

+ (NSString*) reuseIdentifier;

@end
