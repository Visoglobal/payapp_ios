//
//  TransactionFilterViewController.m
//  PayApp
//
//  Created by Alexey on 03.12.15.
//  Copyright © 2015 Alexey. All rights reserved.
//

#import "TransactionFilterViewController.h"
#import "DropDownObject.h"
#import "CardManager.h"
#import "CardListAnswer.h"
#import "Card.h"
#import "FormatHelper.h"

@interface TransactionFilterViewController ()

@end

#define operationType @[@"transfer",@"request"]

@implementation TransactionFilterViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    filterData = [TransactionFilterData new];
    self.title = NSLocalizedString(@"filter", nil);
    [self showBackButton];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissKeyboard)];
    [self.view addGestureRecognizer:tap];

    [self ajustView];
}

-(void)ajustView
{
    showCardButton = [[UIButton alloc] initWithFrame:CGRectMake(10, self.userInfoView.frame.origin.y+self.userInfoView.frame.size.height+10, 300, 45)];
    [showCardButton setTitle:NSLocalizedString(@"byCard", nil) forState:UIControlStateNormal];
    [showCardButton setBackgroundImage:[UIImage imageNamed:@"payapp_dobavl_karti1_button_skan.png"] forState:UIControlStateNormal];
    [showCardButton setBackgroundImage:[UIImage imageNamed:@"payapp_dobavl_karti1_button_skan_hover.png"] forState:UIControlStateHighlighted];
    [showCardButton addTarget:self action:@selector(showCardsList:) forControlEvents:UIControlEventTouchDown];
    
    
    transactionDate = [[CustomDatePickerView alloc] initWithFrame:CGRectMake(10, showCardButton.frame.origin.y+showCardButton.frame.size.height+10, 300, 35)];
    [transactionDate setPlaceholder:NSLocalizedString(@"byDate", nil)];
    transactionDate.delegate = self;
    
    
    DropDownObject* typeData = [[DropDownObject alloc] init];
    typeData.dropName = NSLocalizedString(@"byType", nil);
    NSString * type1 = NSLocalizedString(@"typeGetting", nil);
    NSString * type2 = NSLocalizedString(@"typeAsking", nil);
    typeData.items = @[type1, type2];
    typeDtropDown = [[CustomDropDownControl alloc] initWithData:typeData andFrame:CGRectMake(10, transactionDate.frame.origin.y+transactionDate.frame.size.height+10, 300, 35)];
    typeDtropDown.delegate = self;
    
    [self.view addSubview:showCardButton];
    [self.view addSubview:transactionDate];
    [self.view addSubview:typeDtropDown];
    
    [applyeButton setTitle:NSLocalizedString(@"applyButton", nil) forState:UIControlStateNormal];
    [applyeButton setTitle:NSLocalizedString(@"applyButton", nil) forState:UIControlStateHighlighted];
    [applyeButton setTitle:NSLocalizedString(@"applyButton", nil) forState:UIControlStateSelected];

}

-(IBAction)showCardsList:(id)sender
{
    BaseViewController* cardsViewController = (BaseViewController*)[CONSTRUCTION_MANAGER viewControllerForType:ViewControllerTypeCardListViewController];
    [cardsViewController setViewControllerCompletion:^(id resultObject) {
        
        Card* selectedCard = (Card*)resultObject;
        filterData.cardId = selectedCard.cardId;
        [showCardButton setTitle:selectedCard.pan forState:UIControlStateNormal];
        [self.navigationController popViewControllerAnimated:YES];
    }];
    [self.navigationController pushViewController:cardsViewController animated:YES];
}

-(void)dismissKeyboard
{
    [self slideUpDropDownds];
    [transactionDate hideDataPicker];
}

-(void)slideUpDropDownds
{
    [typeDtropDown slideUp];
}

- (void) pickerViewShowed
{
    [self slideUpDropDownds];
}

- (IBAction)applyButtonClick:(id)sender
{
    if (_completion)
    {
        NSString* transactionDateString = [transactionDate getSelectedDate].length>0?[transactionDate getSelectedDate]:nil;
        if (transactionDateString){
            transactionDateString = [FormatHelper stringDateTimeFromDate:[transactionDate getDate]];
            filterData.dateFrom = transactionDateString;
            filterData.dateTo = transactionDateString;
        }

        if (typeDtropDown.selectedSegmentIndex >=0)
            filterData.transactionType = operationType[typeDtropDown.selectedSegmentIndex];
        _completion(filterData);
    }
    [self.navigationController popViewControllerAnimated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
