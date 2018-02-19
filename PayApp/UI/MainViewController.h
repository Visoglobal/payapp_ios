//
//  MainViewController.h
//  PayApp
//
//  Created by Alexey on 08.10.15.
//  Copyright © 2015 Alexey. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseUserViewController.h"
#import "UserInfoView.h"
#import "MainMenuView.h"
#import "OperationsTableView.h"
#import "TransactionFilterData.h"

@interface MainViewController : BaseUserViewController<MainMenuViewDelegate, BaseTableViewDelegate>
{
    __weak IBOutlet OperationsTableView *operationsTableView;
    NSArray* operationsArray;
    int currentCardPage;
    TransactionFilterData* filterData;
    CustomAlertView * exitAlert;
}

@property (weak, nonatomic) MainMenuView *mainMenu;

@property (weak, nonatomic) IBOutlet UIView *emptyTableView;
@property (weak, nonatomic) IBOutlet UILabel *emptyTableLbl;

@end
