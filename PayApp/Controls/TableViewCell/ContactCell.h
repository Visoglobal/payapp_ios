//
//  CategoryCell.h
//  MKBShop
//
//  Created by админ on 24.10.13.
//  Copyright (c) 2013 AOW. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseSearchCell.h"
#import "RoundImageView.h"

@interface ContactCell : BaseSearchCell

@property (weak, nonatomic) IBOutlet RoundImageView *userImage;
@property (weak, nonatomic) IBOutlet UILabel *userName;
@property (weak, nonatomic) IBOutlet UILabel *userContact;
@property (weak, nonatomic) IBOutlet UIImageView *statusImage;


@end
