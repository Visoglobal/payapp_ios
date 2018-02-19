//
//  VerifyWebView.m
//  PayApp
//
//  Created by Alexey on 17.03.16.
//  Copyright © 2016 Alexey. All rights reserved.
//

#import "VerifyWebView.h"

@implementation VerifyWebView

-(id)initWithFrame:(CGRect)frame verify:(Verify*)verify completion:(ViewComplete)completion
{
    self = [super initWithFrame:frame];
    if (self)
    {
        _completion = [completion copy];
        _verify = verify;
        [self constructViewWithVerify:_verify];
    }
    return self;
}

-(void)setVerify:(Verify*)verify
{
    _verify = verify;
    [self constructViewWithVerify:_verify];
}

-(void)setCompletion:(ViewComplete)completion
{
    _completion = [completion copy];
}

-(void)constructViewWithVerify:(Verify*)verify
{
    if(_verify)
    {
        NSURL *url = [NSURL URLWithString:verify.accessURL];
        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
        [request setTimeoutInterval:90];
        [request setHTTPMethod:@"POST"];
        [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
        NSString *postString = [NSString stringWithFormat:@"PaReq=%@&TermUrl=%@&MD=%@",[self encodeString:verify.paramReqest],[self encodeString:verify.terminalURL],[self encodeString:verify.transactionData]];

        NSData *data = [postString dataUsingEncoding:NSUTF8StringEncoding];
        [request setHTTPBody:data];
        if (!webView)
            [self createWebView];
        [webView loadRequest:request];
        
    }else{
        if (_completion)
            _completion(NO);
    }
}

-(void)createWebView
{
    webView = [[UIWebView alloc]initWithFrame:self.bounds];
    webView.delegate = self;
    [self addSubview:webView];
}

- (NSString *)encodeString:(NSString*)unEncodedString
{
    NSMutableString *output = [NSMutableString string];
    const unsigned char *source = (const unsigned char *)[unEncodedString UTF8String];
    int sourceLen = strlen((const char *)source);
    for (int i = 0; i < sourceLen; ++i) {
        const unsigned char thisChar = source[i];
        if (thisChar == ' '){
            [output appendString:@"+"];
        } else if (thisChar == '.' || thisChar == '-' || thisChar == '_' || thisChar == '~' ||
                   (thisChar >= 'a' && thisChar <= 'z') ||
                   (thisChar >= 'A' && thisChar <= 'Z') ||
                   (thisChar >= '0' && thisChar <= '9')) {
            [output appendFormat:@"%c", thisChar];
        } else {
            [output appendFormat:@"%%%02X", thisChar];
        }
    }
    return output;
}

- (BOOL)webView:(UIWebView*)webView shouldStartLoadWithRequest:(NSURLRequest*)request navigationType:(UIWebViewNavigationType)navigationType
{
    NSURL *urlRequest = [request URL];
    
    if([urlRequest.description isEqualToString:_verify.terminalURL])
    {
        if (_completion)
            _completion((navigationType == UIWebViewNavigationTypeFormSubmitted));
    }
    return YES;
    
}

- (void) webViewDidFinishLoad:(UIWebView *)_webView
{
    if ([_webView respondsToSelector:@selector(scrollView)])
    {
        UIScrollView *scrollView = [webView scrollView];
        
        float zoom = webView.bounds.size.width / scrollView.contentSize.width;
        NSString *jsCommand = [NSString stringWithFormat:@"document.body.style.zoom = %f;",zoom];
        [webView stringByEvaluatingJavaScriptFromString:jsCommand];
    }
}

@end
