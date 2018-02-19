//
//  AccountViewController.h
//  PayApp
//
//  Created by Alexey on 03.12.15.
//  Copyright © 2015 Alexey. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "BaseViewController.h"
#import "RoundImageView.h"
#import "CustomTextField.h"
#import "CustomDatePickerView.h"
#import "SexSelectionView.h"
#import "AutoDataScroll.h"
#import "CustomCheckBox.h"


@interface AccountViewController : BaseViewController<UITextFieldDelegate,CustomDatePickerViewDelegate,UIImagePickerControllerDelegate>
{
    __weak IBOutlet UILabel *userNameLabel;
    __weak IBOutlet UIButton *closeButton;

    CustomTextField*      familyNameTextField;
    CustomTextField*      nameTextField;
    CustomTextField*      parentNameTextField;
    
    CustomDatePickerView* birthDate;
    SexSelectionView*     sex;
    CustomCheckBox*       allowProfileViewCheckBox;

    UIImage* userImage;
    
}

@property (weak, nonatomic) IBOutlet RoundImageView *userImageView;
@property (weak, nonatomic) IBOutlet AutoDataScroll* mainScrollView;

@end

//<xs:element name="FamilyName" type="xs:string" minOccurs="0"/>
//<xs:element name="Name" type="xs:string" minOccurs="0"/>
//<xs:element name="ParentName" type="xs:string" minOccurs="0"/>
//<xs:element name="BirthDate" type="xs:date" minOccurs="0"/>
//<xs:element name="Sex" type="ns:tSex" minOccurs="0"/>
//<xs:element name="AllowProfileView" type="xs:boolean" minOccurs="0"/>
