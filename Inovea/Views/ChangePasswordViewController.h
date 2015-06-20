//
//  ChangePasswordViewController.h
//  Inovea
//
//  Created by Sébastien LOUIS on 03/05/2015.
//  Copyright (c) 2015 Inovea. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Steed.h"

@interface ChangePasswordViewController : UIViewController
{
@private
    Steed* steed_;
}
@property (weak, nonatomic) IBOutlet UILabel *actualPasswordLbl;
@property (weak, nonatomic) IBOutlet UILabel *passwordLbl;
@property (weak, nonatomic) IBOutlet UILabel *confirmPasswordLbl;



@property (nonatomic, strong) Steed* steed;
@property (weak, nonatomic) IBOutlet UITextField *tbActualPassword;
@property (weak, nonatomic) IBOutlet UITextField *tbNewPassword;
@property (weak, nonatomic) IBOutlet UITextField *tbConfirmNewPassword;
@end
