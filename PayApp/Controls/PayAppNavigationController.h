//
//  PayAppNavigationController.h
//  PayApp
//
//  Created by Alexey on 06.10.15.
//  Copyright © 2015 Alexey. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PayAppNavigationController : UINavigationController

@end

@implementation UINavigationBar (customNav)

- (CGSize)sizeThatFits:(CGSize)size {

    CGSize newSize = CGSizeMake(self.frame.size.width,55);
    return newSize;
    
}

@end