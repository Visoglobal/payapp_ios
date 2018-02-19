//
//  ContactConfirmInitAnswer.h
//  PayApp
//
//  Created by Alexey on 07.08.15.
//  Copyright (c) 2015 Alexey. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseRequestModel.h"

@interface ContactConfirmInitAnswer : BaseRequestModel

@property (nonatomic, copy) NSString* requestId;
@property (nonatomic, copy) NSString* serverDate;
@property (nonatomic, copy) NSString* contact;
@property (nonatomic, copy) NSString* verifyExpiryDate;

@end


//<AppContactConfirmInitRs>
//<RqId>str1234</RqId>
//<ServerDate>2012-12-13T12:12:12</ServerDate>
//<Contact>str1234</Contact>
//<VerifyExpiryDate>2012-12-13</VerifyExpiryDate>
//</AppContactConfirmInitRs>