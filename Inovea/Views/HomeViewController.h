//
//  HomeViewController.h
//  Inovea
//
//  Created by Sébastien LOUIS on 14/03/2015.
//  Copyright (c) 2015 Inovea. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeViewController : UIViewController <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UILabel *mailLbl;
@property (weak, nonatomic) IBOutlet UITextField *tbMail;
@property (weak, nonatomic) IBOutlet UILabel *passwordLbl;
@property (weak, nonatomic) IBOutlet UILabel *errorLoginLbl;
@property (weak, nonatomic) IBOutlet UITextField *tbPassword;

@end
