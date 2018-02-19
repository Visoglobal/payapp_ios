
#import "AutoDataScroll.h"

#define iInsetHeight 5

@implementation AutoDataScroll

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void) awakeFromNib
{
}

- (void) addItem:(UIView*)_item
{
    if (newItemOrignY == 0)
        newItemOrignY = iInsetHeight;
    
    CGRect frame = _item.frame;
    frame.origin.y = newItemOrignY;
    _item.frame = frame;
    [self addSubview:_item];
    [self setContentSize:CGSizeMake(self.frame.size.width, self.contentSize.height + _item.frame.size.height)];
    
    newItemOrignY = _item.frame.origin.y + _item.frame.size.height + iInsetHeight;

    CGSize cs = self.frame.size;
    cs.height = (newItemOrignY+ _item.frame.size.height >self.frame.size.height)? newItemOrignY+ _item.frame.size.height:self.frame.size.height;
    self.contentSize =cs;
}

-(void)clearScroll{
    NSArray *viewsToRemove = [self subviews];
    for (UIView *v in viewsToRemove) {
        [v removeFromSuperview];
    }
    newItemOrignY = 0;
    [self setContentSize:CGSizeMake(self.frame.size.width, self.frame.size.height)];
}

- (CGFloat) getCurrentPositionY{
    return newItemOrignY;
}
@end
