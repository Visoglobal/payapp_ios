#import "CryptingManager.h"
#import "UserDefaultsHelper.h"
#import "RNDecryptor.h"
#import "RNEncryptor.h"

#import "KeyChainManager.h"
//Keys
#import "KeychainItemWrapper.h"
NSString * const cryptingDecryptKey = @"decryptKey";


@implementation CryptingManager

static CryptingManager * sharedCryptingManager = NULL;

+ (CryptingManager *)sharedCryptingManager
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        if (sharedCryptingManager == NULL)
        {
            sharedCryptingManager = [CryptingManager new];
        }
        
    });
    
    return sharedCryptingManager;
}

- (id)init
{
    self = [super init];
    if (self) {
        if (![self isCertWasDescrypt]){
                NSArray* linkArray = [self certFilePathList];
        
                if (linkArray && linkArray.count>0){
                        NSArray* criptedCerts = [self getEncryptedCertNSDataArrayFromLinkArray:linkArray];
                        NSArray* dectyptedCerts = [self decryptCertNSDataArray:criptedCerts];
                        [self saveCertNsDataIntoKeychain:dectyptedCerts];
                        [self saveSuccesfullDescrypt];
                }
        }
    }
    return self;
}

-(BOOL) isCertWasDescrypt{
    return  [UserDefaultsHelper boolForKey:cryptingDecryptKey];
}

-(void) saveSuccesfullDescrypt{
    [UserDefaultsHelper setBool:YES forKey:cryptingDecryptKey];
}

-(NSArray*)certFilePathList{
    
    NSURL *bundleRoot = [[NSBundle mainBundle] bundleURL];
    NSFileManager *fm = [NSFileManager defaultManager];
    NSArray * dirContents =
    [fm contentsOfDirectoryAtURL:bundleRoot
      includingPropertiesForKeys:@[]
                         options:NSDirectoryEnumerationSkipsHiddenFiles
                           error:nil];
    NSPredicate * fltr = [NSPredicate predicateWithFormat:@"pathExtension='cer'"];
    NSArray * certificates = [dirContents filteredArrayUsingPredicate:fltr];
    
    return certificates;
}

-(NSArray*) getEncryptedCertNSDataArrayFromLinkArray:(NSArray*)linkArray{
    
    NSMutableArray* dataArray = [NSMutableArray new];
    
    if (!linkArray)
        return dataArray;
    
    for (NSString* link in linkArray) {
         NSData *fileData = [NSData dataWithContentsOfFile:link];
        [dataArray addObject:fileData];
    }
    
    return dataArray;
}

-(NSArray*) decryptCertNSDataArray:(NSArray*)linkArray{
    
    NSMutableArray* dataArray = [NSMutableArray new];
    
    if (!linkArray)
        return dataArray;
    
    for (NSData* cert in linkArray) {
        NSError *error = nil;
        NSData *decryptedData = [RNDecryptor decryptData:cert
                                            withPassword:criptoKey
                                                   error:&error];
        if (decryptedData)
            [dataArray addObject:decryptedData];
    }
    
    return dataArray;
}


-(NSArray*) getDecryptedCertNSData{
    
    NSArray* criptedData = [KEYCHAIN_MANAGER loadCertNsDataFromKeychain];
    if (criptedData){
        return criptedData;
    }
    
    return nil;
}

-(void)saveCertNsDataIntoKeychain:(NSArray*)certsDataArray
{
    [KEYCHAIN_MANAGER saveCertNsDataIntoKeychain:certsDataArray];
}

@end


