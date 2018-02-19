//
//  ContactViewController.h
//  PayApp
//
//  Created by Alexey on 01.12.15.
//  Copyright © 2015 Alexey. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseUserViewController.h"
#import "UserInfoView.h"
#import "ContactsTableView.h"
#import "SearchBarView.h"

@interface ContactViewController : BaseUserViewController<BaseTableViewDelegate,UITextFieldDelegate,SearchBarViewDelegate>
{
    __weak IBOutlet ContactsTableView *contactTableView;
    NSArray* contactsArray;
    __weak IBOutlet UIButton *addButton;
    IBOutlet UIView* editableSearch;
    SearchBarView* editableSearchView;
    NSOperationQueue * _searchQueue;
}

@property (weak, nonatomic) UserInfoView *userInfoView;

@property (weak, nonatomic) IBOutlet UIView *emptyTableView;
@property (weak, nonatomic) IBOutlet UILabel *emptyTableLbl;
@end
