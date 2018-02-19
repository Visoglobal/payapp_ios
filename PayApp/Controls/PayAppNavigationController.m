//
//  PayAppNavigationController.m
//  PayApp
//
//  Created by Alexey on 06.10.15.
//  Copyright © 2015 Alexey. All rights reserved.
//

#import "PayAppNavigationController.h"

@interface PayAppNavigationController ()

@end

@implementation PayAppNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(id)initWithRootViewController:(UIViewController *)rootViewController{

    self = [super initWithRootViewController:rootViewController];
    if (self) {
        
        self.navigationBar.backgroundColor = [UIColor clearColor];
        self.navigationBar.tintColor = [UIColor clearColor];
        self.navigationBar.titleTextAttributes = @{UITextAttributeTextColor : [UIColor whiteColor]};
        [self.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];

        self.navigationBar.shadowImage = [UIImage new];
        self.navigationBar.translucent = YES;
        [self.navigationBar setTitleVerticalPositionAdjustment:-(self.navigationBar.frame.size.height-45)/2 forBarMetrics:UIBarMetricsDefault];
    }
    return self;
}

-(void)ajustView{
    
}

@end
