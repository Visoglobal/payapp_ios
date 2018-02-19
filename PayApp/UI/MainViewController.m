//
//  MainViewController.m
//  PayApp
//
//  Created by Alexey on 08.10.15.
//  Copyright © 2015 Alexey. All rights reserved.
//

#import "MainViewController.h"
#import "UpdateManager.h"
#import "TransactionView.h"
#import "TransactionFilterData.h"
#import "TransactionManager.h"
#import "TransactionListAnswer.h"
#import "Transaction.h"
#import "TransactionDetail.h"
#import "ApplyTransaction.h"
#import "UserManager.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"";
    _emptyTableLbl.text = NSLocalizedString(@"emptyOperationTableLable", nil);
    operationsTableView.tableDelegate = self;
    [self showMenuButton];
    [self ajustView];
}

-(void) showOperationsTable
{
    if (!operationsArray || operationsArray.count==0)
    {
        [operationsTableView setHidden:YES];
        [_emptyTableView setHidden:NO];
    }else{
        [operationsTableView setDataArray:operationsArray];
        [operationsTableView setHidden:NO];
        [_emptyTableView setHidden:YES];
    }
}

- (void)viewWillAppear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:YES animated:animated];
    [super viewWillAppear:animated];
    [self showOperationsTable];
    [self getOperationsList];
}

-(void)getOperationsList
{
    [self showLoading];
    [TRANSACTION_MANAGER getTransactionsFromPage:[NSString stringWithFormat:@"%i",currentCardPage] dateFrom:filterData.dateFrom dateTo:filterData.dateTo withState:@"success" withType:filterData.transactionType withCardId:filterData.cardId withCompletion:^(id transactionAnswer, NSError *error) {
        [self hideLoading];
        if (!error)
        {
            
            NSMutableArray* newOperationsArray = currentCardPage==0?[NSMutableArray new]:[NSMutableArray arrayWithArray:operationsArray];
            [newOperationsArray addObjectsFromArray:[(TransactionListAnswer*)transactionAnswer transactionList]];
            operationsArray = newOperationsArray;
            
            if (operationsArray.count < (currentCardPage+1) * 10)
            {
                [operationsTableView hideDownloadMoreItemsButton];
            }
            
        }else{
            currentCardPage = 0;
            operationsArray = nil;
        }
        [self showOperationsTable];
    }];
}



- (void)viewDidDisappear: (BOOL)animated
{
    [self.navigationController setNavigationBarHidden:NO animated:NO];
    [super viewDidDisappear:animated];
}

-(void) showMenuButton
{
//    [SKIN_MANAGER imageForKey:SkinManagerImageButtonMain]
    
    UIImageView* logo = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"payapp_menu_reg_logo_up.png"]];
    logo.frame = CGRectMake(self.view.frame.size.width-logo.frame.size.width-10, logo.frame.size.height*2/3, logo.frame.size.width, logo.frame.size.height);
    [self.view addSubview:logo];
    
    UIButton* menuButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 55, 55)];
    [menuButton setImage:[UIImage imageNamed:@"payapp_menu_reg_menu.png"] forState:UIControlStateNormal];
    [menuButton addTarget:self action:@selector(showMainMenu) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:menuButton];
}

-(void)showMainMenu
{
      [self slideView:_mainMenu withDirection:UIUserInterfaceLayoutDirectionLeftToRight];
}

-(void)hideMainMenu
{
      [self slideView:_mainMenu withDirection:UIUserInterfaceLayoutDirectionRightToLeft];
}

-(void)slideView:(UIView*)view withDirection:(UIUserInterfaceLayoutDirection)direction
{
    
    view.frame = CGRectMake(direction?0:-view.frame.size.width, view.frame.origin.y, view.frame.size.width, view.frame.size.height);
    
    [UIView animateWithDuration:0.3 animations:^{
        view.frame = CGRectMake(direction?-view.frame.size.width:0, view.frame.origin.y, view.frame.size.width, view.frame.size.height);
    } completion:^(BOOL finished) {
        _mainMenu.isShowed = (direction == UIUserInterfaceLayoutDirectionLeftToRight);
    }];
}

- (IBAction)sendMoneyButtonClick:(id)sender
{
    if(!USER_MANAGER.allowFinance)
        [self showAlertWithMessage:NSLocalizedString(@"notAllowedFinance", nil) completion:nil];
    else
    {
        NSNumber* obj= [NSNumber numberWithInt:TransactionDirectionTypeFromOwnerToSender];
      [self.navigationController pushViewController:[CONSTRUCTION_MANAGER viewControllerForType:ViewControllerTypeTransactionViewController withObject:obj] animated:YES];
    }
}

- (IBAction)askMoneyButtonClick:(id)sender
{
    if(!USER_MANAGER.allowFinance)
        [self showAlertWithMessage:NSLocalizedString(@"notAllowedFinance", nil) completion:nil];
    else
    {
        NSNumber* obj= [NSNumber numberWithInt:TransactionDirectionTypeFromSenderToOwner];
      [self.navigationController pushViewController:[CONSTRUCTION_MANAGER viewControllerForType:ViewControllerTypeTransactionViewController withObject:obj] animated:YES];
    }
    
//    UIWindow* window = [UIApplication sharedApplication].keyWindow;
//    if (!window)
//        window = [[UIApplication sharedApplication].windows objectAtIndex:0];
//    
//    BaseViewController* controller = (BaseViewController*)[CONSTRUCTION_MANAGER viewControllerForType:ViewControllerTypeSessionExpireViewController withObject:@"test message"];
//    [controller setViewControllerCompletion:^(id resultObject){
//        [[NSNotificationCenter defaultCenter] postNotificationName:endSessionNotification object:nil];
//    }];
//    
//    [window.rootViewController presentViewController:controller animated:YES completion:nil];
}

-(void)ajustView
{
    _mainMenu = [MainMenuView getNew];
    _mainMenu.frame = CGRectMake(-_mainMenu.frame.size.width, 0, _mainMenu.frame.size.width, _mainMenu.frame.size.height);
    _mainMenu.delegate = self;
    [self.view addSubview:_mainMenu];

}

-(void)doBack
{
    [self showMainMenu];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//mainMenu Delages funcs
- (void) didMenuButtonClick:(MenuButtonsTypes)buttonType
{
    [self hideMainMenu];
    
    if (buttonType == MenuButtonsTypeExit)
    {
        exitAlert = [[CustomAlertView alloc] initWithButtonTitle:NSLocalizedString(@"yesButton", nil) noButtonTitle:NSLocalizedString(@"noButton", nil) title:NSLocalizedString(@"alertTitle", nil) message:NSLocalizedString(@"exitMessage", nil) completion:^(NSInteger buttonIndex) {
            if (buttonIndex == 1) {
                exit(0);
            }
        }];
        [exitAlert show];
        
//        operationsArray = [[NSArray alloc] initWithObjects:@"",@"",@"",@"",@"",@"",@"",@"",@"",@"", nil];
//        [self showOperationsTable];
    }
    if (buttonType == MenuButtonsTypeHistory)
      [self.navigationController pushViewController:[CONSTRUCTION_MANAGER viewControllerForType:ViewControllerTypeOperationsViewController] animated:YES];
    if (buttonType == MenuButtonsTypeCards)
        [self.navigationController pushViewController:[CONSTRUCTION_MANAGER viewControllerForType:ViewControllerTypeCardListViewController] animated:YES];
    if (buttonType == MenuButtonsTypeFriends)
        [self.navigationController pushViewController:[CONSTRUCTION_MANAGER viewControllerForType:ViewControllerTypeContactViewController] animated:YES];
    if (buttonType == MenuButtonsTypeAccount)
        [self.navigationController pushViewController:[CONSTRUCTION_MANAGER viewControllerForType:ViewControllerTypeAccountViewController] animated:YES];

    
}

- (void) didMenuBackButtonClick
{
    [self hideMainMenu];
}

- (void) userSelectCell:(NSObject*)selectedCellValue
{
    Transaction* currentTransaction = (Transaction*)selectedCellValue;
    
    if (currentTransaction.transactionStateMode == TransactionStateModeSuccess)
    {
        TransactionDetail* transDetail = [[TransactionDetail alloc] initWithTransaction:currentTransaction];
        [self.navigationController pushViewController:[CONSTRUCTION_MANAGER viewControllerForType:ViewControllerTypeDetailViewController withObject:transDetail] animated:YES];
    }else
        if(currentTransaction.transactionStateMode == TransactionStateModeNeedReceiver || currentTransaction.transactionStateMode == TransactionStateModeNeedSender)
        {
            ApplyTransaction* transaction = [[ApplyTransaction alloc] initWithTransaction:currentTransaction];
            [self.navigationController pushViewController:[CONSTRUCTION_MANAGER viewControllerForType:ViewControllerTypeApplyTransactionViewController withObject:transaction] animated:YES];
        }else
        {
            [self showAlertWithMessage:NSLocalizedString(@"transactionCantDetail", nil) completion:nil];
        }
}

@end
