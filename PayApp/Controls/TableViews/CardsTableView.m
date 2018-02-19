//
//  OperationsTableView.m
//  PayApp
//
//  Created by Alexey on 19.11.15.
//  Copyright © 2015 Alexey. All rights reserved.
//

#import "CardsTableView.h"
#import "CardCell.h"
#import "Card.h"

#define iTableRowHeight 143

@implementation CardsTableView

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
        return iTableRowHeight;
}

- (UITableViewCell*)tableView:(UITableView*)tableView cellForRowAtIndexPath:(NSIndexPath*)indexPath
{
    Card* currentCard = [dataArray objectAtIndex:indexPath.row];
    CardCell* cell = (CardCell*)[tableView dequeueReusableCellWithIdentifier:[CardCell reuseIdentifier]];
    
    if (!cell)
        cell = [[[NSBundle mainBundle] loadNibNamed:@"CardCell"
                                              owner:self
                                            options:nil] objectAtIndex:0];

    cell.cardNameValue.text = currentCard.maskedPan;
    [cell setDefaultState:currentCard.creditDefault];
    cell.expireDateValue.text = currentCard.expiryDate;
    cell.ownerValue.text = currentCard.cardholderName;
    cell.cardTypeImage.image = [Card cardLogoForType:[Card cardTypeForCardString:currentCard.cardPaySys]];
    
    cell.delegate = self;
    [cell updateItems];
    return cell;
}

- (void)cellItemDeleteClicked:(BaseSwipedCell*)cell
{
    NSIndexPath *indexPath = [self indexPathForCell:cell];
    
    if (self.tableDelegate && [self.tableDelegate respondsToSelector:@selector(cellDeleteClick:)])
        [self.tableDelegate cellDeleteClick:[dataArray objectAtIndex:indexPath.row]];
    
}

- (void)cellItemEditeClicked:(BaseSwipedCell*)cell
{
    NSIndexPath *indexPath = [self indexPathForCell:cell];
    
    if (self.tableDelegate && [self.tableDelegate respondsToSelector:@selector(cellEditClick:)])
        [self.tableDelegate cellEditClick:[dataArray objectAtIndex:indexPath.row]];
}

@end
