//
//  BaseUserViewController.m
//  PayApp
//
//  Created by Alexey on 15.01.16.
//  Copyright © 2016 Alexey. All rights reserved.
//

#import "BaseUserViewController.h"
#import "UserManager.h"

@interface BaseUserViewController ()

@end

@implementation BaseUserViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _userInfoView = [UserInfoView getNew];
    _userInfoView.frame = CGRectMake(0, 50, self.view.frame.size.width, _userInfoView.frame.size.height);
    [self.view addSubview:_userInfoView];
    
    [self updateUserData];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(updateUserData)
                                                 name:userDataUpdateNotification
                                               object:nil];
    
    // Do any additional setup after loading the view.
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
}

- (void)updateUserData
{
    [_userInfoView.userImage setImageInside:USER_MANAGER.userPhoto];
    _userInfoView.userName.text = [NSString stringWithFormat:@"%@ %@", USER_MANAGER.contact.firstName, USER_MANAGER.contact.secondName];
    _userInfoView.cardNum.text = USER_MANAGER.userDefaultCardNum?USER_MANAGER.userDefaultCardNum:@"";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
