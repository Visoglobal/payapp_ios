//
//  CategoryCell.m
//  MKBShop
//
//  Created by админ on 24.10.13.
//  Copyright (c) 2013 AOW. All rights reserved.
//

#import "CardCell.h"

@implementation CardCell

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

-(void)setDefaultState:(BOOL)isDefault
{
    _isSelectedImage.image = nil;
    if (isDefault)
        _isSelectedImage.image = [UIImage imageNamed:@"payapp_kard_2_11_green_button.png"];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)__animated
{
    [super setSelected:selected animated:__animated];
}

@end
