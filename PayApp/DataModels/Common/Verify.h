//
//  Verify.h
//  PayApp
//
//  Created by Alexey on 04.02.16.
//  Copyright © 2016 Alexey. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseRequestModel.h"

@interface Verify : BaseRequestModel

@property (nonatomic, copy) NSString* accessURL;
@property (nonatomic, copy) NSString* paramReqest;
@property (nonatomic, copy) NSString* terminalURL;
@property (nonatomic, copy) NSString* transactionData;

//<xs:element name="ACSURL" type="xs:string"/>
//<xs:element name="PaReq" type="xs:string"/>
//<xs:element name="TermUrl" type="xs:string"/>
//<xs:element name="MD" type="xs:string"/>

@end
