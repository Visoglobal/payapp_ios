//
//  MainMenuView.m
//  PayApp
//
//  Created by Alexey on 18.11.15.
//  Copyright © 2015 Alexey. All rights reserved.
//

#import "MainMenuView.h"
#import "CustomCellButton.h"
#import "UserManager.h"

@interface MainMenuView ()

@end

@implementation MainMenuView
@synthesize delegate;

+ (MainMenuView*) getNew
{
    UIViewController* viewController = [UIViewController new];
    MainMenuView* instance = [[[NSBundle mainBundle] loadNibNamed:@"MainMenuView" owner:viewController options:nil] objectAtIndex:0];
    [instance ajustView];

    return instance;
}

- (void)updateUserData
{
    [_userInfoView.userImage setImageInside:USER_MANAGER.userPhoto];
    _userInfoView.userName.text = [NSString stringWithFormat:@"%@ %@", USER_MANAGER.contact.firstName, USER_MANAGER.contact.secondName];
    _userInfoView.cardNum.text = USER_MANAGER.userDefaultCardNum?USER_MANAGER.userDefaultCardNum:@"";
}


-(void) ajustView
{
    
    _userInfoView = [UserInfoView getNewMenuView];
    _userInfoView.frame = CGRectMake(0, 0, self.frame.size.width, _userInfoView.frame.size.height);
    [self addSubview:_userInfoView];
    
    UIImage* logoImage = [UIImage imageNamed:@"payapp_menu_arrow.png"];
    UIButton* backButton = [[UIButton alloc] initWithFrame:CGRectMake(self.frame.size.width-55, 5, 55, 55)];
    [backButton setImage:logoImage forState:UIControlStateNormal];
    [backButton addTarget:self action:@selector(buttonBackClick:) forControlEvents:UIControlEventTouchDown];
    [self addSubview:backButton];
    
    UIView* devider = [[UIView alloc] initWithFrame:CGRectMake(0, _userInfoView.frame.size.height,self.frame.size.width, 30)];
    [devider setBackgroundColor:[UIColor colorWithRed:216.0/255.0 green:216.0/255.0 blue:216.0/255.0 alpha:1.0]];
    _mainScrollView.frame = CGRectMake(0, _userInfoView.frame.size.height-5, self.frame.size.width, self.frame.size.height-_userInfoView.frame.size.height+5);
    [_mainScrollView addItem:devider];
    
    for ( int i = MenuButtonsTypeAccount; i <=MenuButtonsTypeExit; i++ )
    {
        [_mainScrollView addItem:[self createMenuButtonForType:i]];
    }
    [self bringSubviewToFront:backButton];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(updateUserData)
                                                 name:userDataUpdateNotification
                                               object:nil];
    [self updateUserData];
}

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent*)event
{
    CGRect rect = self.bounds;
    BOOL isInside = CGRectContainsPoint(rect, point);
    if(!isInside)
    {
        for (UIView *view in self.subviews)
        {
            isInside = CGRectContainsPoint(view.frame, point);
            if(isInside)
                break;
        }
    }
    if (!isInside && _isShowed)
        [self buttonBackClick:nil];

    return isInside;
}

-(IBAction)buttonBackClick:(id)sender
{
    if (delegate && [delegate respondsToSelector:@selector(didMenuBackButtonClick)])
        [delegate didMenuBackButtonClick];
}

-(IBAction)buttonClick:(id)sender
{
    if (delegate && [delegate respondsToSelector:@selector(didMenuButtonClick:)])
        [delegate didMenuButtonClick:[(UIButton*)sender tag]];
}

-(UIButton*)createMenuButtonForType:(MenuButtonsTypes)buttonType
{
    CustomCellButton* accountButton = [[CustomCellButton alloc] initWithFrame: CGRectMake(0, 0, self.frame.size.width, 50)];
    accountButton.tag = buttonType;
    [accountButton setTitle:[self titleForButtonType:buttonType]];
    [accountButton setButtonImage:[self hoverImageNameForButtonType:buttonType] :[self imageNameForButtonType:buttonType] ];
    [accountButton setBGColor:[UIColor colorWithRed:216.0/255.0 green:216.0/255.0 blue:216.0/255.0 alpha:1.0] :[UIColor whiteColor]];
    [accountButton addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    return (UIButton*)accountButton;
}

-(NSString*)hoverImageNameForButtonType:(MenuButtonsTypes)buttonType
{
    switch (buttonType) {
        case MenuButtonsTypeAccount:
            return @"payapp_menu_icon_accaunt_hover.png";
            break;
        case MenuButtonsTypeHistory:
            return @"payapp_menu_icon_hist_perevod_hover.png";
            break;
            
        case MenuButtonsTypeCards:
            return @"payapp_menu_icon_cart_hover.png";
            break;
            
        case MenuButtonsTypeFriends:
            return @"payapp_menu_icon_frends_hover.png";
            break;
        case MenuButtonsTypeExit:
            return @"payapp_menu_icon_exit_hover.png";
            break;
        default:
            return @"payapp_menu_icon_cart_hover.png";
            break;
    }
}

-(NSString*)imageNameForButtonType:(MenuButtonsTypes)buttonType
{
    switch (buttonType) {
        case MenuButtonsTypeAccount:
            return @"payapp_menu_icon_accaunt.png";
            break;
        case MenuButtonsTypeHistory:
            return @"payapp_menu_icon_hist_perevod.png";
            break;

        case MenuButtonsTypeCards:
            return @"payapp_menu_icon_cart.png";
            break;

        case MenuButtonsTypeFriends:
            return @"payapp_menu_icon_frends.png";
            break;

        case MenuButtonsTypeExit:
            return @"payapp_menu_icon_exit.png";
            break;
        default:
            return @"payapp_menu_icon_cart.png";
            break;
    }
}

-(NSString*)titleForButtonType:(MenuButtonsTypes)buttonType
{
    switch (buttonType) {
        case MenuButtonsTypeAccount:
            return [NSLocalizedString(@"mainMenuAccount", nil) uppercaseString];;
            break;
        case MenuButtonsTypeHistory:
            return [NSLocalizedString(@"mainMenuHistory", nil) uppercaseString];
            break;
            
        case MenuButtonsTypeCards:
            return [NSLocalizedString(@"mainMenuCards", nil) uppercaseString];
            break;
            
        case MenuButtonsTypeFriends:
            return [NSLocalizedString(@"mainMenuFriends", nil) uppercaseString];
            break;
            
        case MenuButtonsTypeExit:
            return [NSLocalizedString(@"mainMenuExit", nil) uppercaseString];
            break;
        default:
            return @"";
            break;
    }
}


@end
