
#import "CustomSearchTextField.h"
#import "SkinManager.h"

@implementation CustomSearchTextField

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
//        [self setBackgroundColor:[UIColor whiteColor]];
        self.layer.borderColor = [[UIColor lightGrayColor] CGColor];
        self.layer.borderWidth = 1;
        [self.layer setCornerRadius:4.0f];
    }
    return self;
}

- (CGRect)textRectForBounds:(CGRect)bounds { // нормальном состоянии
        CGRect inset = CGRectMake(bounds.origin.x + 30, bounds.origin.y , bounds.size.width - 50, bounds.size.height);
    return inset;
}

- (CGRect)editingRectForBounds:(CGRect)bounds { // при редактировании
    CGRect inset = CGRectMake(bounds.origin.x +30, bounds.origin.y, bounds.size.width - 50, bounds.size.height);
    return inset;
}
-(void)awakeFromNib{
    [super awakeFromNib];
//    [self setBackgroundColor:[UIColor whiteColor]];
    self.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    self.layer.borderWidth = 1;
    [self.layer setCornerRadius:4.0f];
//    [self setBackground:[SKIN_MANAGER imageForKey:SkinManagerImagePoleVvoda]];
}
@end