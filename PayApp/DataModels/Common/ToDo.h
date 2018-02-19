//
//  ToDo.h
//  PayApp
//
//  Created by Alexey on 10.08.15.
//  Copyright (c) 2015 Alexey. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseAnswerModel.h"

@interface ToDo : BaseAnswerModel
{
    NSString* isAllowFinance;
}

@property (nonatomic, copy) NSString* verifyContact;
@property (nonatomic, copy) NSString* confirmMoneySend;
@property (nonatomic, copy) NSString* confirmMoneyReceive;
@property (nonatomic, copy) NSString* hasTransactionNews;
@property (nonatomic) BOOL allowFinance;
@end

//<ToDo>
//<VerifyContact>str1234</VerifyContact>
//<ConfirmMoneySend>123</ConfirmMoneySend>
//<ConfirmMoneyReceive>123</ConfirmMoneyReceive>
//<HasTrNews>123</HasTrNews>
//</ToDo>