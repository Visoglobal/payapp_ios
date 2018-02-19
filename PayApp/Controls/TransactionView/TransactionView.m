//
//  MainMenuView.m
//  PayApp
//
//  Created by Alexey on 18.11.15.
//  Copyright © 2015 Alexey. All rights reserved.
//

#import "TransactionView.h"

@interface TransactionView ()

@end

@implementation TransactionView

- (void) applyDesign
{
    [_userOwner setCircleWidth:0.0];
    [_userOwner setImageInside:[UIImage imageNamed:@"payapp_zapros_dobavit.png"]];

    [_userSender setCircleWidth:0.0];
    [_userSender setImageInside:[UIImage imageNamed:@"payapp_zapros_dobavit.png"]];    
}

-(void) setDirection:(TransactionDirectionType)transactionDirection
{
    currentTransactionType = transactionDirection;
    if (transactionDirection == TransactionDirectionTypeFromOwnerToSender)
        [imageDirection setImage:[UIImage imageNamed:@"payapp_podtverzdenie2_2_arrowright.png"]];
    else
        [imageDirection setImage:[UIImage imageNamed:@"payapp_podtverzdenie2_2_arrowleft.png"]];
}

-(TransactionDirectionType) getDirection
{
    return currentTransactionType;
}


@end
