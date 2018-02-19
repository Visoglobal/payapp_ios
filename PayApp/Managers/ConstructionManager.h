//
//  ConstructionManager.h
//  PayApp
//
//  Created by Alexey on 12.10.15.
//  Copyright © 2015 Alexey. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ViewControllerFabric.h"

#define CONSTRUCTION_MANAGER [ConstructionManager sharedConstructionManager]

@interface ConstructionManager : NSObject<ViewControllerFabricMethods>
{
        ViewControllerFabric * _viewControllerFabric;
}

+ (instancetype) sharedConstructionManager;

//ViewControllers
- (void) setViewControllerFabric:(ViewControllerFabric*)viewControllerFabric;

@end
