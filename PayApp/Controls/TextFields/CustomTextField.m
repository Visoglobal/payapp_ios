
#import "CustomTextField.h"

#define kplaceholderColor [UIColor colorWithRed:(19/255.0) green:(129/255.0) blue:(148/255.0) alpha:0.5]

@implementation CustomTextField

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setBackground:[UIImage imageNamed:@"payapp_menu_reg2_polevvoda.png"]];
    }
    return self;
}

- (CGRect)textRectForBounds:(CGRect)bounds { // нормальном состоянии
        CGRect inset = CGRectMake(bounds.origin.x + 10, bounds.origin.y , bounds.size.width - 20, bounds.size.height);
    return inset;
}

- (CGRect)editingRectForBounds:(CGRect)bounds { // при редактировании
    CGRect inset = CGRectMake(bounds.origin.x +10, bounds.origin.y, bounds.size.width - 20, bounds.size.height);
    return inset;
}

-(void)awakeFromNib{
    [super awakeFromNib];
    [self setBackground:[UIImage imageNamed:@"payapp_menu_reg2_polevvoda.png"]];
}

- (void)drawPlaceholderInRect:(CGRect)rect
{
     [kplaceholderColor setFill];
    CGRect placeholderRect = CGRectMake(rect.origin.x, (rect.size.height- self.font.pointSize)/2, rect.size.width, self.font.pointSize);
    [[self placeholder] drawInRect:placeholderRect withFont:self.font lineBreakMode:NSLineBreakByWordWrapping alignment:self.textAlignment];
}

+(CustomTextField*) getTextFieldWithPlaceholder:(NSString*)placeholder
{
    CustomTextField* field = [[[self class] alloc] initWithFrame:CGRectMake(10, 0, 300, 35)];
    field.placeholder = placeholder;
    field.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    field.autocorrectionType = UITextAutocorrectionTypeNo;
    field.autocapitalizationType = UITextAutocapitalizationTypeNone;
    return field;
}

@end