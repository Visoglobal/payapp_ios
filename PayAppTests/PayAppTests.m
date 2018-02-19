//
//  PayAppTests.m
//  PayAppTests
//
//  Created by Alexey on 07.08.15.
//  Copyright (c) 2015 Alexey. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import <Foundation/Foundation.h>
//#import "TransactionListAnswer.h"
//#import "ToDo.h"
//#import "TransactionListRequest.h"

//#import <HttpRequestLib/AFNetworking/AFNetworking.h>
//#import <HttpRequestLib/HttpRequestManager/HttpRequestManager.h>
//#import <HttpRequestLib/HttpRequestManager/HttpRequestOperation.h>


//#import "HttpRequestManager.h"
//#import "HttpRequestOperation.h"
//#import "AFNetworking.h"
#import "Soap.h"

@interface PayAppTests : XCTestCase

@end

@implementation PayAppTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    XCTAssert(YES, @"Pass");
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

-(void)testSOAPParser
{
    NSDictionary* answerObj = [Soap objectFromXMLString:[self geSOAPanswer]];
    XCTAssertEqual(answerObj !=nil ,true,@"%@", @"Ошибка разбора данных");
}

-(NSString*)geSOAPanswer
{
    return @"<?xml version=\"1.0\" encoding=\"utf-8\" ?><SOAP-ENV:Envelope xmlns:SOAP-ENV=\"http://schemas.xmlsoap.org/soap/envelope/\"><SOAP-ENV:Header/><SOAP-ENV:Body><ns2:CardListRs xmlns:ns2=\"http://www.m4bank.ru/P2P\"><ns2:RqId>1</ns2:RqId><ns2:ServerDate>2015-12-11T14:12:11.544+03:00</ns2:ServerDate><ns2:ToDo><ns2:AllowFinance>true</ns2:AllowFinance></ns2:ToDo><ns2:CardList soapenc:arrayType=\"ns2:Card[]\"><ns2:Card><ns2:CardId>joQ3civd0Xuks++duRhKiVkSI8Di6Z50PeG/x+gtXdA8QDGthwK1PBKekKaIDz4adqW+aSVEoXU0ODojYHOPe8UJW7jsGo71ATs2iO6xOL7ioSJFlklsbo60WzvOr9KyZM/hlmMQsmMyYRZGOmiH8Q==</ns2:CardId><ns2:CardName>Card MasterCard xxxxxxxxxxx8888</ns2:CardName><ns2:CardState>normal</ns2:CardState><ns2:CardFill>full</ns2:CardFill><ns2:CreditDefault>true</ns2:CreditDefault></ns2:Card><ns2:Card><ns2:CardId>joQ3civd0XuL5Q9M0hVT7tXO301rr81EOSfPfmZhTeQrziFlMm+B+p+Sralte0H4J0TdozjJRWpUNQM1bu4GyYw7MiHor6zo2aC6cnOmrZfCDcWg+rsvn7vxjFIO2tbhousmHX/rHxG0P3X5vajEoA==</ns2:CardId><ns2:CardName>Card MasterCard xxxxxxxxxxx7777</ns2:CardName><ns2:CardState>normal</ns2:CardState><ns2:CardFill>full</ns2:CardFill><ns2:CreditDefault>false</ns2:CreditDefault></ns2:Card><ns2:Card><ns2:CardId>joQ3civd0Xv2WTZrQFltMY6r5p9NngRYCr60QbcQZs3+LnzteKcPAM0Qj5xtIte3c5gvA3e2EDHvU8pwXNbZLLfDPY/1PKvrsEC4owLLYUmbuW+6OarYIn+gi1JTLlN3ncXd2yI+mFQz44M2khKXxQ==</ns2:CardId><ns2:CardName>Card MasterCard xxxxxxxxxxx6666</ns2:CardName><ns2:CardState>normal</ns2:CardState><ns2:CardFill>full</ns2:CardFill><ns2:CreditDefault>false</ns2:CreditDefault></ns2:Card><ns2:Card><ns2:CardId>joQ3civd0Xvabbki9tuguzijvlu+ykwcpVG+VzgfANxVn1cPw8Rbo5o+vf7JOQgRK4pdOBtZD64YGX71uoVAQw0Gd2i+fawHkQVgcUSL6nr9p6jEjKBCyw+a8eI4xC7vK/4HUKQ0OlKD0WJUDo0Y8g==</ns2:CardId><ns2:CardName>Card VISA xxxxxxxxxxx6666</ns2:CardName><ns2:CardState>normal</ns2:CardState><ns2:CardFill>full</ns2:CardFill><ns2:CreditDefault>false</ns2:CreditDefault></ns2:Card><ns2:Card><ns2:CardId>joQ3civd0XscYmpYA7cTvS5kta6kVdgKRs+yEqX4HPzhA6ZS8LaFM0qdkjRuR79xqpgpPKhLAe0OPUHaW2NKW/SagKTqCia+cdm7NFkvz1gF0U52M7aH8xDt4ernBHcmSXHaTs9yP6cQswQqCfIxVQ==</ns2:CardId><ns2:CardName>Card VISA xxxxxxxxxxx5555</ns2:CardName><ns2:CardState>normal</ns2:CardState><ns2:CardFill>full</ns2:CardFill><ns2:CreditDefault>false</ns2:CreditDefault></ns2:Card><ns2:Card><ns2:CardId>joQ3civd0Xs1zG73ziw8QvgSVdhsAPLRy3LJtorvVIgg+DIEWp7d7w6KdHm5Z1kWurWFDcPBBAKt0FYQD/zXmDC+tAK54FuObt0F3uNNgsiAvFZ7aeAOn0gBiH8i8+pHzLfAKQBVOYMyi40EDqIiiVOfgKDTqVS3</ns2:CardId><ns2:CardName>Card VISA xxxxxxxxxxx4444</ns2:CardName><ns2:CardState>normal</ns2:CardState><ns2:CardFill>full</ns2:CardFill><ns2:CreditDefault>false</ns2:CreditDefault></ns2:Card><ns2:Card><ns2:CardId>joQ3civd0Xtw9Blbq1M+RWrFxI/PbqEL0zMXoWAh1uVgWdmpUpZ4DAlkSQkxRkKXQslQK04+SMry1yVhepOXqbtOdvqmXf2ZoFeaM+/Vxg4sIKShCuZaCng2yt4KD2kofxfZydGvFdWx0Xil/eKkYO3Ec67KOLmd</ns2:CardId><ns2:CardName>Card VISA xxxxxxxxxxxx3333</ns2:CardName><ns2:CardState>normal</ns2:CardState><ns2:CardFill>full</ns2:CardFill><ns2:CreditDefault>false</ns2:CreditDefault></ns2:Card><ns2:Card><ns2:CardId>joQ3civd0Xu9OJdoTmqz9LsN397mvC3fSSQ6gRVHi653ohPodgXynpKnMWwj6HJSECI5g9lpiEZdzF7XBtWd80jo0Jca/OkE5OsS9E/hSqxfSJZY8KLQKixEWZYnZRF+ewyWIpdCKENDrKNnhu4RJw==</ns2:CardId><ns2:CardName>Card VISA xxxxxxxxxxxx2222</ns2:CardName><ns2:CardState>normal</ns2:CardState><ns2:CardFill>full</ns2:CardFill><ns2:CreditDefault>false</ns2:CreditDefault></ns2:Card><ns2:Card><ns2:CardId>joQ3civd0XsTAFULkFWQSdW4Cq5fmj9uDODquPfUIsIf9hia8JFs0C6giH1wcAS6hsMbK4yezl2HvWk9KlWNlZR3WELB524c6QoIjJ3tkTu9I0PwE94szfLaQJSSZ4tuFKnKe+6gFff7k3hnTxPsSg==</ns2:CardId><ns2:CardName>Card VISA xxxxxxxxxxxx1111</ns2:CardName><ns2:CardState>normal</ns2:CardState><ns2:CardFill>full</ns2:CardFill><ns2:CreditDefault>false</ns2:CreditDefault></ns2:Card><ns2:Card><ns2:CardId>joQ3civd0XvPhrCSnEu7aGnA6sbqbm3VGdNHMZShO0DRnUz4SaafU5wdr+HhVi/x9qBZju76UtLnseFGbyUpKEjnbXqnFntf3HobU3D3Svp5aZFfeLvq4Whzz5HbHPUQ7u7HsjFgWWO+uVsV6QaNKigxwU97pXCB</ns2:CardId><ns2:CardName>Card VISA xxxxxxxxxxxx5679</ns2:CardName><ns2:CardState>normal</ns2:CardState><ns2:CardFill>full</ns2:CardFill><ns2:CreditDefault>false</ns2:CreditDefault></ns2:Card></ns2:CardList></ns2:CardListRs></SOAP-ENV:Body></SOAP-ENV:Envelope>";
}
//-(void) testTransactionListAnswerClassConstructor{
//    
//    NSDictionary *xmlDict = [NSDictionary dictionaryWithXMLString:[self getTransactionListRequestString]];
//    
//    TransactionListAnswer* object = [TransactionListAnswer classWithProperties:xmlDict];
//    XCTAssertEqual(object !=nil ,true,@"%@", @"Ошибка разбора данных");
//}
//
//
//-(NSString*)getTransactionListRequestString{
//    NSString* answer = @"<TransactionListRs><Version>1</Version><RqId>str1234</RqId><ServerDate>2012-12-13T12:12:12</ServerDate><ToDo><VerifyContact>str1234</VerifyContact><ConfirmMoneySend>123</ConfirmMoneySend><ConfirmMoneyReceive>123</ConfirmMoneyReceive><HasTrNews>123</HasTrNews></ToDo><TransactionList><Transaction><TrId>str1234</TrId><TrDate>2012-12-13T12:12:12</TrDate><TrUpdateDate>2012-12-13T12:12:12</TrUpdateDate><IsNew>true</IsNew><TrState>needsender</TrState><ResultCode>str1234</ResultCode><Sender><Client><ClientId>str1234</ClientId><FamilyName>str1234</FamilyName><Name>str1234</Name><ParentName>str1234</ParentName><BirthDate>2012-12-13</BirthDate><Sex>male</Sex><ContactList><Contact><Phone>str1234</Phone></Contact></ContactList><NeedRegisterFin>true</NeedRegisterFin></Client></Sender><Receiver><Client><ClientId>str1234</ClientId><FamilyName>str1234</FamilyName><Name>str1234</Name><ParentName>str1234</ParentName><BirthDate>2012-12-13</BirthDate><Sex>male</Sex><ContactList><Contact><Phone>str1234</Phone></Contact></ContactList><NeedRegisterFin>true</NeedRegisterFin></Client></Receiver></Transaction><Transaction><TrId>str1234</TrId><TrDate>2012-12-13T12:12:12</TrDate><TrUpdateDate>2012-12-13T12:12:12</TrUpdateDate><IsNew>true</IsNew><TrState>needsender</TrState><ResultCode>str1234</ResultCode><Sender><Client><ClientId>str1234</ClientId><FamilyName>str1234</FamilyName><Name>str1234</Name><ParentName>str1234</ParentName><BirthDate>2012-12-13</BirthDate><Sex>male</Sex><ContactList><Contact><Phone>str1234</Phone></Contact></ContactList><NeedRegisterFin>true</NeedRegisterFin></Client></Sender><Receiver><Client><ClientId>str1234</ClientId><FamilyName>str1234</FamilyName><Name>str1234</Name><ParentName>str1234</ParentName><BirthDate>2012-12-13</BirthDate><Sex>male</Sex><ContactList><Contact><Phone>str1234</Phone></Contact></ContactList><NeedRegisterFin>true</NeedRegisterFin></Client></Receiver></Transaction></TransactionList></TransactionListRs>";
//    return answer;
//}
//
////-(void)testToDoAnswerClassConstructor
////{
////    ToDo* testObj = [[ToDo alloc] init];
////    testObj[@"VerifyContact"] = @"asdasd";
////    NSString* asd= testObj.VerifyContact;
////    XCTAssertEqual(asd !=testObj ,true,@"%@", @"Ошибка разбора данных");
////}
//
//-(void)testransactionListRequestClassConstructor
//{
//    NSDictionary* test = @{
//                              @"Version":@"1.00.1",
//                              @"RqId":@"123",
//                              @"LocalDate":@"22.11.204",
//                              @"SessionId":@"12312312dasdas",
//                              @"TrId":@"123",
//                              @"DateFrom":@"22.11.2004",
//                              @"DateTo":@"30.1.2005",
//                              @"CardId":@"123",
//                              @"TrState":@"stopped",
//                              @"IsNew":@"1"
//                          };
//    TransactionListRequest* treq = [TransactionListRequest classWithProperties:test];
//    XCTAssertEqual(treq !=nil ,true,@"%@", @"Ошибка разбора данных");
//}

//-(void)testRequestSend
//{
//    NSURL* url = [NSURL URLWithString:@"https://10.30.0.1:24498"];
//    
//    NSMutableURLRequest* request = [NSMutableURLRequest requestWithURL:url];
//    
//    NSString* xmlString =  @"<?xml version=\"1.0\" encoding=\"utf-8\"?><Test MsgType=\"Request\" MsgNum=\"20151016144332-64F2B1C4-19DF-477B-84B1-5994A4A44B40-A142\"><PhoneIMEI>932F9BDA-DB6F-4A00-B7AB-32F8D350AEBE</PhoneIMEI><PhoneModel>iPad2,7</PhoneModel><OSVersion>8.00</OSVersion><AppVersion>2.2.11</AppVersion></Test>";
//    
//    NSData * postBody = [xmlString dataUsingEncoding:NSUTF8StringEncoding];
//    
//    NSLog(@"%@",[[NSString alloc] initWithData:postBody encoding:NSUTF8StringEncoding]);
//    
//
//    [request addValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
//    [request addValue:@"none" forHTTPHeaderField:@"Accept-Encoding"];
//    [request setHTTPBody:postBody];
//    [request addValue:[NSString stringWithFormat:@"%lu", (unsigned long)postBody.length] forHTTPHeaderField:@"Content-Length"];
//    
//    [request setHTTPMethod:@"POST"];
//    [request setTimeoutInterval:5];
//    
//    HttpRequestSettings* globalSettings = [HttpRequestSettings new];
//    NSOperationQueue* operationQueue = [[NSOperationQueue alloc] init];
//    
//    HttpRequestOperation *operation1 = [[HttpRequestOperation alloc] initWithSettings:globalSettings request:request];
//    [operation1 setOperationCompletion:^(id responseObject, NSError *error) {
//        NSLog(@"operation1");
//    }];
//    HttpRequestOperation *operation2 = [[HttpRequestOperation alloc] initWithSettings:globalSettings request:request];
//    [operation2 setOperationCompletion:^(id responseObject, NSError *error) {
//        NSLog(@"operation2");
//    }];
//    HttpRequestOperation *operation3 = [[HttpRequestOperation alloc] initWithSettings:globalSettings request:request];
//    [operation3 setOperationCompletion:^(id responseObject, NSError *error) {
//        NSLog(@"operation3");
//    }];
//    HttpRequestOperation *operation4 = [[HttpRequestOperation alloc] initWithSettings:globalSettings request:request];
//    [operation4 setOperationCompletion:^(id responseObject, NSError *error) {
//        NSLog(@"operation4");
//    }];
//    HttpRequestOperation *operation5 = [[HttpRequestOperation alloc] initWithSettings:globalSettings request:request];
//    [operation5 setOperationCompletion:^(id responseObject, NSError *error) {
//        NSLog(@"operation5");
//    }];
//    
//    [operationQueue addOperation:operation1];
//    [operationQueue addOperation:operation2];
//    [operationQueue addOperation:operation3];
//    [operationQueue addOperation:operation4];
//    [operationQueue addOperation:operation5];
//    
//    
//  }
@end
