//
//  ContactViewController.m
//  PayApp
//
//  Created by Alexey on 01.12.15.
//  Copyright © 2015 Alexey. All rights reserved.
//

#import "ContactViewController.h"
#import "UserManager.h"
#import "Client.h"
#import "UpdateManager.h"


@interface ContactViewController ()

@end

@implementation ContactViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = NSLocalizedString(@"mainMenuFriends", nil);
    
    [self showBackButton];
    
    _emptyTableLbl.text = NSLocalizedString(@"emptyContactsTableLable", nil);
    contactTableView.tableDelegate = self;
    
    [self ajustView];
    [self showOperationsTable];
    [contactTableView hideDownloadMoreItemsButton];
    
    editableSearchView = [SearchBarView getNew];
    editableSearchView.delegate = self;
    editableSearchView.frame = CGRectMake(0,0,self.view.frame.size.width,52);
    editableSearchView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    [editableSearch addSubview:editableSearchView];
    
    _searchQueue = [[NSOperationQueue alloc] init];
    _searchQueue.maxConcurrentOperationCount = 1;
    
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self showLoading];
    [UPDATE_MANAGER updateAppBaseDataWithCompletion:^{
        contactsArray = USER_MANAGER.contactList;
        [self showOperationsTable];
        [self hideLoading];
    }];
}


-(void) showOperationsTable
{
    
    if (!contactsArray || contactsArray.count==0)
    {
        [contactTableView setHidden:YES];
        [_emptyTableView setHidden:NO];
    }else{
        [contactTableView setDataArray:contactsArray];
        [contactTableView setHidden:NO];
        [_emptyTableView setHidden:YES];
    }
}

-(IBAction)addUserButtonClick:(id)sender
{
    [self.navigationController pushViewController:[CONSTRUCTION_MANAGER viewControllerForType:ViewControllerTypeInviteViewController] animated:YES];
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

//table delegate
- (void) userSelectCell:(NSObject*)selectedCellValue
{
    if (_completion)
        _completion(selectedCellValue);
}

- (void) searchBar:(SearchBarView *)searchBar textDidChange:(NSString *)searchText
{
    
    [self showLoading];
    [_searchQueue cancelAllOperations];

    if (searchText == nil || searchText.length == 0){
        contactTableView.searchedText = nil;
        [contactTableView setDataArray:contactsArray];
        [self hideLoading];
    }else{
    __block NSBlockOperation *operation = [NSBlockOperation blockOperationWithBlock:^{

            if (![operation isCancelled])
            {
                NSArray *filteredArray = [contactsArray filteredArrayUsingPredicate:[NSPredicate predicateWithBlock:^BOOL(id object, NSDictionary *bindings) {
                    Client* client  = (Client*)object;
                    
                    if ([self baseString:client.contact containsString:searchText] ||
                        [self baseString:[NSString stringWithFormat:@"%@ %@",client.name,client.familyName] containsString:searchText])
                        return YES;
                    
                    return NO;
                }]];
                dispatch_sync(dispatch_get_main_queue(), ^{
                    contactTableView.searchedText = searchText;
                   [contactTableView setDataArray:[NSMutableArray arrayWithArray:filteredArray]];
                   [self hideLoading];
                });
            }
        }];
        
        [operation setQueuePriority:NSOperationQueuePriorityVeryHigh];
        
        [_searchQueue addOperation:operation];
    }

}

- (BOOL) baseString:(NSString*)baseString containsString: (NSString*) subString
{
    NSRange range = [[baseString uppercaseString] rangeOfString : [subString uppercaseString]];
    BOOL found = ( range.location != NSNotFound );
    return found;
}
@end
