//
//  LostPasswordViewController.m
//  Inovea
//
//  Created by Sébastien LOUIS on 01/05/2015.
//  Copyright (c) 2015 Inovea. All rights reserved.
//

#import "LostPasswordViewController.h"

@interface LostPasswordViewController ()

@end

@implementation LostPasswordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tbMail setValue:[UIColor colorWithRed:1 green:1 blue:1 alpha:0.5] forKeyPath:@"_placeholderLabel.textColor"];
    
    self.view.backgroundColor = [UIColor clearColor];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
