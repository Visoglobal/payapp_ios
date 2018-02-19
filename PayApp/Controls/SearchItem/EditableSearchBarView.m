
#import "EditableSearchBarView.h"
#import <QuartzCore/QuartzCore.h>

@implementation EditableSearchBarView
@synthesize editDelegate;

-(id)init{
    self = [super init];
    if (self){
        _search = [SearchBarView getNew];
        _search.delegate = self;
        self.frame = _search.frame;
        [self addSubview:_search];
        [self ajustView];
    }
    return self;
}

-(void)ajustView{
    _search.filterView.frame = CGRectMake(20, _search.filterView.frame.origin.y, _search.filterView.frame.size.width, _search.filterView.frame.size.height);
    editButton = [[UIButton alloc] initWithFrame:CGRectMake(_search.filterView.frame.origin.x + _search.filterView.frame.size.width,  0, 40,  _search.filterView.frame.size.height)];
    [editButton setBackgroundColor:[UIColor clearColor ]];
    
    [editButton setImage:[UIImage imageNamed:@"icon_pen3.png"] forState:UIControlStateNormal];
    [editButton setImage:[UIImage imageNamed:@"icon_pen2.png"] forState:UIControlStateSelected];
    [editButton setImage:[UIImage imageNamed:@"icon_pen2.png"] forState:UIControlStateHighlighted];

    [editButton addTarget:self action:@selector(editButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:editButton];
}

-(IBAction)editButtonClick:(id)sender
{
    if (editDelegate && [editDelegate respondsToSelector:@selector(searchBarEditButtonClicked:)])
        [editDelegate searchBarEditButtonClicked:self];
}

- (void) searchBarClearButtonClicked:(SearchBarView *)searchBar{
    if (editDelegate && [editDelegate respondsToSelector:@selector(searchBarClearButtonClicked:)])
        [editDelegate searchBarClearButtonClicked:self];
}

- (void) searchBarSearchButtonClicked:(SearchBarView *)searchBar{
    if (editDelegate && [editDelegate respondsToSelector:@selector(searchBarSearchButtonClicked:)])
        [editDelegate searchBarSearchButtonClicked:self];
}

- (void) searchBar:(SearchBarView *)searchBar textDidChange:(NSString *)searchText{
    if (editDelegate && [editDelegate respondsToSelector:@selector(searchBar:textDidChange:)])
        [editDelegate searchBar:self textDidChange:searchText];
}


@end
