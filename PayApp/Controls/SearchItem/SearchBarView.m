
#import "SearchBarView.h"
#import <QuartzCore/QuartzCore.h>
#import "SkinManager.h"
#import "DeviceHelper.h"

@implementation SearchBarView
@synthesize delegate;

-(void)callSearchDelegateWithWord:(NSString*)searchThis{
    if (delegate && [delegate respondsToSelector:@selector(searchBar:textDidChange:)])
        [delegate searchBar:self textDidChange:searchThis];
}

+ (SearchBarView*) getNew
{
	UIViewController* viewController = [UIViewController new];
	SearchBarView* instance = [[[NSBundle mainBundle] loadNibNamed:@"SearchBarView" owner:viewController options:nil] objectAtIndex:0];
    [instance initData];
    instance.frame = CGRectMake(0, 0, [DeviceHelper screenWidth], instance.frame.size.height);
	return instance;
}


-(void)initData{
    _filterField.delegate = self;
//    [self setBackgroundColor:[SKIN_MANAGER colorForKey:@"0xD6E3E7"]];
        [self setBackgroundColor:[UIColor whiteColor]];
}

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event
{
    if (!CGRectContainsPoint(self.bounds, point))
        [self endEditing:YES];
    
    return [super pointInside:point withEvent:event];
}

-(NSString*)text{
        return _filterField.text;
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    NSString* fieldText = range.length ==0? [textField.text stringByAppendingString:string]:[textField.text substringToIndex:[textField.text length]-1];
    [self callSearchDelegateWithWord:fieldText];
    return YES;
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    return YES;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    UITouch *touch = [[event allTouches] anyObject];
    if ([_filterField isFirstResponder] && [touch view] != _filterField) {
        [_filterField resignFirstResponder];
    }
    [super touchesBegan:touches withEvent:event];
}

- (IBAction)textFieldTouchOutSide:(id)sender
{
    [_filterField resignFirstResponder];
}

- (IBAction)clearButtonClick:(id)sender
{
    _filterField.text = @"";
    [self callSearchDelegateWithWord:_filterField.text];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    [self callSearchDelegateWithWord:textField.text];
    return  YES;
}

-(void)hideKeyboard{
    [_filterField resignFirstResponder];
}

@end
