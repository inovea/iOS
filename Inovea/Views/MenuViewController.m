//
//  MenuViewController.m
//  Inovea
//
//  Created by Sébastien LOUIS on 19/03/2015.
//  Copyright (c) 2015 Inovea. All rights reserved.
//

#import "MenuViewController.h"
#import "TrajetsAttenteViewController.h"
#import "TrajetsFinisViewController.h"
#import "ParametersViewController.h"

@interface MenuViewController ()

@end

@implementation MenuViewController

@synthesize steed = steed_;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor clearColor];
    // Do any additional setup after loading the view from its nib.
    
    UIImage* trajetsAttenteImg = [[UIImage imageNamed:@"icon_1-1.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIImage* trajetsTerminesImg = [[UIImage imageNamed:@"icon_2-1.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIImage* parametresImg = [[UIImage imageNamed:@"icon_3-1.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    
    [self.trajetsAttenteBtn setTintColor:[UIColor blackColor]];
    
    
    [self.trajetsAttenteBtn setImage:trajetsAttenteImg forState:UIControlStateNormal];
    [self.trajetsAttenteBtn setTitle:@"Trajets en attente" forState:UIControlStateNormal];
    
    [self.trajetsTerminesBtn setImage:trajetsTerminesImg forState:UIControlStateNormal];
    [self.trajetsTerminesBtn setTitle:@"Trajets terminés" forState:UIControlStateNormal];
    
    [self.parametresBtn setImage:parametresImg forState:UIControlStateNormal];
    [self.parametresBtn setTitle:@"Paramètres du compte" forState:UIControlStateNormal];
}
- (IBAction)trajetsAttenteAction:(id)sender {
    
    TrajetsAttenteViewController* trajetsAttenteViewController = [TrajetsAttenteViewController new];
    trajetsAttenteViewController.steed = self.steed;
    [self.navigationController pushViewController:trajetsAttenteViewController animated:NO];
}

- (IBAction)onClickTrajetsFinis:(id)sender {
    
    TrajetsFinisViewController* trajetsFinisViewController = [TrajetsFinisViewController new];
    [self.navigationController pushViewController:trajetsFinisViewController animated :NO];
}

- (IBAction)onClickParameters:(id)sender {
    ParametersViewController* parametersViewController = [ParametersViewController new];
    parametersViewController.steed = self.steed;
    [self.navigationController pushViewController:parametersViewController animated:NO];
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
