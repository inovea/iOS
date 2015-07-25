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
#import "WebService.h"


@interface DetailsViewController ()

@end

@implementation DetailsViewController

@synthesize errand = errand_;
@synthesize steed = steed_;


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
            [self.loadingLabel setHidden:YES];
            self.previewImage.image = [UIImage imageWithData: data];
            
        });
    });
    
    if(self.errand.state == 0){
        [self.listButton setHidden:YES];
        [self.listTextButton setHidden:YES];
        [self.finishButton setHidden:YES];
        [self.finishTextButton setHidden:YES];
        
    }
    else{
        [self.startButton setHidden:YES];
        [self.startTextButton setHidden:YES];
    }
    
}


- (IBAction)onClickFinish:(id)sender {
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Terminer la course"
                                                    message:@"Souhaitez-vous vraiment terminer cette course ?"
                                                   delegate:self
                                          cancelButtonTitle:@"Non"
                                          otherButtonTitles:@"Oui", nil];
    [alert show];
}


- (IBAction)onClickContainersList:(id)sender {
    
    ContainersListViewController* containersListViewController = [ContainersListViewController new];
    
    containersListViewController.errand = self.errand;
    containersListViewController.steed = self.steed;
    [self.navigationController pushViewController:containersListViewController animated:NO];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(NSString*) generateGoogleMapUrl{


    
    NSMutableString* url = [NSMutableString new];
    
    double optimizedCenterX = 0;
    double optimizedCenterY = 0;
    double minX = 1000;
    double maxX = -1000;
    double minY = 1000;
    double maxY = -1000;
    double Xratio;
    double Yratio;
    int Xzoom;
    int Yzoom;
    int finalZoom;
    
    
    
    int zoomMin = 5;
    int zoomMax = 19;
    double lngRatio = 5.506738;
    double latRatio = 0.877494;
    
    
    
    
    Container* temp = [Container new];
    
    for(int i=0; i<[self.errand.containers count]; i++){
        temp = [self.errand.containers objectAtIndex:i];
        optimizedCenterX += [temp lat];
        optimizedCenterY += [temp lng];
        
        if([temp lat] < minX)
            minX = [temp lat];
        if([temp lat]> maxX)
            maxX = [temp lat];
        
        
        if([temp lng] < minY)
            minY = [temp lng];
        if([temp lng] > maxY)
            maxY = [temp lng];
        
        
    }

    
    optimizedCenterX /= [self.errand.containers count];
    optimizedCenterY /= [self.errand.containers count];
    NSLog(@"X : %f & Y : %f", optimizedCenterX, optimizedCenterY);
    
    Xratio = maxX - minX;
    Yratio = maxY - minY;
    
    Xzoom = zoomMax-(((Xratio*100/latRatio)*15/100)+(zoomMin+1));
    Yzoom = zoomMax-(((Yratio*100/lngRatio)*15/100)+(zoomMin+1));
    
    if(Xzoom < Yzoom)
        finalZoom=Xzoom;
    else
        finalZoom = Yzoom;
    
    
    NSLog(@"Xzoom : %d  && Yzoom :  %d", Xzoom, Yzoom);
    
    
    
    [url appendString:[NSString stringWithFormat:@"https://maps.googleapis.com/maps/api/staticmap?center=%f,%f&zoom=%d&size=600x300&maptype=roadmap", optimizedCenterX, optimizedCenterY, finalZoom]];
    
    int counter = 1;
    
    for(Container* cont in [self.errand containers]){
        [url appendString:[NSString stringWithFormat:@"&markers=color:green|label:%d|%.5lf,%.5lf", counter,[cont lat], [cont lng]]];
        counter ++;
    }
    
    return url;

}
- (IBAction)startErrand:(id)sender {
    Boolean result;
    result = [WSErrand updateErrand:self.errand withState:1];
    if(result){
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Confirmation"
                                                        message:@"Cette course est désormais démarrée."
                                                       delegate:self
                                              cancelButtonTitle:@"Ok"
                                              otherButtonTitles:nil];
        [alert show];
        [self.listButton setHidden:NO];
        [self.listTextButton setHidden:NO];
        [self.finishButton setHidden:NO];
        [self.finishTextButton setHidden:NO];
        [self.startButton setHidden:YES];
        [self.startTextButton setHidden:YES];
        
    }
    
    else{
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Erreur"
                                                        message:@"Impossible de commencer la course. Veuillez vérifier votre connexion internet ou contacter votre ordonnanceur."
                                                       delegate:self
                                              cancelButtonTitle:@"Ok"
                                              otherButtonTitles:nil];
        [alert show];
        
    }
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    
    
    switch(buttonIndex) {
        case 1:
            if([[alertView buttonTitleAtIndex:1] isEqualToString:@"Télécharger"]){
                [[UIApplication sharedApplication] openURL:
                 [NSURL URLWithString:@"https://itunes.apple.com/us/app/google-maps/id585027354?mt=8"]];
            }
            else if([[alertView buttonTitleAtIndex:1] isEqualToString:@"Confimer"]){
                
            }
            
            else{
                [MBProgressHUD showHUDAddedTo:self.view animated:YES];
                
                Boolean result = [WSErrand updateErrand:self.errand withState:2];
                for (int i = 0; i< [[self.errand containers] count]; i++) {
                    Container* container = [[self.errand containers] objectAtIndex:i];
                    
                   
                    NSString *url = [NSString stringWithFormat:@"http://inovea.herobo.com/webhost/container.php?tag=update&idContainer=%d&name=%@&lat=%f&lng=%f&state=%d&lastCollect=%@&address=%@&idErrand=1", container.idd, container.name, container.lat, container.lng, container.contState, container.lastCollect,container.address];
                    url = [url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];

                        [WebService getResultWithUrl:url];
                    
                    NSLog(@"%@", url);
                }
                
                [MBProgressHUD hideHUDForView:self.view animated:YES];
                if(result)
                    [self.navigationController popViewControllerAnimated:false];
                else{
                    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Erreur"
                                                                    message:@"Impossible de terminer la course. Veuillez vérifier votre connexion internet ou contacter votre ordonnanceur."
                                                                   delegate:self
                                                          cancelButtonTitle:@"Ok"
                                                          otherButtonTitles:nil];
                    [alert show];
                    
                }
            }
            
            break;
            
    }
    
}

@end
