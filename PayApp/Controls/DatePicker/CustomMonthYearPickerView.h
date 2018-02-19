//
//  CustomMonthYearPickerView.h
//  PayApp
//
//  Created by Alexey on 14.01.16.
//  Copyright © 2016 Alexey. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CustomDatePickerView.h"
#import "UIMonthYearPicker.h"

@interface CustomMonthYearPickerView : CustomDatePickerView<UIMonthYearPickerDelegate>
{
    UIMonthYearPicker* _datePicker;
}
@end
