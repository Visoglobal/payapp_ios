//
//  MainViewController.m
//  PayApp
//
//  Created by Alexey on 08.10.15.
//  Copyright © 2015 Alexey. All rights reserved.
//

#import "OperationsViewController.h"
#import "TransactionManager.h"
#import "TransactionListAnswer.h"
#import "Transaction.h"
#import "TransactionDetail.h"
#import "UserManager.h"
#import "ApplyTransaction.h"

@interface OperationsViewController ()

@end

@implementation OperationsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = NSLocalizedString(@"mainMenuHistory", nil);
    [self showBackButton];
    
    _emptyTableLbl.text = NSLocalizedString(@"emptyOperationTableLable", nil);
    operationsTableView.tableDelegate = self;
    operationsTableView.isFilterEnabled = YES;
    filterData = [TransactionFilterData new];
    
    [self showOperationsTable];
    [self getOperationsList];
}

-(void)getOperationsList
{
    [self showLoading];
    [TRANSACTION_MANAGER getTransactionsFromPage:[NSString stringWithFormat:@"%i",currentCardPage] dateFrom:filterData.dateFrom dateTo:filterData.dateTo withState:nil withType:filterData.transactionType withCardId:filterData.cardId withCompletion:^(id transactionAnswer, NSError *error) {
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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//table delegate
- (void) showMoreClicking
{
    currentCardPage++;
    [self getOperationsList];
}

-(void)showFilterClicking
{
    BaseViewController* viewController = (BaseViewController*)[CONSTRUCTION_MANAGER viewControllerForType:ViewControllerTypeTransactionFilterViewController];
    [viewController setViewControllerCompletion:^(id resultObject) {
        filterData = (TransactionFilterData*)resultObject;
        currentCardPage = 0;
        operationsArray = nil;
        [self getOperationsList];
    }];
    
    [self.navigationController pushViewController:viewController animated:YES];
}

- (void) userSelectCell:(NSObject*)selectedCellValue
{
    Transaction* currentTransaction = (Transaction*)selectedCellValue;
    
    if (currentTransaction.transactionStateMode == TransactionStateModeSuccess)
    {
        TransactionDetail* transDetail = [[TransactionDetail alloc] initWithTransaction:currentTransaction];
        [self.navigationController pushViewController:[CONSTRUCTION_MANAGER viewControllerForType:ViewControllerTypeDetailViewController withObject:transDetail] animated:YES];
    }else
        if ((currentTransaction.transactionStateMode == TransactionStateModeNeedSender && currentTransaction.sender.own) ||
            (currentTransaction.transactionStateMode == TransactionStateModeNeedReceiver && currentTransaction.receiver.own))
        {
                ApplyTransaction* transaction = [[ApplyTransaction alloc] initWithTransaction:currentTransaction];
               [self.navigationController pushViewController:[CONSTRUCTION_MANAGER viewControllerForType:ViewControllerTypeApplyTransactionViewController withObject:transaction] animated:YES];
        }else
            {
                [self showAlertWithMessage:NSLocalizedString(@"transactionCantDetail", nil) completion:nil];
            }
}


@end
