//
//  DetailViewController.m
//  PayApp
//
//  Created by Alexey on 03.12.15.
//  Copyright © 2015 Alexey. All rights reserved.
//

#import "DetailViewController.h"
#import "TransactionDetail.h"
#import "FormatHelper.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)viewDidLoad {
    self.title = NSLocalizedString(@"detail", nil);
    [self ajustView];
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

-(void)ajustView
{
    [closeButton setTitle:NSLocalizedString(@"closeCheck", nil) forState:UIControlStateNormal];
    [closeButton setTitle:NSLocalizedString(@"closeCheck", nil) forState:UIControlStateHighlighted];
    [closeButton setTitle:NSLocalizedString(@"closeCheck", nil) forState:UIControlStateSelected];
    
    checkTitleLable.text = [NSLocalizedString(@"transactionComplete", nil) uppercaseString];

    if (initObject) {
        
        TransactionDetail* detail = (TransactionDetail*) initObject;
        NSString* text= [NSString stringWithFormat:@"Денежные средства со счета  %@ %@  в количестве %@ %@ переведены на счет %@ %@",detail.senderFullName?detail.senderFullName:@"",detail.senderCardNum?detail.senderCardNum:@"",[FormatHelper amountInMainUnitsFromMinimalUnits:detail.transactionAmount], detail.transactionCurrency, detail.receiverFullName?detail.receiverFullName:@"", detail.receiverCardNum?detail.receiverCardNum:@""];
        NSString* commText = [NSString stringWithFormat:@"Коммиссия составила %@ %@",[FormatHelper amountInMainUnitsFromMinimalUnits:detail.transactionFee], detail.transactionCurrency ];
        
        checkDetailLable.text = text;
        checkComissionLable.text = commText;
        
    }

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)closeButtonClick:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}
@end
