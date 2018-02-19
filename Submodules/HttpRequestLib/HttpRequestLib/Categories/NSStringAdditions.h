
#import <Foundation/Foundation.h>


@interface NSString (NSStringAdditions)

- (NSString*) md5;
- (NSString*) toBase64EncodedString;
- (NSString*) toBase64DecodedString;

- (NSString*) trim;

+ (NSString*) emptyStringIfNil:(NSString*)value;

@end
