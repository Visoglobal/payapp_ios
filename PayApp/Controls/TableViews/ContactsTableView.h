//
//  OperationsTableView.h
//  PayApp
//
//  Created by Alexey on 19.11.15.
//  Copyright © 2015 Alexey. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseTableView.h"

@class ContactsTableViewView;

@interface ContactsTableView : BaseTableView

@property (nonatomic,retain) NSString* searchedText;
@end
