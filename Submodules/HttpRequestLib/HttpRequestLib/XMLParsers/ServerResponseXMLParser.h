

#import <Foundation/Foundation.h>
#import "AQXMLParser.h"

@class ServerResponseXMLParser;

@protocol ServerResponseXMLParserDelegate <NSObject>

- (void) didParsingComplete:(ServerResponseXMLParser*)parser;
- (void) didParsingFail:(ServerResponseXMLParser*)parser error:(NSError*)parserError;

@end

@interface ServerResponseXMLParser : NSObject <AQXMLParserDelegate>
{
	AQXMLParser*  parser;
	
	NSMutableDictionary* xmlTree;
	NSMutableDictionary* currentElement;
	NSMutableArray* stack;
	
	NSMutableString* currentElementValue;
	
	id <ServerResponseXMLParserDelegate> delegate;
    
    void ((^_completion)(id responseObject,NSError * error));
}

@property (retain) id <ServerResponseXMLParserDelegate> delegate;
@property (readonly) NSMutableDictionary* xmlTree;

- (id)  :(NSData*)data;
- (id)initWithData:(NSData*)data;
- (id)initWithData:(NSData*)data andCommpletion:(void (^)(id responseObject,NSError * error))complete;
- (void) parse;
- (void) abort;

@end
