//
//  MainMenuView.h
//  PayApp
//
//  Created by Alexey on 18.11.15.
//  Copyright © 2015 Alexey. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseNibView.h"
#import "RoundImageView.h"

typedef NS_ENUM(NSUInteger, TransactionDirectionType) {
    TransactionDirectionTypeFromOwnerToSender = 0,
    TransactionDirectionTypeFromSenderToOwner = 1
};

@interface TransactionView : BaseNibView
{
    __weak IBOutlet UIImageView *imageDirection;

    BOOL _isOwnerActionEnable;
    BOOL _isSenderActionEnable;
    TransactionDirectionType currentTransactionType;
}
@property (weak, nonatomic) IBOutlet RoundImageView *userOwner;
@property (weak, nonatomic) IBOutlet RoundImageView *userSender;
@property (weak, nonatomic) IBOutlet UILabel *userOwnerName;
@property (weak, nonatomic) IBOutlet UILabel *userSenderName;

-(void) setDirection:(TransactionDirectionType)transactionDirection;
-(TransactionDirectionType) getDirection;
@end
