//
//  ChangePasswordViewController.m
//  Inovea
//
//  Created by Sébastien LOUIS on 03/05/2015.
//  Copyright (c) 2015 Inovea. All rights reserved.
//

#import "ChangePasswordViewController.h"
#import "Connexion.h"
#import "WebService.h"

@interface ChangePasswordViewController ()

@end

@implementation ChangePasswordViewController
@synthesize steed = steed_;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor clearColor];
    
    
    [self.tbActualPassword setValue:[UIColor colorWithRed:1 green:1 blue:1 alpha:0.5] forKeyPath:@"_placeholderLabel.textColor"];
    [self.tbActualPassword addTarget:self
                              action:@selector(textFieldDidChange:)
                    forControlEvents:UIControlEventEditingChanged];
    
    [self.tbNewPassword setValue:[UIColor colorWithRed:1 green:1 blue:1 alpha:0.5] forKeyPath:@"_placeholderLabel.textColor"];
    [self.tbNewPassword addTarget:self
                              action:@selector(textFieldDidChange:)
                    forControlEvents:UIControlEventEditingChanged];
    
    [self.tbConfirmNewPassword setValue:[UIColor colorWithRed:1 green:1 blue:1 alpha:0.5] forKeyPath:@"_placeholderLabel.textColor"];
    [self.tbConfirmNewPassword addTarget:self
                              action:@selector(textFieldDidChange:)
                    forControlEvents:UIControlEventEditingChanged];
    
   
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)onClickValidate:(id)sender {
    
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];

    
    Steed* test = [Connexion loginWithMail: [self.steed mail] andPassword: self.tbActualPassword.text];
    if(test!=nil && ([self.tbNewPassword.text isEqualToString:self.tbConfirmNewPassword.text]))
    {
        NSString* url = [NSString stringWithFormat:@"http://inovea.herobo.com/webhost/courier.php?tag=changeWord&mail=%@&word1=%@&word2=%@", self.steed.mail, self.tbActualPassword.text, self.tbNewPassword.text];
        [WebService getResultWithUrl:url];
        NSLog(url);
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Confirmation"
                                                        message:@"Nouveau mot de passe enregistré."
                                                       delegate:nil
                                              cancelButtonTitle:@"Valider"
                                              otherButtonTitles:nil];
        [alert show];
        

    }
    else{
        if(test==nil)
           {
               UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Erreur"
                                                               message:@"Le mot de passe actuel est incorrect."
                                                              delegate:nil
                                                     cancelButtonTitle:@"OK"
                                                     otherButtonTitles:nil];
               [alert show];
           }
        else if(!([self.tbNewPassword.text isEqualToString:self.tbConfirmNewPassword.text])){
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Erreur"
                                                            message:@"La confirmation et le nouveau mot de passe ne correspondent pas."
                                                           delegate:nil
                                                  cancelButtonTitle:@"OK"
                                                  otherButtonTitles:nil];
            [alert show];
        }
    }
        NSLog(@"Error : steed -> %@, actual -> %@, new -> %@, confirm -> %@", [self.steed password], self.tbActualPassword.text, self.tbNewPassword.text, self.tbNewPassword.text );
    
    [MBProgressHUD hideHUDForView:self.view animated:YES];

}

-(void)textFieldDidChange :(UITextField *)theTextField{
    
    Boolean val;
    
    if([theTextField.text isEqualToString:@""])
       val = true;
    else
        val = false;
    
    if([theTextField isEqual:self.tbActualPassword]){
        NSLog(@"actual password");
              self.actualPasswordLbl.hidden = val;
    }
        
    else if([theTextField isEqual:self.tbNewPassword]){
         NSLog(@"new password");
         self.passwordLbl.hidden = val;
    }
    
    else if([theTextField isEqual:self.tbConfirmNewPassword]){
        NSLog(@"confirm password");
        self.confirmPasswordLbl.hidden = val;

    }
    
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self.tbActualPassword endEditing:YES];
    [self.tbNewPassword endEditing:YES];
    [self.tbConfirmNewPassword endEditing:YES];
}


- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    switch(buttonIndex) {
        case 1:
            if([[alertView buttonTitleAtIndex:1] isEqualToString:@"Valider"]){
                [self.navigationController popViewControllerAnimated:false];
            }
            break;
    }
}


@end

