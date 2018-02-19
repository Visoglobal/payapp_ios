//
//  StartAppManager.h
//  PayApp
//
//  Created by Alexey on 06.04.16.
//  Copyright © 2016 Alexey. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface StartAppManager : NSObject
{
    UINavigationController* currentNavigationController;
}

- (id)initWithNavigationController:(UINavigationController*)navigationController;
- (id)initMainViewWithNavigationController:(UINavigationController*)navigationController;

@end