//
//  CustomDatePickerView.h
//  PayApp
//
//  Created by Alexey on 07.10.15.
//  Copyright © 2015 Alexey. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomTextField.h"

@class CustomDatePickerView;

@protocol CustomDatePickerViewDelegate <NSObject>

- (void) pickerViewShowed;
- (void) pickerViewHided;
@end

@interface CustomDatePickerView : UIView
{
    
    UIButton* backgroundButton;
    CustomTextField*  dateField;
    UIImageView* calendarImageView;

    UIView* pickerView;
    UIDatePicker* datePicker;
    UITapGestureRecognizer *tap;
}

@property (nonatomic, retain) id <CustomDatePickerViewDelegate> delegate;

-(void) setPickerValue:(NSString*)value;
-(void) setPlaceholder:(NSString*)value;
-(void) hideDataPicker;
-(void) setDataLableFromDate:(NSDate*)date;
-(NSString*)getSelectedDate;
-(NSDate*)getDate;
@end
