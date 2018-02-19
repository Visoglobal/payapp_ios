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
#import "OperationsTableView.h"
#import "TransactionFilterData.h"

@interface OperationsViewController : BaseUserViewController<BaseTableViewDelegate>
{
    __weak IBOutlet OperationsTableView *operationsTableView;
    NSArray* operationsArray;
    int currentCardPage;
    TransactionFilterData* filterData;
}

@property (weak, nonatomic) UserInfoView *userInfoView;

@property (weak, nonatomic) IBOutlet UIView *emptyTableView;
@property (weak, nonatomic) IBOutlet UILabel *emptyTableLbl;

@end
