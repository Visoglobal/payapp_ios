//
//  MenuBarButton.h
//  MobileAcquiring
//
//  Created by Алексей  on 05.09.13.
//
//

#import <UIKit/UIKit.h>
#import "RoundCounter.h"

@interface CustomCellButton : UIControl
{
        UIImageView* buttonIconImageView;
    
        NSString* selectedImageButton;
        NSString* nonSelectedImageButton;
    
        UILabel*     buttonTitleLable;
        UIColor*     selectedBGColor;
        UIColor*     nonSelectedBGColor;
        RoundCounter* counter;
}

-(void)adjustView;
-(void)setTitle:(NSString*)_newTitle;
-(void)setButtonIcon:(NSString*)_iconImageName;
-(void)setBGColor:(UIColor*)activeButtonState :(UIColor*)nonActiveButtonState;
-(void)setButtonImage:(NSString*)activeButtonState :(NSString*)nonActiveButtonState;
-(void)setCount:(int)_count;
@end
