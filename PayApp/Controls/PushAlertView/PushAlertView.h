//
//  PushAlertView.h
//  PayApp
//
//  Created by Alexey on 21.10.16.
//  Copyright © 2016 Alexey. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PushAlertView : UIView

- (id) initWithTitle:(NSString*)title andMessage:(NSString*)message;
- (void) show;
@end
