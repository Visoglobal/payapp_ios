//
//  CategoryCell.h
//  MKBShop
//
//  Created by админ on 24.10.13.
//  Copyright (c) 2013 AOW. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseSwipedCell.h"

@interface CardCell : BaseSwipedCell

@property (weak, nonatomic) IBOutlet UILabel *cardNameTitle;
@property (weak, nonatomic) IBOutlet UILabel *cardNameValue;
@property (weak, nonatomic) IBOutlet UILabel *expireDateTitle;
@property (weak, nonatomic) IBOutlet UILabel *expireDateValue;
@property (weak, nonatomic) IBOutlet UILabel *ownerTitle;
@property (weak, nonatomic) IBOutlet UILabel *ownerValue;
@property (weak, nonatomic) IBOutlet UIImageView *cardTypeImage;
@property (weak, nonatomic) IBOutlet UIImageView *isSelectedImage;

-(void)setDefaultState:(BOOL)isDefault;

@end
