//
//  ClientManager.m
//  PayApp
//
//  Created by Alexey on 14.01.16.
//  Copyright © 2016 Alexey. All rights reserved.
//

#import "ClientManager.h"
#import "ClientViewRequest.h"
#import "UserManager.h"
#import "ClientViewAnswer.h"
#import "ClientListRequest.h"
#import "ClientListAnswer.h"
#import "Client.h"
#import "ClientInviteRequest.h"
#import "ClientInviteAnswer.h"
#import "ClientEditRequest.h"
#import "ClientEditAnswer.h"

#import <AddressBook/AddressBook.h>
#import <AddressBook/ABAddressBook.h>
#import <AddressBook/ABPerson.h>
#import "UIImageView+WebCache.h"
#import "ImageHelper.h"
#import "Device.h"

@implementation ClientManager

+ (instancetype) sharedClientManager
{
    static ClientManager * _sharedClientManager = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        _sharedClientManager = [[ClientManager alloc] init];
    });
    
    return _sharedClientManager;
}

- (void) editClientWithName:(NSString*)name
                 familyName:(NSString*)familyName
                 parentName:(NSString*)parentName
                  birthDate:(NSString*)birthDate
                        sex:(NSString*)sex
           allowProfileView:(NSString*)allowProfileView
          base64imageString:(NSString*)base64imageString
             withCompletion:(void (^)(NSError *error))completion
{
    ClientEditRequest* clientRqst = [ClientEditRequest new];
    clientRqst.requestId = @"1";
    clientRqst.localDate = [FormatHelper stringDateTimeFromDate:[NSDate new]];
    clientRqst.sessionId = USER_MANAGER.sessionId;
    clientRqst.familyName = familyName;
    clientRqst.name = name;
    clientRqst.parentName = parentName;
    clientRqst.birthDate = birthDate;
    clientRqst.sex = sex;
    clientRqst.allowProfileView = allowProfileView;
    clientRqst.base64imageString = base64imageString;
    
    clientRqst.device = USER_MANAGER.userDevice;
    
    [requestManager sendRequest:clientRqst complete:^(id responseObject, NSError *error) {
        ClientEditAnswer* answer;
        if (!error && responseObject){
            FaultServerAnswer* fault =[[FaultServerAnswer alloc] initWithProperties:[(HttpRequestOperationHandler*)responseObject body]];
            error = [fault getError];
            answer = [[ClientEditAnswer alloc] initWithProperties:[(HttpRequestOperationHandler*)responseObject body]];
            if (answer){
            }
        }
        
        if (completion)
            completion(error);
    }];
}

- (void) addClient:(NSString*)client withCompletion:(void (^)(id addClientAnswer,  NSError *error))completion
{
    ClientInviteRequest* clientRqst = [ClientInviteRequest new];
    
    clientRqst.requestId = @"1";
    clientRqst.localDate = [FormatHelper stringDateTimeFromDate:[NSDate new]];
    clientRqst.sessionId = USER_MANAGER.sessionId;
    clientRqst.contact = client;
    
    [requestManager sendRequest:clientRqst complete:^(id responseObject, NSError *error) {
        ClientInviteAnswer* answer;
        if (!error && responseObject){
            FaultServerAnswer* fault =[[FaultServerAnswer alloc] initWithProperties:[(HttpRequestOperationHandler*)responseObject body]];
            error = [fault getError];
            answer = [[ClientInviteAnswer alloc] initWithProperties:[(HttpRequestOperationHandler*)responseObject body]];
            if (answer){
            }
        }
        
        if (completion)
            completion(answer, error);
    }];
}


- (void) getClientViewWithCompletion:(void (^)(id clientViewAnswer,  NSError *error))completion
{
    ClientViewRequest* clientRqst = [ClientViewRequest new];
    clientRqst.requestId = @"1";
    clientRqst.localDate = [FormatHelper stringDateTimeFromDate:[NSDate new]];
    clientRqst.sessionId = USER_MANAGER.sessionId;
    
    [requestManager sendRequest:clientRqst complete:^(id responseObject, NSError *error) {
        ClientViewAnswer* answer;
        if (!error && responseObject){
            FaultServerAnswer* fault =[[FaultServerAnswer alloc] initWithProperties:[(HttpRequestOperationHandler*)responseObject body]];
            error = [fault getError];
            answer = [[ClientViewAnswer alloc] initWithProperties:[(HttpRequestOperationHandler*)responseObject body]];
            if (answer){
                USER_MANAGER.contactList = answer.contactList;
                USER_MANAGER.contact.allowProfileView = answer.allowProfileView;
                USER_MANAGER.contact.firstName = answer.familyName;
                USER_MANAGER.contact.secondName = answer.name;
                USER_MANAGER.contact.parentName = answer.parentName;
                [USER_MANAGER.contact setStringSexValue:answer.sex];
                USER_MANAGER.contact.birthDate = answer.birthDate;
    
                NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[ImageHelper getNormalizedImageUrlWithClientId:answer.clientId andSession:USER_MANAGER.sessionId]];
                
                [ImageHelper getImageFromRequest:request withCompletion:^(UIImage *image) {
                    USER_MANAGER.userPhoto = image?image:[UIImage imageNamed:@"payapp_menu_reg2_user_nonpicture.png"];
                    [USER_MANAGER saveContact];
                    if (completion)
                        completion(answer, error);
                }];
                
            }else
                if (completion)
                    completion(answer, error);            
        }else
            if (completion)
                completion(answer, error);
        

    }];
}

- (void) getClientList:(NSArray*)clientList
        withCompletion:(void (^)(id clientListAnswer,  NSError *error))completion
{
    if (!clientList)
    {
        if(completion)
            completion(nil,[NSError errorWithDomain:@"app" code:404 userInfo:[NSDictionary dictionaryWithObjectsAndKeys:@"404",NSLocalizedFailureReasonErrorKey,
                                                                              @"emptyContactList",NSLocalizedDescriptionKey,
                                                                              nil]]);
    }
    
    NSMutableArray* clients = [NSMutableArray new];
    for (Client* contact in clientList) {
        [clients addObject:contact.contact];
    }
    
    ClientListRequest* clientRqst = [ClientListRequest new];
    clientRqst.requestId = @"1";
    clientRqst.localDate = [FormatHelper stringDateTimeFromDate:[NSDate new]];
    clientRqst.sessionId = USER_MANAGER.sessionId;
    clientRqst.contactList = clients;
    
    [requestManager sendRequest:clientRqst complete:^(id responseObject, NSError *error) {
        ClientListAnswer* answer;
        if (!error && responseObject){
            FaultServerAnswer* fault =[[FaultServerAnswer alloc] initWithProperties:[(HttpRequestOperationHandler*)responseObject body]];
            error = [fault getError];
            if (!error)
                answer = [[ClientListAnswer alloc] initWithProperties:[(HttpRequestOperationHandler*)responseObject body]];
        }
        
        if (completion)
            completion(answer, error);
    }];
}


- (void)getAllContactsWithCompletion:(void (^)(NSArray* contacts))completion
{
    
    ABAddressBookRef addressBookRef = ABAddressBookCreateWithOptions(NULL, NULL);
    if (ABAddressBookGetAuthorizationStatus() == kABAuthorizationStatusNotDetermined) {
        ABAddressBookRequestAccessWithCompletion(addressBookRef, ^(bool granted, CFErrorRef error) {
            ABAddressBookRef addressBook = ABAddressBookCreate( );
            if (completion)
                completion([self getAllContactsFromAddressBoock:addressBook]);
        });
    }
    else if (ABAddressBookGetAuthorizationStatus() == kABAuthorizationStatusAuthorized) {
            CFErrorRef *error = nil;
            ABAddressBookRef addressBook = ABAddressBookCreateWithOptions(NULL, error);
        if (completion)
            completion([self getAllContactsFromAddressBoock:addressBook]);
    }else{
        if (completion)
            completion(nil);
    }
}

- (NSArray *)getAllContactsFromAddressBoock:(ABAddressBookRef)addressBook
   {
    ABRecordRef source = ABAddressBookCopyDefaultSource(addressBook);
    CFArrayRef allPeople = (ABAddressBookCopyArrayOfAllPeopleInSourceWithSortOrdering(addressBook, source, kABPersonSortByFirstName));
    CFIndex nPeople = CFArrayGetCount(allPeople); // bugfix who synced contacts with facebook
    NSMutableArray* items = [NSMutableArray arrayWithCapacity:nPeople];
    
    for (int i = 0; i < nPeople; i++) {
        
        @autoreleasepool {
            
            ABRecordRef person = CFArrayGetValueAtIndex(allPeople, i);
            UIImage* userPhoto = [self getImageForPerson:person];
            
            
            //get Phone Numbers
            ABMultiValueRef multiPhones = ABRecordCopyValue(person, kABPersonPhoneProperty);
            
            for(CFIndex i=0; i<ABMultiValueGetCount(multiPhones); i++) {
                @autoreleasepool {
                    CFStringRef phoneNumberRef = ABMultiValueCopyValueAtIndex(multiPhones, i);
                    NSString *phoneNumber = CFBridgingRelease(phoneNumberRef);
                    if (phoneNumber != nil)
                    {
                        Client* newclient = [self getClientFromContact:person];
                        newclient.contact = phoneNumber;
                        newclient.userPhoto = userPhoto;
                        [items addObject:newclient];
                    }
                }
            }
            
            if (multiPhones != NULL) {
                CFRelease(multiPhones);
            }
            
            //get Contact email
            ABMultiValueRef multiEmails = ABRecordCopyValue(person, kABPersonEmailProperty);
            
            for (CFIndex i=0; i<ABMultiValueGetCount(multiEmails); i++) {
                @autoreleasepool {
                    CFStringRef contactEmailRef = ABMultiValueCopyValueAtIndex(multiEmails, i);
                    NSString *contactEmail = CFBridgingRelease(contactEmailRef);
                    if (contactEmail != nil)
                    {
                        Client* newclient = [self getClientFromContact:person];
                        newclient.contact = contactEmail;
                        newclient.userPhoto = userPhoto;
                        [items addObject:newclient];
                    }
                }
            }
            
            if (multiPhones != NULL) {
                CFRelease(multiEmails);
            }
            
        }
    }
    CFRelease(allPeople);
    CFRelease(addressBook);
    CFRelease(source);
    return items;
    
}

-(Client*)getClientFromContact:(ABRecordRef)person
{
    Client *contact = [Client new];
    
    //get First Name
    CFStringRef firstName = (CFStringRef)ABRecordCopyValue(person,kABPersonFirstNameProperty);
    contact.name = [(__bridge NSString*)firstName copy];
    if (firstName != NULL) { CFRelease(firstName);}
    
    //get Last Name
    CFStringRef lastName = (CFStringRef)ABRecordCopyValue(person,kABPersonLastNameProperty);
    contact.familyName = [(__bridge NSString*)lastName copy];
    if (lastName != NULL) { CFRelease(lastName); }
    
    //get Parent Name
    CFStringRef midleName = (CFStringRef)ABRecordCopyValue(person,kABPersonMiddleNameProperty);
    contact.parentName = [(__bridge NSString*)midleName copy];
    if (midleName != NULL) { CFRelease(midleName); }
    
    if (!contact.name) { contact.name = @""; }
    if (!contact.familyName) { contact.familyName = @"";}
    if (!contact.parentName) { contact.parentName = @"";}

    return contact;
}

-(UIImage*)getImageForPerson:(ABRecordRef)person
{
    // get contacts picture, if pic doesn't exists, show standart one
    CFDataRef imgData = ABPersonCopyImageData(person);
    NSData *imageData = (__bridge NSData *)imgData;
    
    UIImage* userPhoto = [UIImage imageWithData:imageData];
    
    if (userPhoto)
        userPhoto = [self getResizedPersonImageFromImage:userPhoto];
    
    if (imgData != NULL) {
        CFRelease(imgData);
    }
    if (!userPhoto) {
        userPhoto = [UIImage imageNamed:@"payapp_menu_reg2_user_nonpicture.png"];
    }

    return userPhoto;
}

-(UIImage*)getResizedPersonImageFromImage:(UIImage*)personImage
{
    return [ImageHelper resizeImage:personImage toSize:CGSizeMake(256, 256)];
}


@end
