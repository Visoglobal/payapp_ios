//
//  BaseNibView.m
//  MKBShop
//
//  Created by админ on 24.10.13.
//  Copyright (c) 2013 AOW. All rights reserved.
//

#import "BaseNibView.h"

@interface BaseNibView()

@end

@implementation BaseNibView

- (id)initWithNibName:(NSString*)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super init];
    if (self)
    {
        [self loadViewFromNibName:nibNameOrNil bundle:nibBundleOrNil];
    }
    return self;
}

- (void) awakeFromNib
{
    [super awakeFromNib];
    
    UIView * mainView = [self mainNibViewFromNibName:nil bundle:nil];
    
    mainView.frame = self.bounds;
    
    [self addSubview:mainView];
    
    [self applyDesign];
}

- (void) loadViewFromNibName:(NSString*)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    UIView * mainView = [self mainNibViewFromNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, mainView.frame.size.width, mainView.frame.size.height);
    
    [self addSubview:mainView];
    
    [self applyDesign];
}

- (UIView *)mainNibViewFromNibName:(NSString*)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    if (!nibBundleOrNil)
        nibBundleOrNil = [NSBundle mainBundle];
    
    if (!nibNameOrNil)
        nibNameOrNil = NSStringFromClass([self class]);
    
    NSArray *subviewArray = [nibBundleOrNil loadNibNamed:nibNameOrNil owner:self options:nil];
    return [subviewArray objectAtIndex:0];
}

- (void) applyDesign
{
    
}

@end
