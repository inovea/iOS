//
//  HomeViewController.m
//  Inovea
//
//  Created by Sébastien LOUIS on 14/03/2015.
//  Copyright (c) 2015 Inovea. All rights reserved.
//

#import "HomeViewController.h"
#import "MenuViewController.h"
#import "LostPasswordViewController.h"
#import "Steed.h"
#import "Connexion.h"
#import "MBProgressHUD.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

-(void) viewWillAppear:(BOOL)animated{
    
    if(self.tbMail.text.length == 0)
        [self.mailLbl setHidden:YES];
    if(self.tbPassword.text.length ==0)
        [self.passwordLbl setHidden:YES];
}

- (void)viewDidLoad {
    
    self.tbPassword.delegate = self;
    self.tbMail.delegate = self;
    
    
    
    [self.tbMail setValue:[UIColor colorWithRed:1 green:1 blue:1 alpha:0.5] forKeyPath:@"_placeholderLabel.textColor"];
    [self.tbMail addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    
    
    [self.tbPassword setValue:[UIColor colorWithRed:1 green:1 blue:1 alpha:0.5] forKeyPath:@"_placeholderLabel.textColor"];
    [self.tbPassword addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    
    
    [super viewDidLoad];
    
    
    
     self.view.backgroundColor = [UIColor clearColor];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)textFieldDidBeginEditing:(UITextField *)textField{
    [textField setBackground:[UIImage imageNamed:@"textFieldBg.png"]];
}

- (void)textFieldDidEndEditing:(UITextField *)textField{
    [textField setBackground:[UIImage imageNamed:@"textFieldBg2.png"]];
}
- (IBAction)onClickConnexion:(id)sender {
    
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    
    Steed* steed = [Steed new];
    steed = [Connexion loginWithMail:self.tbMail.text andPassword:self.tbPassword.text];
    
    
    if(steed != nil)
    {
        self.tbPassword.text = @"";
        MenuViewController* menuViewController = [MenuViewController new];
        menuViewController.steed = steed;
        [self.navigationController pushViewController:menuViewController animated:NO];
       
    }
    else
    {
        self.errorLoginLbl.text = @"Adresse mail/mot de passe incorrecte";
    }
    [MBProgressHUD hideHUDForView:self.view animated:YES];

  
}

- (IBAction)onClickLostPassword:(id)sender {
    
    LostPasswordViewController* lostPasswordViewController = [LostPasswordViewController new];
    [self.navigationController pushViewController:lostPasswordViewController animated:NO];
}

-(void)textFieldDidChange :(UITextField *)theTextField{
    
    Boolean val;
    
    if([theTextField.text isEqualToString:@""])
        val = true;
    else
        val = false;
    
    if([theTextField isEqual:self.tbMail]){
        NSLog(@"actual password");
        self.mailLbl.hidden = val;
    }
    
    else if([theTextField isEqual:self.tbPassword]){
        NSLog(@"new password");
        self.passwordLbl.hidden = val;
    }
    
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self.tbPassword endEditing:YES];
    [self.tbMail endEditing:YES];
}


@end

