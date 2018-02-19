//
//  BaseManager.h
//  PayApp
//
//  Created by Alexey on 11.12.15.
//  Copyright © 2015 Alexey. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HttpRequestSOAPXMLRequestSerializer.h"
#import "HttpRequestSOAPXMLResponceSerializer.h"
#import <HttpRequestLib/HttpRequestManager/HttpRequestOperationHandler.h>
#import "HttpRequestSOAPRequestBuilder.h"
#import "FormatHelper.h"
#import "FaultServerAnswer.h"

@interface BaseManager : NSObject
{
    HttpRequestSettings* requestsSettings;
    HttpRequestManager* requestManager;
}

@end
