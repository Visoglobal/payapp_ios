//
//  SexSelectionView.m
//  PayApp
//
//  Created by Alexey on 07.10.15.
//  Copyright © 2015 Alexey. All rights reserved.
//

#import "SexSelectionView.h"

@implementation SexSelectionView


- (void) awakeFromNib
{
    [self ajustView];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self ajustView];
    }
    return self;
}

- (id)init
{
    self = [super init];
    if (self) {
        [self ajustView];
    }
    return self;
}


-(void)ajustView
{

    self.backgroundColor = [UIColor clearColor];
    
    titleLable = [[UILabel alloc] initWithFrame:CGRectMake(5, 0, self.frame.size.width-5, self.frame.size.height/2)];
    titleLable.text = NSLocalizedString(@"sex", nil);
    [self addSubview:titleLable];
    
    maleButton = [[SegmentedGrayButton alloc] initWithFrame:CGRectMake(5, self.frame.size.height/2+5, self.frame.size.width/2-10,self.frame.size.height/2-10)];
    [maleButton setTitle:NSLocalizedString(@"male", nil) forState:UIControlStateNormal];
    [maleButton setTitle:NSLocalizedString(@"male", nil) forState:UIControlStateSelected];
    [maleButton addTarget:self action:@selector(segmentButtonPressed:) forControlEvents:UIControlEventTouchDown];
    
    [self addSubview:maleButton];

    femaleButton = [[SegmentedGrayButton alloc] initWithFrame:CGRectMake(maleButton.frame.origin.x + maleButton.frame.size.width+5, self.frame.size.height/2+5 , self.frame.size.width/2-10, self.frame.size.height/2-10)];
    [femaleButton setTitle:NSLocalizedString(@"female", nil) forState:UIControlStateNormal];
    [femaleButton setTitle:NSLocalizedString(@"female", nil) forState:UIControlStateSelected];
    [femaleButton addTarget:self action:@selector(segmentButtonPressed:) forControlEvents:UIControlEventTouchDown];
    
    [self addSubview:femaleButton];

}

- (void) segmentButtonPressed:(SegmentedGrayButton*)sender
{
    [femaleButton setSelected:NO];
    [maleButton setSelected:NO];
    [sender setSelected:YES];
//    self.selectedSex = femaleButton.selected?UserSexFemale:UserSexMale;
}

-(void)setSelectedSex:(UserSex)selectedSex
{
    maleButton.selected = NO;
    femaleButton.selected = NO;
    
    if (selectedSex == UserSexMale)
        maleButton.selected = YES;
    if (selectedSex == UserSexFemale)
        femaleButton.selected = YES;

}

-(UserSex)selectedSex
{
    if (femaleButton.selected)
        return UserSexFemale;
    
    if (maleButton.selected)
        return UserSexMale;
    
    return UserSexUnknown;
}

-(NSString*)selectedSexString
{
    if (femaleButton.selected)
    return @"female";

    if (maleButton.selected)
    return @"male";

    return @"unknown";
}
@end
