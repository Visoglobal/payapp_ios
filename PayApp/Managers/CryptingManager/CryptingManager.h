#import <Foundation/Foundation.h>

#define CRYPTING_MANAGER [CryptingManager sharedCryptingManager]

@interface CryptingManager : NSObject

+ (CryptingManager *)sharedCryptingManager;


-(NSArray*) getDecryptedCertNSData;
-(void)saveCertNsDataIntoKeychain:(NSArray*)certsDataArray;
@end

