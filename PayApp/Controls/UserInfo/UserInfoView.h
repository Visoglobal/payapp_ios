//
//  MainMenuView.h
//  PayApp
//
//  Created by Alexey on 18.11.15.
//  Copyright © 2015 Alexey. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RoundImageView.h"

@interface UserInfoView : UIView

@property (weak, nonatomic) IBOutlet RoundImageView *userImage;
@property (weak, nonatomic) IBOutlet UILabel *userName;
@property (weak, nonatomic) IBOutlet UIImageView *cardImage;
@property (weak, nonatomic) IBOutlet UILabel *cardNum;

+ (UserInfoView*) getNew;
+ (UserInfoView*) getNewMenuView;
@end
