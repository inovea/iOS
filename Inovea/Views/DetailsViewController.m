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
    NSURL *url = [NSURL URLWithString:@"http://maps.google.com/?q=New+York"];
    [[UIApplication sharedApplication] openURL:url];
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

    NSMutableArray* containers = [NSMutableArray new];
    
    NSMutableString* url = [NSMutableString new];
    
    [url appendString:@"https://maps.googleapis.com/maps/api/staticmap?center=Paris&zoom=13&size=600x300&maptype=roadmap"];

    int idd =(int)[self.errand idd];
    containers = [WSContainer getContainersByErrandId:idd];
    
    for(Container* cont in containers){
        [url appendString:[NSString stringWithFormat:@"&markers=color:green|label:T|%.5lf,%.5lf", [cont lat], [cont lng]]];
    }
    
    return url;

}

- (void)goBack
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Termnier la course"
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
            [WSErrand finishErrand:[self errand]];
            [self.navigationController popViewControllerAnimated:false];
            break;
    }
}

@end
