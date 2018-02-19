//
//  CategoryCell.h
//  MKBShop
//
//  Created by админ on 24.10.13.
//  Copyright (c) 2013 AOW. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseReusableCell.h"

@interface TransactionCell : BaseReusableCell

@property (retain, nonatomic) IBOutlet UILabel *operationDateLabel;
@property (retain, nonatomic) IBOutlet UILabel *operationOwnerLabel;
@property (retain, nonatomic) IBOutlet UIImageView *operationImage;
@property (retain, nonatomic) IBOutlet UILabel *operationSummLabel;

@end
