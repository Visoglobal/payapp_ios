//
//  SexSelectionView.h
//  PayApp
//
//  Created by Alexey on 07.10.15.
//  Copyright © 2015 Alexey. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SegmentedGrayButton.h"
#import "User.h"

@interface SexSelectionView : UIView
{
    SegmentedGrayButton* maleButton;
    SegmentedGrayButton* femaleButton;
    UILabel* titleLable;
}

@property (nonatomic) UserSex selectedSex;
-(NSString*)selectedSexString;
@end
