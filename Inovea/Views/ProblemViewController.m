//
//  ProblemeViewController.m
//  Inovea
//
//  Created by Sébastien LOUIS on 21/06/2015.
//  Copyright (c) 2015 Inovea. All rights reserved.
//


#import "ProblemViewController.h"
#import "WebService.h"


@interface ProblemViewController ()

@end


@implementation ProblemViewController

@synthesize selectedContainer = selectedContainer_;
@synthesize charlbl = charlbl_;
@synthesize steed = steed_;
@synthesize commentary = commentary_;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.parentViewController.automaticallyAdjustsScrollViewInsets = NO;
    self.view.backgroundColor = [UIColor clearColor];
    
    NSLog(@"%d", [self.selectedContainer idd]);
    
    
     CGRect titleViewFrame = CGRectMake(80.0f, 50.0f, 280.0f, 150.0f);
    UILabel* titleLbl = [[UILabel alloc] initWithFrame:titleViewFrame];
    titleLbl.text = @"Signaler un problème";
    titleLbl.textColor = [UIColor whiteColor];
    titleLbl.font = [UIFont boldSystemFontOfSize:18.0f];
    [self.view addSubview:titleLbl];
    
    CGRect labelViewFrame = CGRectMake(20.0f, 130.0f, 280.0f, 150.0f);
    
    UILabel* commentaryLbl = [[UILabel alloc] initWithFrame:labelViewFrame];
    commentaryLbl.text = @"Commentaire :";
    commentaryLbl.textColor = [UIColor whiteColor];
    commentaryLbl.font = [UIFont boldSystemFontOfSize:15.0f];
    [self.view addSubview:commentaryLbl];
    
    CGRect textViewFrame = CGRectMake(20.0f, 230.0f, 280.0f, 150.0f);
    self.commentary= [[UITextView alloc] initWithFrame:textViewFrame];
    self.commentary.contentInset = UIEdgeInsetsMake(-7.0,0.0,0,0.0);
    self.commentary.returnKeyType = UIReturnKeyDone;
    [self.view addSubview:self.commentary];
    self.commentary.delegate = self;
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    
    CGRect charViewFrame = CGRectMake(150.0f, 315.0f, 280.0f, 150.0f);
    self.charlbl
    = [[UILabel alloc] initWithFrame:charViewFrame];
    self.charlbl.text = @"250 caractères restants";
    self.charlbl.textColor = [UIColor whiteColor];
    self.charlbl.font = [UIFont boldSystemFontOfSize:15.0f];
    [self.view addSubview:charlbl_];

    CGRect sendButtonViewFrame = CGRectMake(110.0f, 500.0f, 100.0f, 30.0f);
    UIButton* sendButton = [[UIButton alloc] initWithFrame:sendButtonViewFrame];
    
    [sendButton setTitle:@"Envoyer" forState:UIControlStateNormal];
    
    [sendButton addTarget: self
              action: @selector(onSendButtonClick:)
    forControlEvents: UIControlEventTouchUpInside];
    sendButton.layer.cornerRadius = 10
    ;
    
    [[sendButton layer] setBorderWidth:2.0f];
    [[sendButton layer] setBorderColor:[UIColor whiteColor].CGColor];
    [self.view addSubview:sendButton];
    
}


- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
}


- (IBAction)onSendButtonClick:(id)sender {
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    
    NSString* code = [self.commentary.text stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    NSString* url = [NSString stringWithFormat:@"http://inovea.herobo.com/webhost/alert.php?tag=create&state=0&description=%@&author=%d&idContainer=%d", code, [self.steed idd], self.selectedContainer.idd];
    
    NSString *url2 = [NSString stringWithFormat:@"http://inovea.herobo.com/webhost/container.php?tag=update&idContainer=%d&name=%@&lat=%f&lng=%f&state=2&lastCollect=%@&address=%@&idErrand=%d", self.selectedContainer.idd, self.selectedContainer.name, self.selectedContainer.lat, self.selectedContainer.lng, self.selectedContainer.lastCollect,self.selectedContainer.address, self.selectedContainer.idErrand];
    url2 = [url2 stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    [WebService getResultWithUrl:url2];

    
    
    
    NSLog(@"%@", url);
    
    
    NSMutableDictionary* result = [WebService getResultWithUrl:url];
    [MBProgressHUD hideHUDForView:self.view animated:YES];
     [self.navigationController popViewControllerAnimated:false];
    
    if (result!=nil && [[result valueForKey:@"error"] isEqualToString:@"0"]){
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Confirmation"
                                                        message:@"L'alert a bien été envoyée."
                                                       delegate:nil
                                              cancelButtonTitle:@"Valider"
                                              otherButtonTitles:nil];
        [alert show];
    }
    
    else{
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Erreur"
                                                        message:@"Impossible d'envoyer l'information."
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];    }
    
    
    
}


- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{
    NSCharacterSet *doneButtonCharacterSet = [NSCharacterSet newlineCharacterSet];
    NSRange replacementTextRange = [text rangeOfCharacterFromSet:doneButtonCharacterSet];
    NSUInteger location = replacementTextRange.location;
    
    if (textView.text.length + text.length > 250){
        if (location != NSNotFound){
            [textView resignFirstResponder];
        }
        return NO;
    }
    else if (location != NSNotFound){
        [textView resignFirstResponder];
        return NO;
    }
    return YES;
}


- (void)textViewDidChange:(UITextView *)textView{
    self.charlbl.text = [NSString stringWithFormat:@"%d caractères restants",250-textView.text.length];
}

@end

