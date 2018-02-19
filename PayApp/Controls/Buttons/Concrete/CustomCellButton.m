//
//  MenuBarButton.m
//  MobileAcquiring
//
//  Created by Алексей  on 05.09.13.
//
//

#import "CustomCellButton.h"


#define iTitleInset 10

@implementation CustomCellButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self adjustView];
        // Initialization code
    }
    return self;
}

-(void)setTitle:(NSString*)_newTitle{
    if (buttonTitleLable){
        buttonTitleLable.text = _newTitle;
    }
}

-(void)setCount:(int)_count{
    int roundSize = 25;
    if (!counter) {
        counter = [[RoundCounter alloc] initWithFrame:CGRectMake(buttonIconImageView.frame.origin.x+buttonIconImageView.frame.size.width-roundSize/2, buttonIconImageView.frame.origin.y-roundSize/2, roundSize, roundSize)];
        [counter setBackgroundColor:[UIColor clearColor]];
        [self addSubview:counter];
    }
    
    [counter setCount:_count];
    if(_count<0){
        [counter setHidden:YES];
    }
}

-(void)setButtonIcon:(NSString*)_iconImageName{
    if (buttonIconImageView){
        UIImage* aImage = [UIImage imageNamed:_iconImageName];
        buttonIconImageView.image = aImage;
        buttonIconImageView.contentMode = UIViewContentModeScaleToFill;
        buttonIconImageView.frame = CGRectMake(iTitleInset, iTitleInset, self.frame.size.height-iTitleInset*2, self.frame.size.height-iTitleInset*2);
        buttonTitleLable.frame =  CGRectMake(buttonIconImageView.frame.origin.x + buttonIconImageView.frame.size.height + iTitleInset, 0, self.frame.size.width-(buttonIconImageView.frame.origin.x + buttonIconImageView.frame.size.height + iTitleInset), self.frame.size.height);
        [self addSubview:buttonIconImageView];
    }
}

-(void)setButtonImage:(NSString*)activeButtonState :(NSString*)nonActiveButtonState{
    selectedImageButton = activeButtonState;
    nonSelectedImageButton = nonActiveButtonState;
    [self setButtonIcon:nonSelectedImageButton];
}
    
-(void)setBGColor:(UIColor*)activeButtonState :(UIColor*)nonActiveButtonState{
    selectedBGColor = activeButtonState;
    nonSelectedBGColor = nonActiveButtonState;
    self.backgroundColor = nonSelectedBGColor;
}

- (BOOL)beginTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event{
    [self setBackgroundColor:selectedBGColor];
    [self setButtonIcon:selectedImageButton];
    if (counter)
        [self bringSubviewToFront:counter];
    return true;
}

- (void)endTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event{
    [self setButtonIcon:nonSelectedImageButton];
    [self setBackgroundColor:nonSelectedBGColor];
    if (counter)
        [self bringSubviewToFront:counter];
}

-(void)adjustView{
    selectedBGColor = [UIColor clearColor];
    nonSelectedBGColor = [UIColor clearColor];
    self.backgroundColor = nonSelectedBGColor;
    UIImage* aImage = [UIImage new];
    buttonIconImageView = [[UIImageView alloc] initWithImage:aImage];
    buttonIconImageView.frame = CGRectMake(iTitleInset, iTitleInset, self.frame.size.height-iTitleInset*2, self.frame.size.height-iTitleInset*2);
    buttonIconImageView.contentMode = UIViewContentModeScaleToFill;
    [self addSubview:buttonIconImageView];
    
    buttonTitleLable = [[UILabel alloc] initWithFrame:CGRectMake(buttonIconImageView.frame.origin.x + buttonIconImageView.frame.size.height + iTitleInset, 0, self.frame.size.width-(buttonIconImageView.frame.origin.x + buttonIconImageView.frame.size.height + iTitleInset), self.frame.size.height)];
    buttonTitleLable.textAlignment = UITextAlignmentLeft;
    
    [buttonTitleLable setBackgroundColor:[UIColor clearColor]];
    [buttonTitleLable setTextColor:[UIColor blackColor]];
    [buttonTitleLable setFont:regularFontWithSize(14)];
    [buttonTitleLable setAdjustsFontSizeToFitWidth:YES];
    [buttonTitleLable setAutoresizingMask:UIViewAutoresizingFlexibleWidth];
    [buttonTitleLable setNumberOfLines:2];
    [self addSubview:buttonTitleLable];
}

@end
