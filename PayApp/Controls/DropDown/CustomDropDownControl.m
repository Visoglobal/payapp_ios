#import "CustomDropDownControl.h"
#import <QuartzCore/QuartzCore.h>

@interface CustomDropDownControl ()

- (void) updateView;
- (void) setButtonActive:(int)buttonNum;
@end

@implementation CustomDropDownControl
@dynamic selectedSegmentIndex;
@synthesize delegate,viewWithButtons;


- (id) createButtonWithLabel:(NSString*)label
{
    UIButton* button = [UIButton new];
    [self setTitle:label forButton:button];
    [self setTitleColor:[UIColor blackColor] forButton:button];
    button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    button.contentEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
    
    [button addTarget:self action:@selector(buttonOpenClicked:) forControlEvents:UIControlEventTouchDown];
    
    CGRect buttonFrame = CGRectZero;
    buttonFrame.size.width = viewWithButtons.frame.size.width;
    buttonFrame.size.height = height;
    button.frame = buttonFrame;
    
    return button;
}

-(void)setTitleColor:(UIColor*)color forButton:(UIButton*)button
{
    [button setTitleColor:color forState:UIControlStateNormal];
    [button setTitleColor:color forState:UIControlStateSelected];
    [button setTitleColor:color forState:UIControlStateHighlighted];
}

-(void)setTitle:(NSString*)title forButton:(UIButton*)button
{
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitle:title forState:UIControlStateSelected];
    [button setTitle:title forState:UIControlStateHighlighted];
}

- (id) initWithData:(DropDownObject*)data andFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        height = frame.size.height;
        
        if (!data || data.items.count == 0)
        {
            return nil;
        }
        _buttonsName = data.items;
        titleString = data.dropName;
        
        inProgress = NO;
        
        mainView = [self getMainViewForName:titleString];
        [self addSubview:mainView];
        
        self.layer.cornerRadius = 0;
        self.layer.masksToBounds = YES;
        self.layer.borderColor = [UIColor colorWithRed:(19/255.0) green:(129/255.0) blue:(148/255.0) alpha:1.0].CGColor;
        self.layer.borderWidth = 1;
        
        viewWithButtons = [[UIScrollView alloc] initWithFrame:CGRectMake(0, height, [(UIView*)mainView frame].size.width, height*data.items.count)];
        viewWithButtons.delegate = self;
        viewWithButtons.contentSize = CGSizeMake(viewWithButtons.frame.size.width, viewWithButtons.frame.size.height);
        [viewWithButtons  setBackgroundColor:[UIColor clearColor]];

        [self setClipsToBounds:YES];
        _buttons = [[NSMutableArray alloc] initWithCapacity:data.items.count];

        
        for (NSString* title in data.items)
        {
            id button = [self createButtonWithLabel:title];
            [_buttons addObject:button];
        }
    
        _selectedIndex = -1;
        [self updateView];
    }
    
    return self;
}

-(UIButton*)getMainViewForName:(NSString*)name
{
    UIButton* button = [self createButtonWithLabel:name];
    [button removeTarget:self action:@selector(buttonOpenClicked:) forControlEvents:UIControlEventTouchDown];
    [button addTarget:self action:@selector(mainViewClick:) forControlEvents:UIControlEventTouchDown];
    [self setTitleColor:[UIColor colorWithRed:(19/255.0) green:(129/255.0) blue:(148/255.0) alpha:0.5] forButton:button];
    [button setImage:[UIImage imageNamed:@"payapp_filtr_arrow_down.png"] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:@"payapp_filtr_arrow_up.png"] forState:UIControlStateHighlighted];
    [button setImage:[UIImage imageNamed:@"payapp_filtr_arrow_up.png"] forState:UIControlStateSelected];
    
    button.tag  = 0;
    [button setFrame:CGRectMake(0, 0, self.frame.size.width, height)];
    
    button.titleEdgeInsets = UIEdgeInsetsMake(0, -button.imageView.frame.size.width, 0, button.imageView.frame.size.width);
    button.imageEdgeInsets = UIEdgeInsetsMake(0, button.frame.size.width-button.imageView.frame.size.width, 0, button.imageView.frame.size.width+10);
    
    return button;
}

- (void) layoutSubviews
{
    [super layoutSubviews];
    [self updateView];
}



- (void) updateView
{
    CGFloat offsetY = (CGFloat)(int)(0 + 0.5);
    
    for (NSInteger i = 0; i < _buttons.count; ++i)
    {
        UIButton* button = [_buttons objectAtIndex:i];
        
        CGRect buttonFrame = button.frame;
        buttonFrame.origin.y = offsetY;
        buttonFrame.origin.x = 0;
        button.frame = buttonFrame;
        offsetY += buttonFrame.size.height;
    }
    [self setButtonActive:_selectedIndex];
}


-(void)clearButtonView{
    for (NSObject * subview in [viewWithButtons subviews]) {
        if ([subview isKindOfClass:[UIButton class]]) {
            [(UIButton*)subview removeFromSuperview];
        }
    }
}

-(void)clearSelfView{
    [self clearButtonView];
    NSArray *viewsToRemove = [self subviews];
    for (UIView *v in viewsToRemove) {
        [v removeFromSuperview];
    }
}

-(void)setButtonActive:(NSInteger)buttonNum
{
//    if (_buttons.count-1 >= _selectedIndex){
    
        [self clearSelfView];
        [self addSubview:viewWithButtons];
        [self addSubview:mainView];
        
        for (UIButton* button in _buttons)
        {
            [viewWithButtons addSubview:button];
        }
//    }
    [self bringSubviewToFront:mainView];
}

- (void) changeLabelFontSizeForSelectedButton:(NSInteger)buttonIndex toFotnSize:(NSInteger)fontSize
{
    UIButton* button = [_buttons objectAtIndex:buttonIndex];
    [button.titleLabel setFont:regularFontWithSize(fontSize)];
}

- (void) changeLabelsFontSizeAtAllButtons:(NSInteger)fontSize
{
    for (int i =0;i<_buttons.count;i++)
         [self changeLabelFontSizeForSelectedButton:i toFotnSize:fontSize];
}

- (void) hideButtonAtIndex:(NSInteger)index
{
    [[_buttons objectAtIndex:index] setHidden:YES];
    [self updateView];
}

- (void) showButtonAtIndex:(NSInteger)index
{
    [[_buttons objectAtIndex:index] setHidden:NO]; 
    [self updateView];
}

- (void) showAllButtons
{
    for (UIButton * oneButton in _buttons)
    {
        [oneButton setHidden:NO];
    }
    
    [self updateView];
}

- (void) disableButtonAtIndex:(NSInteger)index
{
    [[_buttons objectAtIndex:index] setEnabled:NO]; 
}

- (void) enableButtonAtIndex:(NSInteger)index
{
    [[_buttons objectAtIndex:index] setEnabled:YES]; 
}

- (NSInteger) selectedSegmentIndex
{
    return _selectedIndex;
}

- (void) setSelectedSegmentIndex:(NSInteger)selectedSegmentIndex
{
    if (selectedSegmentIndex >= 0 &&selectedSegmentIndex < _buttonsName.count)
    {
        _selectedIndex = selectedSegmentIndex;
        [self updateView];
        [self setTitle:_buttonsName[selectedSegmentIndex] forButton:mainView];
    }
}

- (void) selectedCellIndex:(NSInteger)selectedIndex{
    [self setSelectedSegmentIndex:selectedIndex];

    if (selectedIndex >= 0 && delegate && [delegate respondsToSelector:@selector(dropDownControl:didIndexChanged:)])
        [delegate dropDownControl:self didIndexChanged:selectedIndex];
}

-(void)mainViewClick:(UIButton*)sender
{
    if (sender.tag)
    {
        [self slideUp];
        if (delegate && [delegate respondsToSelector:@selector(dropDownControlStateChanged:)])
            [delegate dropDownControlStateChanged:self];
    }else{
        [self slideUDown];
        if (delegate && [delegate respondsToSelector:@selector(dropDownControlStateChanged:)])
            [delegate dropDownControlStateChanged:self];
    }
}


- (void) buttonOpenClicked:(UIButton*)currentItem
{
    
            NSInteger newIndex = -1;
        
            for (NSInteger i = 0; i < _buttons.count; ++i)
                if ([_buttons objectAtIndex:i] == currentItem)
                {
                    newIndex = i;
                    break;
                }
            
            if (_selectedIndex != newIndex)
            {
                _selectedIndex = newIndex;
                [self setTitle:_buttonsName[newIndex] forButton:mainView];
                
                [self updateView];
                
                if (_selectedIndex >= 0 && delegate && [delegate respondsToSelector:@selector(dropDownControl:didIndexChanged:)])
                    [delegate dropDownControl:self didIndexChanged:_selectedIndex];
    
            }
    
    [self setDropMenu];
}

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event {
    
    if (!CGRectContainsPoint(viewWithButtons.frame, point) && menuDropped && !inProgress) 
    {
        [self sendSlideUpNotification];
    }
    return [super pointInside:point withEvent:event];
}

-(void)setDropMenu
{
    if (menuDropped)
    {
        [self slideUp];
    }
    else{
        [self slideUDown];
    }
}

- (void)slideUDown
{
    if (!menuDropped && !inProgress)
    {
        mainView.tag = 1;
        self.backgroundColor = [UIColor whiteColor];

        inProgress = YES;
        [viewWithButtons setBackgroundColor:[UIColor whiteColor]];
        
        [UIView beginAnimations:@"slideDown" context:NULL];
        [UIView setAnimationDuration:0.4f];
        [UIView setAnimationDelegate:self];
        [UIView setAnimationDidStopSelector:@selector(animationEnded)];
//        [UIView setAnimationWillStartSelector:@selector(animationStarted)];

        viewWithButtons.frame = CGRectMake(viewWithButtons.frame.origin.x, height, viewWithButtons.frame.size.width, viewWithButtons.frame.size.height);
        self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, height*(_buttonsName.count+1));
        [UIView commitAnimations];
    }
}

- (void)animationStarted
{
    UIButton* button = [_buttons objectAtIndex:_selectedIndex];
    [button setSelected:!menuDropped];
}

- (void)animationEnded
{
    menuDropped = !menuDropped;
    inProgress = NO;
}

- (void) sendSlideUpNotification
{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"slideUp" object:nil];
}

- (void) slideUp
{
    if (menuDropped && !inProgress)
    {
        mainView.tag = 0;
        self.backgroundColor = [UIColor clearColor];

        inProgress = YES;
        [viewWithButtons setBackgroundColor:[UIColor clearColor]];
        
        [UIView beginAnimations:@"slideUp" context:NULL];
        [UIView setAnimationDuration:0.05f];
        [UIView setAnimationDelegate:self];
        [UIView setAnimationDidStopSelector:@selector(animationEnded)];
//        [UIView setAnimationWillStartSelector:@selector(animationStarted)];
    
        viewWithButtons.frame = CGRectMake(viewWithButtons.frame.origin.x, height, viewWithButtons.frame.size.width, viewWithButtons.frame.size.height);
        self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, height);
        [UIView commitAnimations];
    }
}

-(int)getIndexFromValue:(NSString*)value
{
    if (!value)
        return -1;
    
    for (int buttonsCount = 0; buttonsCount<_buttonsName.count; buttonsCount++) {
        if ([[value uppercaseString] isEqualToString:[[_buttonsName objectAtIndex:buttonsCount] uppercaseString]])
            return buttonsCount;
    }
    return -1;
}


@end
