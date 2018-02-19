//
//  StartViewController.h
//  PayApp
//
//  Created by Alexey on 06.10.15.
//  Copyright © 2015 Alexey. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
#import "MainButton.h"

@interface StartViewController : BaseViewController{
    
    __weak IBOutlet UIImageView *navBarBgImageView;
    __weak IBOutlet UIImageView *backgroundImageView;
    __weak IBOutlet UIImageView *logoImageView;
    __weak IBOutlet UIImageView *buttonBarImageView;
    __weak IBOutlet MainButton *registrButton;
    __weak IBOutlet UIButton *loginButton;
}

@end
