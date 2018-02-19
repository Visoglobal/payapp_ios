//
//  HttpRequestSecurityPolicy.m
//  MobileAcquiringCore
//
//  Created by Alexey on 24.09.15.
//  Copyright (c) 2015 AOW. All rights reserved.
//

#import "HttpRequestSecurityPolicy.h"

@implementation HttpRequestSecurityPolicy

+ (AFSecurityPolicy*) initWithSettings:(HttpRequestSettings*)settings
{
    AFSecurityPolicy *securityPolicy;
    
    if (settings && settings.sslCertificates && settings.sslEnable){
        securityPolicy =[AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeCertificate];
        [securityPolicy setPinnedCertificates:[settings.sslCertificates copy]];
    }else{
        securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
    }
    
    [securityPolicy setAllowInvalidCertificates:YES];
    [securityPolicy setValidatesDomainName:NO];
    
    return securityPolicy;
}

@end
