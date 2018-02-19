//
//  TransactionListAnswer.h
//  PayApp
//
//  Created by Alexey on 07.08.15.
//  Copyright (c) 2015 Alexey. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseAnswerModel.h"
#import "ToDo.h"
#import "TransactionList.h"

@interface TransactionListAnswer : BaseAnswerModel

@property (nonatomic, copy) NSString* requestId;
@property (nonatomic, copy) NSString* serverDate;
@property (nonatomic, retain) ToDo* toDo;
@property (nonatomic, copy) TransactionList* transactionList;

@end

//<TransactionListRs>
    //<RqId>str1234</RqId>
    //<ServerDate>2012-12-13T12:12:12</ServerDate>
    //<ToDo>
        //<VerifyContact>str1234</VerifyContact>
        //<ConfirmMoneySend>123</ConfirmMoneySend>
        //<ConfirmMoneyReceive>123</ConfirmMoneyReceive>
        //<HasTrNews>123</HasTrNews>
    //</ToDo>

    //<TransactionList>

        //<Transaction>

            //<TrId>str1234</TrId>
            //<TrDate>2012-12-13T12:12:12</TrDate>
            //<TrUpdateDate>2012-12-13T12:12:12</TrUpdateDate>
            //<IsNew>true</IsNew>
            //<TrState>needsender</TrState>
            //<ResultCode>str1234</ResultCode>

            //<Sender>

                //<Client>
                    //<ClientId>str1234</ClientId>
                    //<FamilyName>str1234</FamilyName>
                    //<Name>str1234</Name>
                    //<ParentName>str1234</ParentName>
                    //<BirthDate>2012-12-13</BirthDate>
                    //<Sex>male</Sex>
                    //<ContactList>
                        //<Contact>
                            //<Phone>str1234</Phone>
                        //</Contact>
                    //</ContactList>
                    //<NeedRegisterFin>true</NeedRegisterFin>
                //</Client>
            //</Sender>

            //<Receiver>
                //<Client>
                    //<ClientId>str1234</ClientId>
                    //<FamilyName>str1234</FamilyName>
                    //<Name>str1234</Name>
                    //<ParentName>str1234</ParentName>
                    //<BirthDate>2012-12-13</BirthDate>
                    //<Sex>male</Sex>
                    //<ContactList>
                        //<Contact>
                            //<Phone>str1234</Phone>
                        //</Contact>
                    //</ContactList>
                    //<NeedRegisterFin>true</NeedRegisterFin>
                //</Client>
            //</Receiver>

        //</Transaction>

    //</TransactionList>
//</TransactionListRs>
