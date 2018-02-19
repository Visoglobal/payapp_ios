//
//  BaseManager.m
//  PayApp
//
//  Created by Alexey on 11.12.15.
//  Copyright © 2015 Alexey. All rights reserved.
//

#import "BaseManager.h"
#import "HttpRequestSOAPResponseAnalizer.h" 
#import "CryptingManager.h"
#import "NSData+Base64.h"

@implementation BaseManager

- (instancetype)init
{
    self = [super init];
    if (self) {
        requestsSettings = [HttpRequestSettings new];
        requestsSettings.gZipEnable = NO;
        requestsSettings.sslEnable = YES;
        requestsSettings.url = [NSURL URLWithString:cfgServerURL];
        requestsSettings.requestSerializer = [HttpRequestSOAPXMLRequestSerializer new];
        requestsSettings.responseSerializer = [HttpRequestSOAPXMLResponceSerializer new];
        
        NSString* cert = @"MIIDQDCCAiigAwIBAgIEUN6pGzANBgkqhkiG9w0BAQUFADBiMQswCQYDVQQGEwJSVTEPMA0GA1UE\nCBMGTW9zY293MQ8wDQYDVQQHEwZNb3Njb3cxDzANBgNVBAoTBk00QmFuazEPMA0GA1UECxMGTTRC\nYW5rMQ8wDQYDVQQDEwZNNEJhbmswHhcNMTIxMjI5MDgyNjAzWhcNMjIxMTA3MDgyNjAzWjBiMQsw\nCQYDVQQGEwJSVTEPMA0GA1UECBMGTW9zY293MQ8wDQYDVQQHEwZNb3Njb3cxDzANBgNVBAoTBk00\nQmFuazEPMA0GA1UECxMGTTRCYW5rMQ8wDQYDVQQDEwZNNEJhbmswggEiMA0GCSqGSIb3DQEBAQUA\nA4IBDwAwggEKAoIBAQCNGVy6WKOn4ZTvAlrWIFD9jx5PhfE1RRM0NmWViSbrkgkY7SwykOjkfSsk\n1D8qhwErKDVTo3chGUoAsIdmMAFaNeM3LeyuQFkw3+0C0E3pmGHoxJnCr+7fesWlLe6/Xq+ZHYtW\n3OB7xo+DUX4uXOM2+ZLJf8/NhtmQMlsHN/uP3Po595G1LwXGKtyzdtDiw8RGCRzMnBYKQ5Su3rB2\nP9KxWPsuVRZmbYRduR0a2Dlmi1j9CBwbhY5dU8AMqYY5AkzwvnT+Sn4YxzPYHSe1RqwSiGmX/Sof\nJ5IqBB6iaJc8mZf+fRMLrP2k8vq8stVRMBvR04uQtoqIYRSp/2xpArnNAgMBAAEwDQYJKoZIhvcN\nAQEFBQADggEBAIVMeHN+J3/1zkHOC31mBq6f2LoY8t7RMSRxw/WS98LGBbCPPl43ZaqoSR29CpcF\n2cy1AIuoC7yIaB1VC32PCZilylHUNd02tR1AattDSJbbryr/NO6CTSkwS4bOdQibdPgypTE3x52F\nqNRg7eTSOwD2y/vh9EPWYWL596u7AB10P6JAgoFVQO1nTaqIJ0WHIYyiIo4kRb1+VSZaIqekRaWK\nka4M7raBjXDEmtGgBH9fy037EBSpQN0sKt9Kujudx0X6nceusveOgzWFzur5K1s7Nw0Q6wurUo+l\ngR9UXcmLg11etoo1Rg2qsK8ErWTeJbBjWnCtZ0N6/was4wS2NGQ=";
//
        requestsSettings.sslCertificates = @[[NSData dataWithBase64EncodedString:cert]];
        
//        requestsSettings.sslCertificates = [CRYPTING_MANAGER getDecryptedCertNSData];
//        requestsSettings.sslCertificates = nil;
        requestsSettings.repeateManager = nil;
        requestsSettings.timeOutSeconds = 15;
        requestManager = [[HttpRequestManager alloc] initWithSettings:requestsSettings];
        requestManager.responseAnalizerClass = [HttpRequestSOAPResponseAnalizer class];
        requestManager.requestBuilderClass = [HttpRequestSOAPRequestBuilder class];
    }
    return self;
}

@end
