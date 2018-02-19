//
//  CardListViewController.m
//  PayApp
//
//  Created by Alexey on 30.11.15.
//  Copyright © 2015 Alexey. All rights reserved.
//

#import "CardListViewController.h"
#import "CardManager.h"
#import "UserManager.h"

#import "CardListAnswer.h"
#import "Card.h"

@interface CardListViewController ()

@end

@implementation CardListViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = NSLocalizedString(@"mainMenuCards", nil);
    currentCardPage = 0;
    cardsArray = [NSArray new];
    
    [self showBackButton];
    
    _emptyTableLbl.text = NSLocalizedString(@"emptyCardsTableLable", nil);
    cardsTableView.tableDelegate = self;
    
    [self ajustView];
    [self showOperationsTable];
    [self getCardList];
    if (_completion) {
        cardsTableView.allowsSelection = YES;
    }
}

-(void)getCardList
{
    [self showLoading];
    [CARD_MANAGER getCardsFromPage:[NSString stringWithFormat:@"%i",currentCardPage] withState:nil withCardId:nil withCompletion:^(id cardsAnswer, NSError *error) {
        [self hideLoading];
        if (!error){
            NSMutableArray* newCardsArray = [NSMutableArray arrayWithArray:cardsArray];
            [newCardsArray addObjectsFromArray:[(CardListAnswer*)cardsAnswer cardList]];
            cardsArray = newCardsArray;
            if (cardsArray.count < (currentCardPage+1) * 10)
            {
                [cardsTableView hideDownloadMoreItemsButton];
            }
        }
        [self showOperationsTable];
    }];
}

-(void) showOperationsTable
{

    if (!cardsArray || cardsArray.count==0)
    {
        [cardsTableView setHidden:YES];
        [_emptyTableView setHidden:NO];
    }else{
        [cardsTableView setDataArray:cardsArray];
        [cardsTableView setHidden:NO];
        [_emptyTableView setHidden:YES];
    }
}

-(IBAction)addCardButtonClick:(id)sender
{
    if(!USER_MANAGER.allowFinance)
       [self showAlertWithMessage:NSLocalizedString(@"notAllowedFinance", nil) completion:nil];
    else
    {
        BaseViewController* addCardViewController = (BaseViewController*)[CONSTRUCTION_MANAGER viewControllerForType:ViewControllerTypeAddCardViewController];
        [addCardViewController setViewControllerCompletion:^(id resultObject) {
            
            if (resultObject && [(Card*)resultObject creditDefault])
             [self clearDefaultsForCards];
            
            NSMutableArray* cardsList = [NSMutableArray arrayWithArray:cardsArray];
            
            if (resultObject)
                [cardsList insertObject:(Card*)resultObject atIndex:0];
            
            cardsArray = cardsList;
            [cardsTableView setDataArray:cardsArray];
            [self showOperationsTable];
        }];
        [self.navigationController pushViewController:addCardViewController animated:YES];
    }
}


-(void)clearDefaultsForCards
{
    if (cardsArray)
        for (Card* card in cardsArray) {
            card.creditDefault = NO;
        }
}

-(void)ajustView
{
    [addButton setBackgroundImage:[UIImage imageNamed:@"payapp_addButton.png"] forState:UIControlStateNormal];
    [addButton setBackgroundImage:[UIImage imageNamed:@"payapp_addButton_hover.png"] forState:UIControlStateSelected];
    [addButton setBackgroundImage:[UIImage imageNamed:@"payapp_addButton_hover.png"] forState:UIControlStateHighlighted];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//tableDelegates
- (void) showMoreClicking
{
    currentCardPage++;
    [self getCardList];
}

- (void) cellEditClick:(NSObject*)selectedCellValue
{
    
    BaseViewController* editCardViewController = (BaseViewController*)[CONSTRUCTION_MANAGER viewControllerForType:ViewControllerTypeAddCardViewController withObject:selectedCellValue];
    [editCardViewController setViewControllerCompletion:^(id resultObject) {
        
        if (resultObject && [(Card*)resultObject creditDefault])
        {
            [self clearDefaultsForCards];
            Card* card = (Card*)resultObject;
            card.creditDefault = YES;
        }
        [self showOperationsTable];
    }];
    [self.navigationController pushViewController:editCardViewController animated:YES];
    
    
}

- (void) cellDeleteClick:(NSObject*)selectedCellValue
{
    [self showLoading];
    Card* card = (Card*)selectedCellValue;
        
    [CARD_MANAGER editCardWithName:nil cardState:cardStates[2] cardId:card.cardId withCreditDefault:nil withExpiryDate:nil withCardholderName:nil withCvc2:nil withCompletion:^(id cardsAnswer, NSError *error) {
        [self hideLoading];
        
        if (error)
            [self showAlertWithMessage:[error localizedDescription]?[error localizedDescription]:NSLocalizedString(@"editErrorMessage", nil) completion:nil];
        else
        {
            card.cardState = cardStates[2];
            card.cardholderName = @"";
            card.expiryDate = @"";
            card.creditDefault = NO;
            card.pan = @"";
            card.cardPaySys = @"";
            
            if(selectedCellValue && [card creditDefault])
            {
                NSString* userDefautCard = [CARD_MANAGER getDafaultCardTypeAndMaskedPanFromCardsList:cardsArray];
                if (userDefautCard)
                    USER_MANAGER.userDefaultCardNum = userDefautCard;
                else
                    USER_MANAGER.userDefaultCardNum = @"";
            }
            
        }
         [self showOperationsTable];
    }];
 
}

//table delegate
- (void) userSelectCell:(NSObject*)selectedCellValue
{
    if (_completion)
        _completion(selectedCellValue);
}

@end
