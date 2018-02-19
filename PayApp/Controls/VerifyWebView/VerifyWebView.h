//
//  VerifyWebView.h
//  PayApp
//
//  Created by Alexey on 17.03.16.
//  Copyright © 2016 Alexey. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Verify.h"

typedef void(^ViewComplete)(BOOL success);

@interface VerifyWebView : UIView <UIWebViewDelegate>
{
    Verify* _verify;
    ViewComplete _completion;
    UIWebView* webView;
}

-(id)initWithFrame:(CGRect)frame verify:(Verify*)verify completion:(ViewComplete)completion;
-(void)setVerify:(Verify*)verify;
-(void)setCompletion:(ViewComplete)completion;

@end
