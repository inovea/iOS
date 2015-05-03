//
//  ParametersViewController.m
//  Inovea
//
//  Created by Sébastien LOUIS on 01/05/2015.
//  Copyright (c) 2015 Inovea. All rights reserved.
//

#import "ParametersViewController.h"
#import "ChangePasswordViewController.h"

@interface ParametersViewController ()

@end

@implementation ParametersViewController

@synthesize steed = steed_;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor clearColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onClickSwitchNotifications:(id)sender {
    
   if([sender isOn])
    NSLog(@"Switch : ON");
    
    else
        NSLog(@"Switch : OFF");
        
}
- (IBAction)onClickChangePassword:(id)sender {
    
    ChangePasswordViewController* changePasswordViewController = [ChangePasswordViewController new];
    changePasswordViewController.steed = self.steed;
    [self.navigationController pushViewController:changePasswordViewController animated:NO];
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
