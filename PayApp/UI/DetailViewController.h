//
//  DetailViewController.h
//  PayApp
//
//  Created by Alexey on 03.12.15.
//  Copyright © 2015 Alexey. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "BaseUserViewController.h"
#import "UserInfoView.h"

@interface DetailViewController : BaseUserViewController
{
    __weak IBOutlet UIButton *closeButton;
    __weak IBOutlet UILabel *checkTitleLable;
    __weak IBOutlet UILabel *checkDetailLable;
    __weak IBOutlet UILabel *checkComissionLable;
}

@end
