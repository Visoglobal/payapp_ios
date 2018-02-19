//
//  RoundCounter.h
//  Squirrel
//
//  Created by Алексей  on 19.05.14.
//  Copyright (c) 2014 ArtOfWeb. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RoundCounter : UIView{
    UILabel* countLabel;
}
-(void)setCount:(int)_count;
@end
