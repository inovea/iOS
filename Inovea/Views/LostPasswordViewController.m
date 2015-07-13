//
//  LostPasswordViewController.m
//  Inovea
//
//  Created by Sébastien LOUIS on 01/05/2015.
//  Copyright (c) 2015 Inovea. All rights reserved.
//

#import "LostPasswordViewController.h"
#import "WebService.h"

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
- (IBAction)onSendClick:(id)sender {
    
    [MBProgressHUD hideHUDForView:self.view animated:YES];

    NSMutableDictionary* result = [WebService getResultWithUrl:[NSString stringWithFormat:@"http://inovea.herobo.com/webhost/courier.php?tag=resetPassword&mail=%@", self.tbMail.text]];
    
    
    if([[result  valueForKey:@"error"] isEqualToString:@"0"]){
        [self.navigationController popViewControllerAnimated:false];
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Confirmation"
                                                        message:@"Votre nouveau mot de passe a été envoyé à l'adresse mail saisie."
                                                       delegate:nil
                                              cancelButtonTitle:@"Valider"
                                              otherButtonTitles:nil];
        [alert show];
    }
    
    else{
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Erreur"
                                                        message:@"L'adresse mail saisie ne correspond à aucun compte."
                                                       delegate:nil
                                              cancelButtonTitle:@"Valider"
                                              otherButtonTitles:nil];
        [alert show];
    }
    
    [MBProgressHUD hideHUDForView:self.view animated:YES];

    
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
