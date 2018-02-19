//
//  ReceiverInfo.h
//  PayApp
//
//  Created by Alexey on 23.09.16.
//  Copyright © 2016 Alexey. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SenderInfo.h"

@interface ReceiverInfo : SenderInfo

@property (nonatomic, copy) NSString* clientId;
@property (nonatomic, copy) NSString* contact;

//<xs:element name="ClientId" type="xs:string"/>
//<xs:element name="Contact" type="xs:string"/>
@end
