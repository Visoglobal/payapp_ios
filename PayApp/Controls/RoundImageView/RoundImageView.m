//
//  RoundImageView.m
//  PayApp
//
//  Created by Alexey on 08.10.15.
//  Copyright © 2015 Alexey. All rights reserved.
//

#import "RoundImageView.h"
#import <QuartzCore/QuartzCore.h>
#include <math.h>
#import "UIImageView+WebCache.h"

@implementation RoundImageView

- (void) awakeFromNib
{
    circleWidth = 2.0;
    [self ajustView];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        circleWidth = 2.0;
        [self ajustView];
    }
    return self;
}

-(void)setFrame:(CGRect)frame
{
    [super setFrame:frame];
    hiddenButton.frame = CGRectMake(0, 0, frame.size.width, frame.size.height);
}

- (id)init
{
    self = [super init];
    if (self) {
        circleWidth = 2.0;
        [self ajustView];
    }
    return self;
}

-(void) ajustView
{
    self.backgroundColor = [UIColor clearColor];
    circleColor = [UIColor whiteColor];
    insidedImageView.backgroundColor = [UIColor clearColor];
    insidedImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
    [self addSubview:insidedImageView];
    [self circleFilledWithOutline:self fillColor:[UIColor clearColor] outlineColor:circleColor];
    hiddenButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
    [hiddenButton addTarget:self action:@selector(hidenButtonClick) forControlEvents:UIControlEventTouchDown];
    [self addSubview:hiddenButton];
}

-(void)viewDidLoad
{
    [self setUserInteractionEnabled:NO];
}

-(void)setImageInside:(UIImage*)image
{
    insidedImageView.image = [self circularScaleNCrop:image frameRect:self.frame];
}

-(void)setImageInsideFromUrl:(NSURL*)imageUrl
{
    [insidedImageView setImageWithURL:imageUrl completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType) {
        insidedImageView.image = [self circularScaleNCrop:image frameRect:self.frame];
    }];
}


-(void)setCircleColor:(UIColor*)color
{
    if (color)
    {
        circleColor = color;
        [self circleFilledWithOutline:self fillColor:[UIColor clearColor] outlineColor:circleColor];
    }
}

-(void)setCircleWidth:(CGFloat )width
{
    circleWidth = width;
     [self circleFilledWithOutline:self fillColor:[UIColor clearColor] outlineColor:circleColor];
}

-(void)setOnClickAction:(Action)onClickAction
{
    _onClickAction = onClickAction;
}

- (void)hidenButtonClick
{
    if (_onClickAction)
        _onClickAction();
}

- (void) circleFilledWithOutline:(UIView*)circleView fillColor:(UIColor*)fillColor outlineColor:(UIColor*)outlinecolor{
    if (circleLayer)
        [circleLayer removeFromSuperlayer];
    circleLayer = [CAShapeLayer layer];
    float width = circleView.frame.size.width;
    float height = circleView.frame.size.height;
    [circleLayer setBounds:CGRectMake(circleWidth, circleWidth, width-circleWidth, height-circleWidth)];
    [circleLayer setPosition:CGPointMake(width/2, height/2)];
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(circleWidth, circleWidth, width-circleWidth, height-circleWidth)];
    [circleLayer setPath:[path CGPath]];
    [circleLayer setFillColor:fillColor.CGColor];
    [circleLayer setStrokeColor:outlinecolor.CGColor];
    [circleLayer setLineWidth:circleWidth];
    [[circleView layer] addSublayer:circleLayer];
}

- (UIImage*)circularScaleNCrop:(UIImage*)croppedimage frameRect:(CGRect) rect
{
    // This function returns a newImage, based on image, that has been:
    // - scaled to fit in (CGRect) rect
    // - and cropped within a circle of radius: rectWidth/2
    
    //Create the bitmap graphics context
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(rect.size.width, rect.size.height), NO, 0.0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //Get the width and heights
    CGFloat imageWidth = croppedimage.size.width;
    CGFloat imageHeight = croppedimage.size.height;
    CGFloat rectWidth = rect.size.width;
    CGFloat rectHeight = rect.size.height;
    
    //Calculate the scale factor
    CGFloat scaleFactorX = rectWidth/imageWidth;
    CGFloat scaleFactorY = rectHeight/imageHeight;
    
    //Calculate the centre of the circle
    CGFloat imageCentreX = rectWidth/2;
    CGFloat imageCentreY = rectHeight/2;
    
    // Create and CLIP to a CIRCULAR Path
    // (This could be replaced with any closed path if you want a different shaped clip)
    CGFloat radius = rectWidth/2;
    CGContextBeginPath (context);
    CGContextAddArc (context, imageCentreX, imageCentreY, radius, 0, 2*M_PI, 0);
    CGContextClosePath (context);
    CGContextClip (context);
    
    //Set the SCALE factor for the graphics context
    //All future draw calls will be scaled by this factor
    CGContextScaleCTM (context, scaleFactorX, scaleFactorY);
    
    // Draw the IMAGE
    CGRect myRect = CGRectMake(0, 0, imageWidth, imageHeight);
    [croppedimage drawInRect:myRect];
    
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
}


@end
