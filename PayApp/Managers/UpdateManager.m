//
//  UpdateManager.m
//  PayApp
//
//  Created by Alexey on 20.01.16.
//  Copyright © 2016 Alexey. All rights reserved.
//

#import "UpdateManager.h"
#import "ClientManager.h"
#import "ClientViewAnswer.h"
#import "ClientListAnswer.h"
#import "UserManager.h"
#import "Contact.h"
#import "Client.h"

@implementation UpdateManager

+ (instancetype) sharedUpdateManager
{
    static UpdateManager * _sharedUpdateManager = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        _sharedUpdateManager = [[UpdateManager alloc] init];
    });
    
    return _sharedUpdateManager;
}

- (void) updateAppBaseDataWithCompletion:(void (^)())completion
{
    [CLIENT_MANAGER getClientViewWithCompletion:^(id clientViewAnswer, NSError *error) {
        NSMutableArray* clients = [NSMutableArray new];
        
        if (clientViewAnswer && [(ClientViewAnswer*)clientViewAnswer contactList])
        {
            for (Contact* contact in[(ClientViewAnswer*)clientViewAnswer contactList])
            {
                Client* client = [Client new];
                client.needRegisterFin = contact.isVerified;
                client.contact = contact.email?contact.email:contact.phone;
                [clients addObject:client];
            }
        }
        
        [CLIENT_MANAGER getAllContactsWithCompletion:^(NSArray *contacts) {
            
            if (contacts && contacts.count>0){ [clients addObjectsFromArray:contacts]; }
            
            if (clients.count>0)
            {
                NSArray *uniqueContacts = [clients valueForKeyPath:@"@distinctUnionOfObjects.contact"];
                NSArray *uniqueClients = [self getNormalizedClientsListFromClientsList:clients andUniqueContactsList:uniqueContacts];
                
                [CLIENT_MANAGER getClientList:uniqueClients withCompletion:^(id clientListAnswer, NSError *error) {
                    
                    if (!error && clientListAnswer && [(ClientListAnswer*)clientListAnswer clientList])
                    {
                        NSMutableArray* contactList = [self getSplittedClientsFromUniqueClients:uniqueClients andClientsListFromServer:[(ClientListAnswer*)clientListAnswer clientList]];
                        USER_MANAGER.contactList = contactList;
                    }else
                        if (uniqueClients){
                            NSMutableArray* contactList = [self getSplittedClientsFromUniqueClients:uniqueClients andClientsListFromServer:[NSArray new]];
                            USER_MANAGER.contactList = contactList;
                        }else
                            USER_MANAGER.contactList = [NSMutableArray new];
                    
                    if (completion)
                        completion();
                }];
            }else{
                if (completion)
                    completion();
            }
        }];
        
    }];
}

-(NSMutableArray*)getSplittedClientsFromUniqueClients:(NSArray*)uniqueClients andClientsListFromServer:(NSArray*)clientsListFromServer
{
    if (!clientsListFromServer || !uniqueClients)
        return nil;
    
    NSMutableArray* splittedList = [NSMutableArray new];
    for (Client* client in uniqueClients) {
        Client* clientFromServer = [self getClientWithContact:client.contact fromClientList:clientsListFromServer];
        if (clientFromServer)
        {
            client.clientId = clientFromServer.clientId?clientFromServer.clientId:@"";
            if((!client.familyName || client.familyName.length == 0) && clientFromServer.familyName)
                client.familyName = clientFromServer.familyName;
            if((!client.name || client.name.length == 0) &&  clientFromServer.name)
                client.name = clientFromServer.name;
            if((!client.parentName || client.parentName.length == 0) &&  clientFromServer.parentName)
                client.parentName = clientFromServer.parentName;
            
            client.birthDate = clientFromServer.birthDate?clientFromServer.birthDate:@"";
            client.sex = clientFromServer.sex?clientFromServer.sex:@"";
            client.isNeedRegisterFin = clientFromServer.isNeedRegisterFin?clientFromServer.clientId:@"false";
        }
        [splittedList addObject:client];
    }
    return splittedList;
}

-(NSArray*)getNormalizedClientsListFromClientsList:(NSArray*)clientsList andUniqueContactsList:(NSArray*)contactList
{
    if (!contactList || !clientsList)
        return nil;
    NSMutableArray* clients = [NSMutableArray new];
    for (NSString* contact in contactList) {
//        if (![USER_MANAGER.contact.contact isEqualToString:contact])
//        {
            Client* client = [self getClientWithContact:contact fromClientList:clientsList];
            if (client)
                [clients addObject:client];
//        }
    }
    return clients;
}

-(Client*)getClientWithContact:(NSString*)contact fromClientList:(NSArray*)clientList
{
    if (!contact || !clientList || clientList.count == 0) {
        return nil;
    }
    
    for (Client* client in clientList) {
        if ([client.contact isEqualToString:contact])
            return client;
    }
    
    return nil;
}

@end
