//
//  BaseUserViewController.h
//  PayApp
//
//  Created by Alexey on 15.01.16.
//  Copyright © 2016 Alexey. All rights reserved.
//

#import "BaseViewController.h"
#import "UserInfoView.h"

@interface BaseUserViewController : BaseViewController

@property (weak, nonatomic) UserInfoView *userInfoView;

@end
