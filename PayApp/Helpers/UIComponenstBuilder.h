//
//  UIComponenstBuilder.h
//  PayApp
//
//  Created by Alexey on 26.01.16.
//  Copyright © 2016 Alexey. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CustomTextField.h"
#import "CustomCheckBox.h"

@interface UIComponenstBuilder : NSObject

+(CustomTextField*)getTextFieldWithPlaceholder:(NSString*)placeholder delegate:(id)textFieldDelegate;
+(CustomCheckBox*)getCheckBoxWithTitle:(NSString*)title;

@end
