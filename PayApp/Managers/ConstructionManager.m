//
//  ConstructionManager.m
//  PayApp
//
//  Created by Alexey on 12.10.15.
//  Copyright © 2015 Alexey. All rights reserved.
//

#import "ConstructionManager.h"

@implementation ConstructionManager

+ (instancetype) sharedConstructionManager
{
    static ConstructionManager * _sharedConstructionManager = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        _sharedConstructionManager = [[ConstructionManager alloc] init];

        
    });
    
    return _sharedConstructionManager;
}

#pragma mark - ViewController Fabric Methods

- (ViewControllerFabric*) viewControllerFabric
{
    if (!_viewControllerFabric)
        @throw [NSException exceptionWithName:@"NoInstanceException"
                                       reason:[NSString stringWithFormat:@"Property '%@' must be setted during '%@' setup.", NSStringFromSelector(_cmd), [[self class] description]] userInfo:nil];
    return _viewControllerFabric;
}

- (void) setViewControllerFabric:(ViewControllerFabric *)viewControllerFabric
{
    if (_viewControllerFabric)
    {
        @throw [NSException exceptionWithName:@"AlreadySettedException"
                                       reason:[NSString stringWithFormat:@"Property '%@' must be setted once during '%@' setup.", NSStringFromSelector(_cmd), [[self class] description]] userInfo:nil];
        return;
    }
    
    _viewControllerFabric = viewControllerFabric;
}

- (UIViewController*) viewControllerForType:(ViewControllerType)viewControllerType
{
    return [[self viewControllerFabric] viewControllerForType:viewControllerType];
}

- (UIViewController*) viewControllerForType:(ViewControllerType)viewControllerType withObject:(id)object
{
    return [[self viewControllerFabric] viewControllerForType:viewControllerType withObject:object];
}


@end
