//
//  OperationsTableView.m
//  PayApp
//
//  Created by Alexey on 19.11.15.
//  Copyright © 2015 Alexey. All rights reserved.
//

#import "ContactsTableView.h"
#import "ContactCell.h"
#import "Client.h"
#import "UIImageView+WebCache.h"
#import "UserManager.h"
#import "ImageHelper.h"

#define itableHeaderHeight 30
#define iTableRowHeight 70

@implementation ContactsTableView

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return iTableRowHeight;
}

- (UITableViewCell*)tableView:(UITableView*)tableView cellForRowAtIndexPath:(NSIndexPath*)indexPath
{
    ContactCell* cell = (ContactCell*)[tableView dequeueReusableCellWithIdentifier:[ContactCell reuseIdentifier]];
    Client* client  = (Client*)dataArray[indexPath.row];
    if (!cell)
        cell = [[[NSBundle mainBundle] loadNibNamed:@"ContactCell"
                                              owner:self
                                            options:nil] objectAtIndex:0];
    
    [cell.userImage setImageInside:[UIImage imageNamed:@"payapp_menu_reg2_user_nonpicture.png"]];
    
    if (client.clientId && client.clientId.length>0)
    {
//        NSString* imageUrlString = [NSString stringWithFormat:@"%@images?imageId=%@&sessionId=%@",cfgServerURL,
//                                    [ImageHelper normalizedStringFromString:client.clientId],
//                                    [ImageHelper normalizedStringFromString:USER_MANAGER.sessionId]];
//        NSURL* imageUrl = [NSURL URLWithString:imageUrlString];
        NSURL* imageUrl = [ImageHelper getNormalizedImageUrlWithClientId:client.clientId andSession:USER_MANAGER.sessionId];
        [cell.userImage setImageInsideFromUrl:imageUrl];
    }else{
        if (client.userPhoto)
            [cell.userImage setImageInside:client.userPhoto];
    }
    
    cell.userName.text = [NSString stringWithFormat:@"%@ %@", client.name?client.name:@"", client.familyName?client.familyName:@""];
    cell.userContact.text = client.contact;
    
    if (client.clientId)
    {
        cell.statusImage.image = !client.needRegisterFin?[UIImage imageNamed:@"payapp_kard_2_11_green_button.png"]:[UIImage imageNamed:@"payapp_kontakt_2_3_logo.png"];
    }else
         cell.statusImage.image = nil;

    if (_searchedText)
        [cell selectAllInsertionOfText:_searchedText];
    
    return cell;
}

@end
