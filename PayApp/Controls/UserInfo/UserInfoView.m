//
//  MainMenuView.m
//  PayApp
//
//  Created by Alexey on 18.11.15.
//  Copyright © 2015 Alexey. All rights reserved.
//

#import "UserInfoView.h"

@interface UserInfoView ()

@end

@implementation UserInfoView

+ (UserInfoView*) getNew
{
    UIViewController* viewController = [UIViewController new];
    UserInfoView* instance = [[[NSBundle mainBundle] loadNibNamed:@"UserInfoView" owner:viewController options:nil] objectAtIndex:0];
    [instance ajustView];

    return instance;
}

+ (UserInfoView*) getNewMenuView
{
    UIViewController* viewController = [UIViewController new];
    UserInfoView* instance = [[[NSBundle mainBundle] loadNibNamed:@"UserInfoMenuView" owner:viewController options:nil] objectAtIndex:0];
    [instance ajustView];
    
    return instance;
}

-(void) ajustView{
    [self.userImage setImageInside:[UIImage imageNamed:@"payapp_menu_reg2_user_nonpicture.png" ]];

}

@end
