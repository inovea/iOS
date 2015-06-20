//
//  DetailsViewController.m
//  Inovea
//
//  Created by Sébastien LOUIS on 09/05/2015.
//  Copyright (c) 2015 Inovea. All rights reserved.
//

#import "DetailsViewController.h"
#import "ContainersListViewController.h"
#import "WSErrand.h"
#import "WSContainer.h"
#import "Container.h"

@interface DetailsViewController ()

@end

@implementation DetailsViewController

@synthesize errand = errand_;


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor clearColor];
    
    
    int idd =(int)[self.errand idd];
    NSMutableArray* array = [NSMutableArray new];
    array = [WSContainer getContainersByErrandId:idd];
    self.errand.containers = array;
    
    
    
    self.idErrandLbl.text = [NSString stringWithFormat:@"%d",[self.errand idd] ];
    self.distanceErrandLbl.text = [NSString stringWithFormat:@"%2.f km", [self.errand distance]];
    
    int min = [self.errand duree];
    int hours = 0;
    int minutes = min;
    
    while(minutes >59){
        minutes -= 60;
        hours ++;
    }
    if(hours)
        self.dureeErrandLbl.text = [NSString stringWithFormat:@"%dh %dmin", hours, minutes];
    else
        self.dureeErrandLbl.text = [NSString stringWithFormat:@"%dmin", minutes];

    
    NSString* googleUrl = [self generateGoogleMapUrl];
    NSLog(@"url ---> %@", googleUrl);
//    NSString* url = @"&markers=color:blue%7Clabel:S%7C40.702147,-74.015794&markers=color:green%7Clabel:G%7C40.711614,-74.012318";
    
    dispatch_async(dispatch_get_global_queue(0,0), ^{
        NSData * data = [[NSData alloc] initWithContentsOfURL: [NSURL URLWithString: [googleUrl stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]]];
        if ( data == nil )
            return;
        dispatch_async(dispatch_get_main_queue(), ^{
            // WARNING: is the cell still using the same data by this point??
            self.previewImage.image = [UIImage imageWithData: data];
        });
    });
}
- (IBAction)onClickItinerary:(id)sender {
    // NSURL *url = [NSURL URLWithString:@"http://maps.google.com/?q=New+York"];
    //[[UIApplication sharedApplication] openURL:url];
    if ([[UIApplication sharedApplication] canOpenURL:
         [NSURL URLWithString:@"comgooglemaps://"]]) {
        [[UIApplication sharedApplication] openURL:
         [NSURL URLWithString:@"comgooglemaps://?center=40.765819,-73.975866&zoom=14&views=traffic"]];
    } else {
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Google Maps"
                                                        message:@"Vous devez installer l'application Google Maps pour lancer l'itinéraire"
                                                       delegate:self
                                              cancelButtonTitle:@"Annuler"
                                              otherButtonTitles:@"Télécharger", nil];
        [alert show];
    }
}

- (IBAction)onClickFinish:(id)sender {
    
        [self goBack];
//    
//    [WSErrand finishErrand:[self errand]];
//    [self.navigationController popViewControllerAnimated:false];
}


- (IBAction)onClickContainersList:(id)sender {
    
    ContainersListViewController* containersListViewController = [ContainersListViewController new];
    
    containersListViewController.errand = self.errand;
    [self.navigationController pushViewController:containersListViewController animated:NO];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(NSString*) generateGoogleMapUrl{


    
    NSMutableString* url = [NSMutableString new];
    
    [url appendString:@"https://maps.googleapis.com/maps/api/staticmap?center=Paris&zoom=13&size=600x300&maptype=roadmap"];
    
    for(Container* cont in [self.errand containers]){
        [url appendString:[NSString stringWithFormat:@"&markers=color:green|label:T|%.5lf,%.5lf", [cont lat], [cont lng]]];
    }
    
    return url;

}

- (void)goBack
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Terminer la course"
                                                    message:@"Souhaitez-vous vraiment terminer cette course ?"
                                                   delegate:self
                                          cancelButtonTitle:@"Non"
                                          otherButtonTitles:@"Oui", nil];
    [alert show];
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
                [WSErrand finishErrand:[self errand]];
                [self.navigationController popViewControllerAnimated:false];
            }
            
            break;
            
    }
    
}

@end
