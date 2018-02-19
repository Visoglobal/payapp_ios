
#import <UIKit/UIKit.h>
#import "CustomSearchTextField.h"

@class SearchBarView;

@protocol SearchBarViewDelegate <NSObject>
- (void) searchBarClearButtonClicked:(SearchBarView *)searchBar;
- (void) searchBarSearchButtonClicked:(SearchBarView *)searchBar;
- (void) searchBar:(SearchBarView *)searchBar textDidChange:(NSString *)searchText;
@end


@interface SearchBarView : UIView<UITextFieldDelegate>


@property (nonatomic, retain) NSString* text;
@property (nonatomic, assign) id <SearchBarViewDelegate> delegate;
@property (nonatomic, assign) IBOutlet UIButton* clearButton;
@property (nonatomic, assign) IBOutlet CustomSearchTextField* filterField;
@property (nonatomic, assign) IBOutlet UIView* filterView;

-(IBAction)clearButtonClick:(id)sender;
-(void)initData;
+ (SearchBarView*) getNew;
-(void)hideKeyboard;
@end
