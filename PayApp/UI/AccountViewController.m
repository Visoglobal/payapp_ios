//
//  AccountViewController.m
//  PayApp
//
//  Created by Alexey on 03.12.15.
//  Copyright © 2015 Alexey. All rights reserved.
//

#import "AccountViewController.h"
#import "UserManager.h"
#import "ImageHelper.h"
#import "ClientManager.h"
#import "UIComponenstBuilder.h"
#import "FormatHelper.h"
#import "DeviceHelper.h"

@interface AccountViewController ()

@end

@implementation AccountViewController

- (void)viewDidLoad {
    self.title = NSLocalizedString(@"mainMenuAccount", nil);
    [self showBackButton];
    [self ajustView];
    [self.userImageView setImageInside:USER_MANAGER.userPhoto];

    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissKeyboard)];
    [self.view addGestureRecognizer:tap];
    
    
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

-(void)ajustView
{
    familyNameTextField = [UIComponenstBuilder getTextFieldWithPlaceholder: NSLocalizedString(@"firstName", nil) delegate:self];
    familyNameTextField.text = USER_MANAGER.contact.firstName;
    
    nameTextField = [UIComponenstBuilder getTextFieldWithPlaceholder: NSLocalizedString(@"secondName", nil) delegate:self];
    nameTextField.text = USER_MANAGER.contact.secondName;
    
    parentNameTextField = [UIComponenstBuilder getTextFieldWithPlaceholder: NSLocalizedString(@"parentName", nil) delegate:self];
    parentNameTextField.text = USER_MANAGER.contact.parentName;
    
    birthDate = [[CustomDatePickerView alloc] initWithFrame:CGRectMake(10, 0, 300, 35)];
    [birthDate setPlaceholder:NSLocalizedString(@"birthDate", nil)];
    birthDate.delegate = self;
    [birthDate setDataLableFromDate:[FormatHelper getBirthdateFromString:USER_MANAGER.contact.birthDate]];
    
    sex = [[SexSelectionView alloc] initWithFrame:CGRectMake(10, 0, 300, 100)];
    sex.selectedSex = USER_MANAGER.contact.sex;
    
    allowProfileViewCheckBox = [UIComponenstBuilder getCheckBoxWithTitle:NSLocalizedString(@"editCheckBox", nil)];
    allowProfileViewCheckBox.selected = (USER_MANAGER.contact.allowProfileView && [USER_MANAGER.contact.allowProfileView isEqualToString:@"true"])?YES:NO;
    
    [_mainScrollView  addItem:familyNameTextField];
    [_mainScrollView  addItem:nameTextField];
    [_mainScrollView  addItem:parentNameTextField];
    [_mainScrollView  addItem:birthDate];
    [_mainScrollView  addItem:sex];
    [_mainScrollView  addItem:allowProfileViewCheckBox];
    
    [closeButton setTitle:NSLocalizedString(@"applyAccount", nil) forState:UIControlStateNormal];
    [closeButton setTitle:NSLocalizedString(@"applyAccount", nil) forState:UIControlStateHighlighted];
    [closeButton setTitle:NSLocalizedString(@"applyAccount", nil) forState:UIControlStateSelected];
    [self.userImageView setOnClickAction:^{
        [self takePhoto];
    }];

}

- (void) pickerViewShowed
{
    [self dismissKeyboard];
}

-(void)dismissKeyboard
{
    [UIView animateWithDuration:0.1 animations:^{
        self.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
        NSArray *subviews = [self.mainScrollView subviews];
        for (id objects in subviews) {
            if ([objects isKindOfClass:[UITextField class]]) {
                UITextField *theTextField = objects;
                if ([objects isFirstResponder]) {
                    [theTextField resignFirstResponder];
                }
            }
        }
    } completion:^(BOOL finished){
    }];
}

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    [birthDate hideDataPicker];
    if ([DeviceHelper isIphone4])
    {
        CGPoint pt;
        CGRect rc = [textField bounds];
        rc = [textField convertRect:rc toView:self.view];
        pt = rc.origin;
        pt.x = 0;
        pt.y = -(self.view.frame.size.height/2 - (rc.origin.y+rc.size.height)-15);
        
        [UIView animateWithDuration:0.1 animations:^{
            self.view.frame = CGRectMake(0, -pt.y, self.view.frame.size.width, self.view.frame.size.height);
        } completion:^(BOOL finished){}];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)closeButtonClick:(id)sender
{
    
    NSString* familyNameText = [self getUniqueValueFromBaseValue:USER_MANAGER.contact.firstName andIncomingValue:familyNameTextField.text];
    NSString* nameText = [self getUniqueValueFromBaseValue:USER_MANAGER.contact.secondName andIncomingValue:nameTextField.text];
    NSString* parentNameText = [self getUniqueValueFromBaseValue:USER_MANAGER.contact.parentName andIncomingValue:parentNameTextField.text];
    NSString* sexText = [self getUniqueValueFromBaseValue:[USER_MANAGER.contact getStringSexValue] andIncomingValue:sex.selectedSexString];
    NSString* allowProfileViewText = [self  getUniqueValueFromBaseValue:USER_MANAGER.contact.allowProfileView andIncomingValue:allowProfileViewCheckBox.selected?@"true":@"false"];
    NSString* birthDateText = [self getUniqueValueFromBaseValue:USER_MANAGER.contact.birthDate andIncomingValue:[FormatHelper getBirthdateStringFromDate:[birthDate getDate]]];


    
    if (userImage || familyNameText || nameText || parentNameText || sexText || allowProfileViewText || birthDateText){
        
        [self showLoading];
        UIImage* resizedImage = userImage?[ImageHelper resizeImage:userImage toSize:CGSizeMake(140, 140)]:nil;
        
        [CLIENT_MANAGER editClientWithName:nameText familyName:familyNameText parentName:parentNameText birthDate:birthDateText sex:sexText allowProfileView:allowProfileViewText base64imageString:[ImageHelper getBase64StringFromImage:resizedImage] withCompletion:^(NSError *error) {
            if (!error)
            {
                if (resizedImage)
                    USER_MANAGER.userPhoto = resizedImage;
                if (familyNameText)
                    USER_MANAGER.contact.firstName = familyNameText;
                if (nameText)
                    USER_MANAGER.contact.secondName = nameText;
                if (parentNameText)
                    USER_MANAGER.contact.parentName = parentNameText;
                if (sexText)
                    [USER_MANAGER.contact setStringSexValue:sexText];
                if (allowProfileViewText)
                    USER_MANAGER.contact.allowProfileView = allowProfileViewText;
                if (birthDateText)
                    USER_MANAGER.contact.birthDate = birthDateText;
                [USER_MANAGER saveContact];
            }
            else
                [self showAlertWithMessage:[error localizedDescription]?[error localizedDescription]:NSLocalizedString(@"editError", nil) completion:nil];
            
            [self hideLoading];
            [self.navigationController popViewControllerAnimated:YES];
        }];
    }else
        [self showAlertWithMessage:NSLocalizedString(@"editNoCangesError", nil) completion:nil];
                               

}

-(NSString*)getUniqueValueFromBaseValue:(NSString*)baseValue andIncomingValue:(NSString*)incomingValue
{
    if (!baseValue)
        return incomingValue;

    if (!incomingValue)
        return nil;

    if (![baseValue isEqualToString:incomingValue])
        return incomingValue;
    
    return nil;
}

//camera
- (void)takePhoto
{
    
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.sourceType = UIImagePickerControllerSourceTypeCamera;
    picker.cameraDevice = UIImagePickerControllerCameraDeviceFront;
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypeCamera;
    
    [self presentViewController:picker animated:YES completion:NULL];
    
}
//
//- (void)selectPhoto {
//    
//    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
//    picker.delegate = self;
//    picker.allowsEditing = YES;
//    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
//    
//    [self presentViewController:picker animated:YES completion:NULL];
//    
//    
//}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    
    UIImage *chosenImage = info[UIImagePickerControllerEditedImage];
    [_userImageView setImageInside:chosenImage];
    userImage = chosenImage;
    [picker dismissViewControllerAnimated:YES completion:NULL];
    
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
    
}
@end
