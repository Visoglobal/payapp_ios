#import <UIKit/UIKit.h>
#import "DropDownObject.h"

@class CustomDropDownControl;

@protocol CustomDropDownControlDelegate <NSObject>

- (void) dropDownControl:(CustomDropDownControl*)dropDownControl didIndexChanged:(NSInteger)newIndex;
- (void) dropDownControlStateChanged:(CustomDropDownControl*)dropDownControl;
@end

@interface CustomDropDownControl : UIView <UIScrollViewDelegate>
{
    UIButton* mainView;
    NSMutableArray* _buttonsName;
    NSMutableArray* _buttons;
    NSInteger _selectedIndex;
    UIScrollView* viewWithButtons;
    BOOL menuDropped;
    BOOL inProgress;
    int height;
    NSString* titleString;
}

@property (nonatomic, readwrite) NSInteger selectedSegmentIndex;
@property (nonatomic, assign) id <CustomDropDownControlDelegate> delegate;
@property (nonatomic, readonly) UIView* viewWithButtons;

- (id) initWithData:(DropDownObject*)data andFrame:(CGRect)frame;
- (int) getIndexFromValue:(NSString*)value;
- (void) slideUp;
- (void) slideUDown;
@end
