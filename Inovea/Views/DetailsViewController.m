//
//  DetailsViewController.m
//  Inovea
//
//  Created by Sébastien LOUIS on 09/05/2015.
//  Copyright (c) 2015 Inovea. All rights reserved.
//

#import "DetailsViewController.h"
#import "ContainersListViewController.h"

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

    
    
    NSString* url = @"https://maps.googleapis.com/maps/api/staticmap?center=Brooklyn+Bridge,New+York,NY&zoom=13&size=600x300&maptype=roadmap&markers=color:blue%7Clabel:S%7C40.702147,-74.015794&markers=color:green%7Clabel:G%7C40.711614,-74.012318";
    
    dispatch_async(dispatch_get_global_queue(0,0), ^{
        NSData * data = [[NSData alloc] initWithContentsOfURL: [NSURL URLWithString: url]];
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
- (IBAction)onClickContainersList:(id)sender {
    
    ContainersListViewController* containersListViewController = [ContainersListViewController new];
    
    containersListViewController.errand = self.errand;
    [self.navigationController pushViewController:containersListViewController animated:NO];
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
