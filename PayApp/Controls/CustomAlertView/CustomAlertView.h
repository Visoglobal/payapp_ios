//
//  CustomAlertView.h
//  PayApp
//
//  Created by Alexey on 21.09.16.
//  Copyright © 2016 Alexey. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^AlertButtonSelectionBlock)(NSInteger buttonIndex);

@interface CustomAlertView : NSObject<UIAlertViewDelegate>
{
    AlertButtonSelectionBlock _completion;
    UIAlertView *alert;
}

- (id)initWithButtonTitle:(NSString *)buttonTitle title:(NSString *)title message:(NSString *)message completion:(AlertButtonSelectionBlock)completion;
- (id)initWithButtonTitle:(NSString *)yesButtonTitle  noButtonTitle:(NSString*)noButtonTitle title:(NSString *)title message:(NSString *)message completion:(AlertButtonSelectionBlock)completion;
- (void)show;

@end
