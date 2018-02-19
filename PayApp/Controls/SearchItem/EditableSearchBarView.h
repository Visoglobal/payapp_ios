
#import <UIKit/UIKit.h>
#import "CustomTextField.h"
#import "SearchBarView.h"

@class EditableSearchBarView;

@protocol EditableSearchBarViewDelegate <NSObject>
- (void) searchBarEditButtonClicked:(EditableSearchBarView *)searchBar;

- (void) searchBarClearButtonClicked:(EditableSearchBarView *)searchBar;
- (void) searchBarSearchButtonClicked:(EditableSearchBarView *)searchBar;
- (void) searchBar:(EditableSearchBarView *)searchBar textDidChange:(NSString *)searchText;
@end


@interface EditableSearchBarView :UIView<SearchBarViewDelegate>
{
    IBOutlet UIButton* editButton;

}

@property (nonatomic, assign) id <EditableSearchBarViewDelegate> editDelegate;
@property (nonatomic, assign)  SearchBarView* search;
-(IBAction)editButtonClick:(id)sender;
-(void)ajustView;
@end
