//
//  BaseTableView.h
//  PayApp
//
//  Created by Alexey on 17.12.15.
//  Copyright © 2015 Alexey. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class BaseTableView;

@protocol BaseTableViewDelegate <NSObject>
- (void) userSelectCell:(NSObject*)selectedCellValue;
- (void) tableWasClicking;
@optional
- (void) cellEditClick:(NSObject*)selectedCellValue;
- (void) cellDeleteClick:(NSObject*)selectedCellValue;

- (void) showFilterClicking;
- (void) showMoreClicking;
@end


@interface BaseTableView : UITableView<UITableViewDelegate, UITableViewDataSource>
{
    NSString* searchText;
    NSMutableArray* dataArray;
    UIButton* footerButton;
}

@property (nonatomic, assign) id <BaseTableViewDelegate> tableDelegate;

-(void) setDataArray:(NSMutableArray *)newDataArray;
-(void) setSearchebleString:(NSString*)search;
-(void) showDownloadMoreItemsButton;
-(void) hideDownloadMoreItemsButton;

@end