//
//  RoundImageView.h
//  PayApp
//
//  Created by Alexey on 08.10.15.
//  Copyright © 2015 Alexey. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^Action)();

@interface RoundImageView : UIView
{
    UIImageView* insidedImageView;
    CGFloat circleWidth;
    CAShapeLayer *circleLayer;
    UIButton* hiddenButton;
    Action _onClickAction;
    UIColor* circleColor;
}

-(void)setImageInside:(UIImage*)image;
-(void)setImageInsideFromUrl:(NSURL*)imageUrl;
-(void)setCircleColor:(UIColor*)color;
-(void)setCircleWidth:(CGFloat )width;
-(void)setOnClickAction:(Action)onClickAction;
@end
