//
//  PushAlertView.m
//  PayApp
//
//  Created by Alexey on 21.10.16.
//  Copyright © 2016 Alexey. All rights reserved.
//

#import "PushAlertView.h"
#import "DeviceHelper.h"

#define kAnimationDuration 1.5f
#define kAnimationScale 1.5

#define DegreesToRadians(degrees) (degrees * M_PI / 180)

@interface PushAlertView()
{
    UIView* _alertView;
    NSString* _alertBody;
    NSString* _alertTitle;
}
@end

@implementation PushAlertView

-(id)initWithTitle:(NSString*)title andMessage:(NSString*)message
{
    self = [super init];
    if (self) {
        _alertTitle = title;
        _alertBody = message;
    }
    return self;
}

-(void)clearSelfView
{
    NSArray *viewsToRemove = [self subviews];
    for (UIView *v in viewsToRemove) {
        [v removeFromSuperview];
    }
}

-(void)createView
{
    [self clearSelfView];
    _alertView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 60)];
    UIImageView* appImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 10, 40, 40)];
    [appImage setImage:[UIImage imageNamed:@"payapp_-72.png"]];
    UILabel* titleLable = [[UILabel alloc] initWithFrame:CGRectMake(45, 10, 280, 20)];
    titleLable.text = _alertTitle;
    UILabel* messageLable = [[UILabel alloc] initWithFrame:CGRectMake(45, 30, 280, 20)];
    messageLable.text = _alertBody;
    _alertView.backgroundColor = [UIColor whiteColor];
    
    [_alertView addSubview:appImage];
    [_alertView addSubview:titleLable];
    [_alertView addSubview:messageLable];
}

- (void) show
{
    [[UIApplication sharedApplication] sendAction:@selector(resignFirstResponder) to:nil from:nil forEvent:nil];
    
    [self createView];
    [self addSubview:_alertView];
    
    if ([self isLandskape])
    {
        if ([DeviceHelper isIOS8])
            self.frame = CGRectMake(0, 0, [self mainWindow].frame.size.width, [self mainWindow].frame.size.height);
        else
            self.frame = CGRectMake(0, 0, [self mainWindow].frame.size.height, [self mainWindow].frame.size.width);
        
        self.center = CGPointMake(CGRectGetMidX([self mainWindow].frame), CGRectGetMidY([self mainWindow].frame));
    }
    
    self.transform = CGAffineTransformConcat([self transformForCurrentoOrientation], CGAffineTransformMakeTranslation(0,-[self mainWindow].frame.size.height));
    
    self.alpha = 0;
    
    [[self mainWindow] addSubview:self];
    
    [UIView animateWithDuration:kAnimationDuration animations:^{
        
        self.transform = CGAffineTransformConcat([self transformForCurrentoOrientation], CGAffineTransformMakeTranslation(0,0));
        self.alpha = 1;
        
    } completion:^(BOOL finished) {
        [self removeFromScreen];
    }];
}

- (void) removeFromScreen
{
    [UIView animateWithDuration:kAnimationDuration/2. delay:1.8 options:UIViewAnimationOptionTransitionNone animations:^{
        self.alpha = 0;
    } completion:^(BOOL finished) {
        
        [self removeFromSuperview];
        
    }];
}

- (UIWindow*) mainWindow
{
    return [UIApplication sharedApplication].keyWindow;
}

- (UIInterfaceOrientation) currentOrientation
{
    return [[UIApplication sharedApplication] statusBarOrientation];
}

- (BOOL) isLandskape
{
    return (([self currentOrientation] == UIInterfaceOrientationLandscapeLeft) || [self currentOrientation] == UIInterfaceOrientationLandscapeRight);
}

- (CGAffineTransform)transformForCurrentoOrientation
{
    if ([DeviceHelper isIOS8])
        return CGAffineTransformMakeRotation(DegreesToRadians(0));
    
    switch ([self currentOrientation])
    {
        case UIInterfaceOrientationLandscapeLeft:
            return CGAffineTransformMakeRotation(-DegreesToRadians(90));
            
        case UIInterfaceOrientationLandscapeRight:
            return CGAffineTransformMakeRotation(DegreesToRadians(90));
            
        case UIInterfaceOrientationPortraitUpsideDown:
            return CGAffineTransformMakeRotation(DegreesToRadians(180));
            
        case UIInterfaceOrientationPortrait:
        default:
            return CGAffineTransformMakeRotation(DegreesToRadians(0));
    }
}


@end
