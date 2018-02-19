//
//  UIComponenstBuilder.m
//  PayApp
//
//  Created by Alexey on 26.01.16.
//  Copyright © 2016 Alexey. All rights reserved.
//

#import "UIComponenstBuilder.h"

@implementation UIComponenstBuilder

+(CustomTextField*)getTextFieldWithPlaceholder:(NSString*)placeholder delegate:(id)textFieldDelegate
{
    CustomTextField* field = [[CustomTextField alloc] initWithFrame:CGRectMake(10, 0, 300, 35)];
    field.placeholder = placeholder;
    field.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    field.autocorrectionType = UITextAutocorrectionTypeNo;
    field.autocapitalizationType = UITextAutocapitalizationTypeNone;
    
    field.delegate = textFieldDelegate;
    
    return field;
}

+(CustomCheckBox*)getCheckBoxWithTitle:(NSString*)title
{
    CustomCheckBox* checkBox = [[CustomCheckBox alloc] initWithFrame:CGRectMake(10, 0, 300, 35)];
    [checkBox setTitle:title forState:UIControlStateNormal];
    [checkBox setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [checkBox.titleLabel setFont:[UIFont fontWithName:@"Helvetica Neue" size:14]];
    
    return checkBox;
}

@end
