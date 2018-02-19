//
//  OperationsTableView.m
//  PayApp
//
//  Created by Alexey on 19.11.15.
//  Copyright © 2015 Alexey. All rights reserved.
//

#import "OperationsTableView.h"
#import "TransactionCell.h"
#import "Transaction.h"
#import "UserManager.h"
#import "FormatHelper.h"

#define itableHeaderHeight 30
#define iTableRowHeight 52

@implementation OperationsTableView

-(void)setIsFilterEnabled:(BOOL)isFilterEnabled
{
    _isFilterEnabled = isFilterEnabled;
    [self reloadData];
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    static NSString *HeaderCellIdentifier = @"Header";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:HeaderCellIdentifier];
    if (cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:HeaderCellIdentifier];
    }
    
    cell.textLabel.text = NSLocalizedString(@"mainMenuHistory", nil);
    [cell.textLabel setTextColor:[UIColor lightGrayColor]];
    [cell setBackgroundColor:[UIColor colorWithRed:216.0/255.0 green:216.0/255.0 blue:216.0/255.0 alpha:1.0]];
    if (_isFilterEnabled)
    {
        UIButton* filterButton = [[UIButton alloc] initWithFrame:CGRectMake(cell.frame.size.width-itableHeaderHeight-10, 0, itableHeaderHeight, itableHeaderHeight)];
        [filterButton addTarget:self action:@selector(clickFilter) forControlEvents:UIControlEventTouchDown];
        [filterButton setImage:[UIImage imageNamed:@"table_filter.png"] forState:UIControlStateNormal];
        [cell addSubview:filterButton];
    }
    return cell;
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
        return iTableRowHeight;
}

- (CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return itableHeaderHeight;
}

- (UITableViewCell*)tableView:(UITableView*)tableView cellForRowAtIndexPath:(NSIndexPath*)indexPath
{
    TransactionCell* cell = (TransactionCell*)[tableView dequeueReusableCellWithIdentifier:[TransactionCell reuseIdentifier]];
    Transaction* transaction = [dataArray objectAtIndex:indexPath.row];
    
    if (!cell)
        cell = [[[NSBundle mainBundle] loadNibNamed:@"TransactionCell"
                                              owner:self
                                            options:nil] objectAtIndex:0];
    
    cell.operationDateLabel.text = @"";
    if (transaction.transactionDate)
    {
            NSString* newTime = [transaction.transactionDate stringByReplacingOccurrencesOfString:@"T" withString:@" "];
        
            NSDateFormatter *format = [[NSDateFormatter alloc] init];
            [format setDateFormat:@"yyyy-MM-dd HH:mm:ss.SSSZZZZZ"];
            NSDate* transDate = [format dateFromString:newTime];
        
            NSString* formattedDateSrt;
        
            if (transDate)
            {
                NSDateFormatter *format = [[NSDateFormatter alloc] init];
                [format setDateFormat:@"dd.MM.yyyy"];
                formattedDateSrt = [format stringFromDate:transDate];
                
            }
        
            cell.operationDateLabel.text = formattedDateSrt? formattedDateSrt:@"";
    }
    
    if (transaction.sender)
        cell.operationOwnerLabel.text = [transaction.sender userFullName];
    
    cell.operationSummLabel.text = [NSString stringWithFormat:@"%@ %@",[FormatHelper amountInMainUnitsFromMinimalUnits:transaction.transactionSum], transaction.transactionCurrency];
    
    cell.operationImage.image = [UIImage imageNamed:@"payapp_menu_istoria_green.png"];
    
    if (transaction.sender && transaction.sender.own && transaction.receiver && transaction.receiver.client)
        cell.operationImage.image = [UIImage imageNamed:@"payapp_menu_istoria_orange.png"];


    return cell;
}

-(void)clickFilter
{
    if ([self.tableDelegate respondsToSelector:@selector(showFilterClicking)])
        [self.tableDelegate showFilterClicking];
}

@end
