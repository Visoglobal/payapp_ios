//
//  BaseSearchCell.h
//  MKBShop
//
//  Created by админ on 08.11.13.
//  Copyright (c) 2013 AOW. All rights reserved.
//

#import "BaseSwipedCell.h"

@interface BaseSearchCell : BaseSwipedCell

@property (nonatomic, retain) NSArray * searchTargets;

- (void)selectAllInsertionOfText:(NSString*)_searchedString;

@end
