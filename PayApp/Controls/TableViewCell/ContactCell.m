//
//  CategoryCell.m
//  MKBShop
//
//  Created by админ on 24.10.13.
//  Copyright (c) 2013 AOW. All rights reserved.
//

#import "ContactCell.h"

@implementation ContactCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.searchTargets = @[_userContact, _userName];
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
        self.searchTargets = @[_userContact, _userName];
        [_userImage setImageInside:[UIImage imageNamed:@"payapp_menu_reg2_user_nonpicture.png"]];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
}

@end
