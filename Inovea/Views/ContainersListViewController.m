//
//  ContainersListViewController.m
//  Inovea
//
//  Created by Sébastien LOUIS on 09/05/2015.
//  Copyright (c) 2015 Inovea. All rights reserved.
//

#import "ContainersListViewController.h"
#import "Container.h"
#import "ProblemViewController.h"
#import "WSContainer.h"
#import "MBProgressHUD.h"
#import "WSErrand.h"
#import "WebService.h"

@interface ContainersListViewController ()

@end

static NSString* const kHomeViewControllerCellIdentifier=@"SuperUniqueKey";

@implementation ContainersListViewController

@synthesize errand = errand_;
@synthesize selectedContaineur = selectedContaineur_;
@synthesize buttons = buttons_;
@synthesize steed = steed_;
@synthesize hud = hud_;


- (void)viewDidLoad {
    
    
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor clearColor];
    self.containersTableView.delegate = self;
    self.containersTableView.dataSource = self;
    self.idErrandLbl.text = [NSString stringWithFormat:@" %d",[self.errand idd]];
    self.selectedContaineur = -1;
    self.buttons =[[NSMutableArray alloc] init];
    self.problemBtn.hidden=YES;
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)tableView:(UITableView*)tableView numberOfRowsInSection:(NSInteger)section{
    return [[self.errand containers] count];
}

-(UITableViewCell *)tableView:(UITableView *)
tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSMutableArray* containersList = [self.errand containers];
    Container* container  = [Container new];
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:kHomeViewControllerCellIdentifier];
    
    
    
    container = [containersList objectAtIndex:indexPath.row];
    
    
    if(cell==nil){
        cell= [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kHomeViewControllerCellIdentifier];
        
        
        UILabel* containerLbl = [[UILabel alloc]initWithFrame:CGRectMake(40, 12 , 140, 20)];
        containerLbl.text = [NSString stringWithFormat:@"Conteneur n°%d", [container idd]];
        containerLbl.textColor = [UIColor colorWithRed:255/255. green:255/255. blue:255/255. alpha:1];
        
        UIButton *radiobutton;
        radiobutton = [[UIButton alloc] initWithFrame:CGRectMake(10,7,35,30)];
        [radiobutton setBackgroundImage:[UIImage imageNamed:@"radio-unselected.png"] forState:UIControlStateNormal];
        [radiobutton setBackgroundImage:[UIImage imageNamed:@"radio-selected.png"] forState:UIControlStateSelected];
        [radiobutton addTarget:self action:@selector(onClickRadiobutton:) forControlEvents:UIControlEventTouchUpInside];
        //Numero de la ligne de la checkbox
        radiobutton.tag = (int)indexPath.row;
        
        [self.buttons addObject:radiobutton];
        
        
        
        UIButton* directionBtn;
        directionBtn =[[UIButton alloc] initWithFrame:CGRectMake(240,15,23,20)];
        [directionBtn setBackgroundImage:[UIImage imageNamed:@"direction.png"] forState:UIControlStateNormal];
        directionBtn.tag = (int)indexPath.row;
        
        [directionBtn addTarget:self action:@selector(onClickDirection:) forControlEvents:UIControlEventTouchUpInside];

        UIButton *checkbox;
        checkbox = [[UIButton alloc] initWithFrame:CGRectMake(280,10,33,30)];
                    // 20x20 is the size of the checckbox that you want
                    // create 2 images sizes 20x20 , one empty square and
                    // another of the same square with the checkmark in it
                    // Create 2 UIImages with these new images, then:
        
        
                    [checkbox setBackgroundImage:[UIImage imageNamed:@"valid-icon-empty.png"] forState:UIControlStateNormal];
                    [checkbox setBackgroundImage:[UIImage imageNamed:@"valid-icon-full.png"] forState:UIControlStateSelected];
                    checkbox.adjustsImageWhenHighlighted=YES;
                     [checkbox addTarget:self action:@selector(onClickCheckbox:) forControlEvents:UIControlEventTouchUpInside];
            //Numero de la ligne de la checkbox
            checkbox.tag = (int)indexPath.row;
        
        
            //Etat du bouton en fonction de l'état du conteneur
            if([[[self.errand containers] objectAtIndex:indexPath.row] contState] == 1)
            {
                [checkbox setSelected:false];
            }
        
            else{
                [checkbox setSelected:true];
            }
        
        
                    [cell.contentView addSubview:checkbox];
                    [cell.contentView addSubview:directionBtn];
                    [cell.contentView addSubview:radiobutton];

        
                    [cell.contentView addSubview:containerLbl];
                    
                    cell.backgroundColor = [UIColor clearColor];
                    
        }
                    
    return cell;
}



-(void) onClickRadiobutton:(id)sender{
   
    
    UIButton *button = (UIButton *)sender;
    
    if(![button isSelected]){
        for (int i=0; i<[self.buttons count]; i++) {
            [[self.buttons objectAtIndex:i] setSelected:false];
        }
        [button setSelected:true];
        self.selectedContaineur = [button tag];
        self.problemBtn.hidden=NO;
    }
    
    else{
         [button setSelected:false];
        self.selectedContaineur = -1;
        self.problemBtn.hidden=YES;
        
        
    }
    
    
}

-(void)onClickDirection:(id)sender{
    
    UIButton *button = (UIButton *)sender;
    Container* selectedCont = [[self.errand containers] objectAtIndex:button.tag];
    NSMutableArray* address = (NSMutableArray*)[[selectedCont address] componentsSeparatedByString:@" "];
    NSMutableString* url = [NSMutableString stringWithFormat:@"comgooglemaps://?directionmode=driving&daddr="];
    for(int i=0; i<[address count]; i++){
        if(i==0)
            [url appendString:[address objectAtIndex:i]];
        else
            [url appendString:[NSString stringWithFormat:@",+%@",[address objectAtIndex:i]]];
    }
    NSLog(url);
    if ([[UIApplication sharedApplication] canOpenURL:
         [NSURL URLWithString:@"comgooglemaps://"]]) {
        [[UIApplication sharedApplication] openURL:
         [NSURL URLWithString:url]];
    } else {
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Google Maps"
                                                        message:@"Vous devez installer l'application Google Maps pour lancer l'itinéraire"
                                                       delegate:self
                                              cancelButtonTitle:@"Annuler"
                                              otherButtonTitles:@"Télécharger", nil];
        [alert show];
    }
}
                    
-(void)onClickCheckbox:(id)sender{
    
    
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    
   
    UIButton *button = (UIButton *)sender;
    Container* container = [self.errand.containers objectAtIndex:button.tag];
    int state;
    
    
    if(![button isSelected])
        state = 0;
        
    else
        state = 1;
    
       // NSLog(@"Conteneur n°%d, %@", button.tag, [[[self.errand containers] objectAtIndex:button.tag] name]);
        
        
        BOOL result = [WSContainer changeContainerStateWithContainer:container andState:state];
        if(result){
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Confirmation"
                                                            message:@"L'information concernant ce conteneur a bien été enregistrée"
                                                           delegate:nil
                                                  cancelButtonTitle:@"OK"
                                                  otherButtonTitles:nil];
            [alert show];
            if(![button isSelected])
                [button setSelected:true];
                
            else
                [button setSelected:false];
        }
        
        else{
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Erreur"
                                                            message:@"Impossible d'envoyer l'information."
                                                           delegate:nil
                                                  cancelButtonTitle:@"OK"
                                                  otherButtonTitles:nil];
            [alert show];
        }
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    
}

- (IBAction)onClickFinish:(id)sender {
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Terminer la course"
                                                    message:@"Souhaitez-vous vraiment terminer cette course ?"
                                                   delegate:self
                                          cancelButtonTitle:@"Non"
                                          otherButtonTitles:@"Oui", nil];
    [alert show];
}



- (IBAction)onClickProblem:(id)sender {
    
    ProblemViewController* problemViewController = [ProblemViewController new];
    problemViewController.selectedContainer = [[self.errand containers] objectAtIndex:self.selectedContaineur];
    problemViewController.steed = self.steed;
    [self.navigationController pushViewController:problemViewController animated:NO];
}


- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    switch(buttonIndex) {
        case 1:
            if([[alertView buttonTitleAtIndex:1] isEqualToString:@"Télécharger"]){
                [[UIApplication sharedApplication] openURL:
                 [NSURL URLWithString:@"https://itunes.apple.com/us/app/google-maps/id585027354?mt=8"]];
            }
            else{
                [MBProgressHUD showHUDAddedTo:self.view animated:YES];
                [WSErrand updateErrand:[self errand] withState:2];
                for (int i = 0; i< [[self.errand containers] count]; i++) {
                    Container* container = [[self.errand containers] objectAtIndex:i];
                    
                    
                    NSString *url = [NSString stringWithFormat:@"http://inovea.herobo.com/webhost/container.php?tag=update&idContainer=%d&name=%@&lat=%f&lng=%f&state=%d&lastCollect=%@&address=%@&idErrand=1", container.idd, container.name, container.lat, container.lng, container.contState, container.lastCollect,container.address];
                    url = [url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
                    
                    [WebService getResultWithUrl:url];
                    
                    NSLog(@"%@", url);
                }

                [MBProgressHUD hideHUDForView:self.view animated:YES];
                int count = [self.navigationController.viewControllers count];
                [self.navigationController popToViewController: [self.navigationController.viewControllers objectAtIndex:count-3] animated:NO];
            }
            break;
    }
}

- (void)hudWasHidden {
    // Remove HUD from screen
    [self.hud removeFromSuperview];
    
    // add here the code you may need
    
}

@end
