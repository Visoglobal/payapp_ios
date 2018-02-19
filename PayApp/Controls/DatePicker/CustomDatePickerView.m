//
//  CustomDatePickerView.m
//  PayApp
//
//  Created by Alexey on 07.10.15.
//  Copyright © 2015 Alexey. All rights reserved.
//

#import "CustomDatePickerView.h"
#import "AuthorizeGrayButton.h"

@implementation CustomDatePickerView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        backgroundButton = [[UIButton alloc] initWithFrame:CGRectMake(0,0,frame.size.width, frame.size.height)];
        [backgroundButton addTarget:self action:@selector(showDataPicker) forControlEvents:UIControlEventTouchDown];
        dateField = [[CustomTextField alloc] initWithFrame:CGRectMake(0,0,frame.size.width, frame.size.height)];
        calendarImageView = [[UIImageView alloc] initWithFrame:CGRectMake(frame.size.width - frame.size.height - 5, 5, frame.size.height - 10, frame.size.height - 10)];
        calendarImageView.image = [UIImage imageNamed:@"payapp_menu_reg4_icon_kalend.png"];
        [dateField setEnabled:NO];
        [self addSubview:dateField];
        [self addSubview:calendarImageView];
        [self addSubview:backgroundButton];
        [self initDataPicker];
        tap = [[UITapGestureRecognizer alloc] initWithTarget:self  action:@selector(handleSingleTap:)];
        tap.cancelsTouchesInView = NO;
    }
    return self;
}

-(void) setPickerValue:(NSString*)value
{
    dateField.text = value;
}

-(void) setPlaceholder:(NSString *)value
{
    dateField.placeholder = value;
}

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
    datePicker = [[UIDatePicker alloc] init];
    datePicker.datePickerMode = UIDatePickerModeDate;
    datePicker.hidden = NO;
    datePicker.date = [NSDate date];
    datePicker.frame = CGRectMake(0, 45, self.frame.size.width, 250);
    [datePicker addTarget:self action:@selector(pickerDataChanged) forControlEvents:UIControlEventValueChanged];
    [pickerView addSubview:datePicker];
    
    //set Date limit to -5 - +5 years from now
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDate *currentDate = [NSDate date];
    NSDateComponents *comps = [[NSDateComponents alloc] init];
    [comps setYear:2];
    NSDate *maxDate = [calendar dateByAddingComponents:comps toDate:currentDate options:0];
    [comps setYear:-100];
    NSDate *minDate = [calendar dateByAddingComponents:comps toDate:currentDate options:0];
    
    [datePicker setMaximumDate:maxDate];
    [datePicker setMinimumDate:minDate];
    
    //add popup view
    [pickerView addSubview:toolbar];

    CGRect temp = pickerView.frame;
    temp.origin.y = CGRectGetMaxY(self.bounds)+20;
    pickerView.frame = temp;
    
    [pickerView setHidden:YES];
}

- (void) showDataPicker
{
    if (pickerView && pickerView.hidden)
    {
        if (_delegate && [_delegate respondsToSelector:@selector(pickerViewShowed)])
            [_delegate pickerViewShowed];
        
        [[[[[UIApplication sharedApplication] keyWindow] subviews] lastObject] addGestureRecognizer:tap];
        
        CGRect pickerFrame = pickerView.frame;
        pickerFrame.origin.y = CGRectGetMaxY([[[[UIApplication sharedApplication] keyWindow] subviews] lastObject].bounds);
        pickerFrame.origin.y += 30;
        pickerView.frame = pickerFrame;
        
        [[[UIApplication sharedApplication] keyWindow] addSubview:pickerView];
        pickerView.hidden = NO;

        //animate it onto the screen
        [UIView beginAnimations:nil context:nil];
            pickerFrame.origin.y -= pickerView.frame.size.height;
            pickerView.frame = pickerFrame;
        [UIView commitAnimations];
    }
}

- (void) hideDataPicker
{
    [UIView animateWithDuration:0.3 animations:^{
        CGRect pickerFrame = pickerView.frame;
        pickerFrame.origin.y += pickerView.frame.size.height;
        pickerView.frame = pickerFrame;
    } completion:^(BOOL finished) {
        [pickerView removeFromSuperview];
        pickerView.hidden = YES;
        [[[[[UIApplication sharedApplication] keyWindow] subviews] lastObject] removeGestureRecognizer:tap];
        if (_delegate && [_delegate respondsToSelector:@selector(pickerViewHided)])
            [_delegate pickerViewHided];        
    }];
}

-(void)pickerDataChanged
{
    
}

- (void) pickerDoneButton
{
    
    [self setDataLableFromDate:datePicker.date];
    [self hideDataPicker];
}

- (void) setDataLableFromDate:(NSDate*)date
{
    datePicker.date = date;
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"dd.MM.yy"];
    dateField.text = [dateFormat stringFromDate:date];
}

-(NSDate*)getDate
{
    return datePicker.date;
}

-(NSString*)getSelectedDate
{
    return dateField.text;
}

- (void)handleSingleTap:(UITapGestureRecognizer *)sender
{
    [self hideDataPicker];
}

@end
