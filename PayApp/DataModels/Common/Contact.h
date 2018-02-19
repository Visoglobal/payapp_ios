//
//  Contact.h
//  PayApp
//
//  Created by Alexey on 17.08.15.
//  Copyright (c) 2015 Alexey. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseAnswerModel.h"

@interface Contact : BaseAnswerModel
    @property (nonatomic, copy) NSString* phone;
    @property (nonatomic, copy) NSString* email;
    @property (nonatomic, copy) NSString* verified;
    @property (nonatomic)       BOOL isVerified;
@end

