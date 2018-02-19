//
//  CustomAlertView.m
//  PayApp
//
//  Created by Alexey on 21.09.16.
//  Copyright © 2016 Alexey. All rights reserved.
//

#import "CustomAlertView.h"

@implementation CustomAlertView


- (id)initWithButtonTitle:(NSString *)buttonTitle title:(NSString *)title message:(NSString *)message completion:(AlertButtonSelectionBlock)completion
{
    self = [super init];
    if (self)
    {
        _completion = [completion copy];
        
        alert = [[UIAlertView alloc] initWithTitle:title
                                                        message:message
                                                       delegate:self
                                              cancelButtonTitle:buttonTitle
                                              otherButtonTitles:nil];
    }
    return self;
}

- (id)initWithButtonTitle:(NSString *)yesButtonTitle  noButtonTitle:(NSString*)noButtonTitle title:(NSString *)title message:(NSString *)message completion:(AlertButtonSelectionBlock)completion
{
    self = [super init];
    if (self)
    {
        _completion = [completion copy];
        
       alert = [[UIAlertView alloc] initWithTitle:title
                                                        message:message
                                                       delegate:self
                                              cancelButtonTitle:noButtonTitle
                                              otherButtonTitles:yesButtonTitle,nil];
    }
    return self;
}

- (void)show
{
    if (alert)
        [alert show];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (_completion) {
        _completion(buttonIndex);
    }
}


@end
