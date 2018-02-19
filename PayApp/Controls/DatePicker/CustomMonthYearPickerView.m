//
//  CustomMonthYearPickerView.m
//  PayApp
//
//  Created by Alexey on 14.01.16.
//  Copyright © 2016 Alexey. All rights reserved.
//

#import "CustomMonthYearPickerView.h"
#import "AuthorizeGrayButton.h"
#import "UIMonthYearPicker.h"

@implementation CustomMonthYearPickerView

- (void) initDataPicker
{
    int height = 295;
    
    //create new view
    pickerView = [[UIView alloc] initWithFrame:CGRectMake(0, 150, 512, height)];
    pickerView.backgroundColor = [UIColor colorWithWhite:1 alpha:1];
    
    //add toolbar
    UIToolbar * toolbar = [[UIToolbar alloc] initWithFrame: CGRectMake(0, 0, 512, 45)];
    
    UIImage* toolbarImage = [UIImage imageNamed: @"ToolbarBG.png"];
    [[UIToolbar appearance] setBackgroundImage: toolbarImage forToolbarPosition: UIToolbarPositionAny barMetrics: UIBarMetricsDefault];
    
    toolbar.barStyle = UIBarButtonItemStyleBordered;
    
    AuthorizeGrayButton *face = [AuthorizeGrayButton buttonWithType:UIButtonTypeCustom];
    face.bounds = CGRectMake( 0, 0, 100, 40);
    [face setTitle:@"Готово" forState:UIControlStateNormal];
    [face addTarget:self action:@selector(pickerDoneButton) forControlEvents:UIControlEventTouchDown];
    UIBarButtonItem *infoButtonItem = [[UIBarButtonItem alloc] initWithCustomView:face];
    toolbar.items = [NSArray arrayWithObjects:infoButtonItem, nil];
    
    //add date picker
    _datePicker = [[UIMonthYearPicker alloc] init];
    _datePicker._delegate = self;
    _datePicker.hidden = NO;
    _datePicker.frame = CGRectMake(0, 45, self.frame.size.width, 250);
    [pickerView addSubview:_datePicker];
    
    
    //set Date limit to -5 - +5 years from now
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDate *currentDate = [NSDate date];
    NSDateComponents *comps = [[NSDateComponents alloc] init];
    [comps setYear:10];
    NSDate *maxDate = [calendar dateByAddingComponents:comps toDate:currentDate options:0];
    [comps setYear:-10];
    NSDate *minDate = [calendar dateByAddingComponents:comps toDate:currentDate options:0];
    
    [_datePicker setMaximumDate:maxDate];
    [_datePicker setMinimumDate:minDate];
    _datePicker.date = [NSDate date];
    [_datePicker selectToday];
    //add popup view
    [pickerView addSubview:toolbar];
    
    CGRect temp = pickerView.frame;
    temp.origin.y = CGRectGetMaxY(self.bounds)+20;
    pickerView.frame = temp;
    
    [pickerView setHidden:YES];
}

- (void) pickerView:(UIPickerView *)pickerView didChangeDate:(NSDate *)newDate
{
//    [self setDataLableFromDate:newDate];
}

- (void) setDataLableFromDate:(NSDate*)date
{
    _datePicker.date = date;
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"yyyy/MM"];
    dateField.text = [dateFormat stringFromDate:date];
}


- (void) pickerDoneButton
{
    
    [self setDataLableFromDate:_datePicker.date];
    [self hideDataPicker];
}


-(NSDate*)getDate
{
    return _datePicker.date;
}

@end
