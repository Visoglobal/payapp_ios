//
//  BaseNibView.h
//  MKBShop
//
//  Created by админ on 24.10.13.
//  Copyright (c) 2013 AOW. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseNibView : UIView

- (id)initWithNibName:(NSString*)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil;

- (void) applyDesign;

@end
