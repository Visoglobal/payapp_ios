

#import "NSStringAdditions.h"
#import <CommonCrypto/CommonDigest.h>

@implementation NSString (NSStringAdditions)

- (NSString*) md5
{
	const char* cString = [self UTF8String];
	unsigned char result[CC_MD5_DIGEST_LENGTH];
	
	CC_MD5(cString, strlen(cString), result);
	
	NSMutableString* buffer = [[NSMutableString alloc]initWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
	
	for (NSInteger i = 0; i < CC_MD5_DIGEST_LENGTH; ++i)
	{
		[buffer appendFormat:@"%02x", result[i]];
	}
	
	NSString* md5Hash = [NSString stringWithString:buffer];
	[buffer release];
	
	return md5Hash;
}

- (NSString*) toBase64EncodedString
{
	return [[self dataUsingEncoding:NSUTF8StringEncoding] base64Encoded];
}

- (NSString*) toBase64DecodedString
{
	return [[[NSString alloc] initWithData:[[self dataUsingEncoding:NSUTF8StringEncoding] base64Decoded] 
								 encoding:NSUTF8StringEncoding] autorelease];
}

- (NSString*) trim
{
	return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

+ (NSString*) emptyStringIfNil:(NSString*)value
{
	return !value ? @"" : [value trim];
}

- (NSString*) urldecode
{
	return [self stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
}

@end
