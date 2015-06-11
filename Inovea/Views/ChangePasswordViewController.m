//
//  ChangePasswordViewController.m
//  Inovea
//
//  Created by Sébastien LOUIS on 03/05/2015.
//  Copyright (c) 2015 Inovea. All rights reserved.
//

#import "ChangePasswordViewController.h"

@interface ChangePasswordViewController ()

@end

@implementation ChangePasswordViewController
@synthesize steed = steed_;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor clearColor];
    
    
    [self.tbActualPassword setValue:[UIColor colorWithRed:1 green:1 blue:1 alpha:0.5] forKeyPath:@"_placeholderLabel.textColor"];
    [self.tbNewPassword setValue:[UIColor colorWithRed:1 green:1 blue:1 alpha:0.5] forKeyPath:@"_placeholderLabel.textColor"];
    [self.tbConfirmNewPassword setValue:[UIColor colorWithRed:1 green:1 blue:1 alpha:0.5] forKeyPath:@"_placeholderLabel.textColor"];

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)onClickValidate:(id)sender {
    if(([self.tbActualPassword.text isEqualToString:[self.steed password]]) && ([self.tbNewPassword.text isEqualToString:self.tbConfirmNewPassword.text]))
    {
        NSLog(@"Changement réussi !");
    }
    else
        NSLog(@"Error : steed -> %@, actual -> %@, new -> %@, confirm -> %@", [self.steed password], self.tbActualPassword.text, self.tbNewPassword.text, self.tbNewPassword.text );
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


@end

