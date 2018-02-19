

#import "ServerResponseXMLParser.h"
#import "serverConfig.h"

@implementation ServerResponseXMLParser

@synthesize delegate, xmlTree;

- (id) initWithData:(NSData*)data
{
	if (!data)
	{
		return nil;
	}
	
	if (self = [super init])
	{
		parser = [[AQXMLParser alloc] initWithData:data];
		xmlTree = [NSMutableDictionary new];
		stack = [NSMutableArray new];
	}
	
	return self;
}

- (id)initWithData:(NSData*)data andCommpletion:(void (^)(id responseObject,NSError * error))complete
{
    self = [[[self class] alloc] initWithData:data];
    if (self && complete){
        _completion = [complete copy];
        [self parse];
    }
    return self;
}

- (void) parse
{
	parser.delegate = self;
	[parser parse];
}

- (void) abort
{
	[parser abortParsing];
}

#pragma mark -
#pragma mark AQXMLParserDelegate

- (void)parserDidStartDocument:(AQXMLParser *)parser
{
	
}

- (void)parserDidEndDocument:(AQXMLParser *)parser
{
	[delegate didParsingComplete:self];
    if (_completion)
        _completion(self, nil);
}

- (void)parser:(AQXMLParser *)aParser parseErrorOccurred:(NSError *)parseError
{
    if (_completion)
        _completion(self, parseError);

	[delegate didParsingFail:self error:parseError];
	[aParser abortParsing];
}

- (void)parser:(AQXMLParser *)parser didStartElement:(NSString *)elementName 
										namespaceURI:(NSString *)namespaceURI 
									   qualifiedName:(NSString *)qName 
										  attributes:(NSDictionary *)attributeDict
{
	if (currentElement)
	{
		NSMutableDictionary* current = currentElement;
		[stack addObject:current];
		
		currentElement = [NSMutableDictionary new];
		NSMutableArray* children = [current objectForKey:kElementChildren];
		
		if (!children)
		{
			children = [NSMutableArray new];
			[current setObject:children forKey:kElementChildren];
		}
		
		[children addObject:currentElement];
	}
	else
	{
		currentElement = [NSMutableDictionary new]; // This is a root element.
		[xmlTree setObject:currentElement forKey:elementName];
	}
	
	[currentElement setValue:elementName forKey:kElementName];
	[currentElement setValue:attributeDict forKey:kElementAttibutes];
}

- (void)parser:(AQXMLParser *)parser didEndElement:(NSString *)elementName 
									  namespaceURI:(NSString *)namespaceURI 
									 qualifiedName:(NSString *)qName
{
	NSString* string = (currentElementValue ? [NSString stringWithString:currentElementValue] : nil);
	[currentElement setValue:[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] forKey:kElementValue];
    
	currentElementValue = nil;
	currentElement = nil;
	
	if (stack.count > 0)
	{
        currentElement = [stack lastObject];
		[stack removeLastObject];
	}
}

- (void)parser:(AQXMLParser *)parser foundCharacters:(NSString *)string
{
	if (!currentElementValue)
		currentElementValue = [NSMutableString new];
	
	[currentElementValue appendString:string];
}

- (void)parser:(AQXMLParser *)parser foundCDATA:(NSData *)CDATABlock
{
    if (!currentElementValue)
		currentElementValue = [[NSMutableString alloc] initWithData:CDATABlock encoding:NSUTF8StringEncoding];
	else
    {
        NSString* block = [[NSString alloc] initWithData:CDATABlock encoding:NSUTF8StringEncoding];
        [currentElementValue appendString:block];
    }
}

@end
