//
//  CardListViewController.h
//  PayApp
//
//  Created by Alexey on 30.11.15.
//  Copyright © 2015 Alexey. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseUserViewController.h"
#import "UserInfoView.h"
#import "CardsTableView.h"

@interface CardListViewController : BaseUserViewController<BaseTableViewDelegate>
{
    __weak IBOutlet CardsTableView *cardsTableView;
    NSArray* cardsArray;
    __weak IBOutlet UIButton *addButton;
    int currentCardPage;
}

@property (weak, nonatomic) UserInfoView *userInfoView;

@property (weak, nonatomic) IBOutlet UIView *emptyTableView;
@property (weak, nonatomic) IBOutlet UILabel *emptyTableLbl;
@end
