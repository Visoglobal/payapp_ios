//
//  CategoryCell.m
//  MKBShop
//
//  Created by админ on 24.10.13.
//  Copyright (c) 2013 AOW. All rights reserved.
//

#import "TransactionCell.h"

@implementation TransactionCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

-(void)awakeFromNib
{
    [super awakeFromNib];
    
//    [_itemImageBGView.layer setCornerRadius:4.0f];
//    bgImageView.image = [SKIN_MANAGER imageForKey:SkinManagerImageCellBgImage];
//    
//    _itemTitleLabel.font = regularFontWithSize(18);
//    _itemDescriptionLabel.font = regularFontWithSize(12);
//    _priceLabel.font = boldFontWithSize(16);
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
}

@end
