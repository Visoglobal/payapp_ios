//
//  MainMenuView.h
//  PayApp
//
//  Created by Alexey on 18.11.15.
//  Copyright © 2015 Alexey. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UserInfoView.h"
#import "AutoDataScroll.h"

typedef NS_ENUM(NSUInteger, MenuButtonsTypes) {
    MenuButtonsTypeAccount = 1,
    MenuButtonsTypeHistory = 2,
    MenuButtonsTypeCards = 3,
    MenuButtonsTypeFriends = 4,
    MenuButtonsTypeExit = 5,
};

@class MainMenuView;

@protocol MainMenuViewDelegate <NSObject>

- (void) didMenuButtonClick:(MenuButtonsTypes)buttonType;
- (void) didMenuBackButtonClick;

@end

@interface MainMenuView : UIView

@property (assign) BOOL isShowed;

@property (weak, nonatomic) UserInfoView *userInfoView;
@property (weak, nonatomic) IBOutlet AutoDataScroll* mainScrollView;
@property (retain) id <MainMenuViewDelegate> delegate;

+ (MainMenuView*) getNew;

@end
