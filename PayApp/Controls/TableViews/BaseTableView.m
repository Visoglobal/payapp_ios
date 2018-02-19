//
//  BaseTableView.m
//  PayApp
//
//  Created by Alexey on 17.12.15.
//  Copyright © 2015 Alexey. All rights reserved.
//

#import "BaseTableView.h"

@implementation BaseTableView

@synthesize tableDelegate;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self preSettings];
    }
    return self;
}

-(id)init
{
    self = [super init];
    if (self) {
        [self preSettings];
    }
    return self;
}

- (void) awakeFromNib
{
    [self preSettings];
}

-(void)preSettings
{
    self.delegate = self;
    self.dataSource = self;
    searchText = @"";
    [self applyDesign];
    [self showDownloadMoreItemsButton];
    
}

- (void) applyDesign
{
    self.backgroundColor = [UIColor clearColor];
    self.separatorStyle = UITableViewCellSeparatorStyleNone;
}

- (void) setDataArray:(NSMutableArray *)newDataArray
{
    if (dataArray && dataArray != newDataArray)
        dataArray = nil;
    
    dataArray = newDataArray;
    [self reloadData];
}

-(void)hideDownloadMoreItemsButton
{
    self.tableFooterView = nil;
}

-(void)showDownloadMoreItemsButton
{
    if (!footerButton)
    {
        footerButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, 30)];
        [footerButton setBackgroundImage:[UIImage imageNamed:@"payapp_menu_vost_add.png"] forState:UIControlStateNormal];
        [footerButton setBackgroundImage:[UIImage imageNamed:@"payapp_menu_vost_add_hover.png"] forState:UIControlStateSelected];
        [footerButton setBackgroundImage:[UIImage imageNamed:@"payapp_menu_vost_add_hover.png"] forState:UIControlStateHighlighted];
        [footerButton addTarget:self action:@selector(showMoreButtonClick) forControlEvents:UIControlEventTouchUpInside];
    }
    self.tableFooterView = footerButton;
}

- (void) showMoreButtonClick
{
        if (tableDelegate && [tableDelegate respondsToSelector:@selector(showMoreClicking)])
            [tableDelegate showMoreClicking];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView*)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView*)tableView numberOfRowsInSection:(NSInteger)section
{
    if(!dataArray)
        return 0;
    
    return dataArray.count;
}

-(void) setSearchebleString:(NSString*)search
{
    searchText = [search copy];
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if ([self.tableDelegate respondsToSelector:@selector(userSelectCell:)])
        [self.tableDelegate userSelectCell:[dataArray objectAtIndex:indexPath.row]];
}


@end
