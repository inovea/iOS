//
//  DetailsViewController.h
//  Inovea
//
//  Created by Sébastien LOUIS on 09/05/2015.
//  Copyright (c) 2015 Inovea. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Errand.h"

@interface DetailsViewController : UIViewController
{
    @private
    Errand* errand_;
}

@property (weak, nonatomic) IBOutlet UIImageView *previewImage;
@property (nonatomic, strong) Errand* errand;
@property (weak, nonatomic) IBOutlet UILabel *idErrandLbl;
@property (weak, nonatomic) IBOutlet UILabel *distanceErrandLbl;
@property (weak, nonatomic) IBOutlet UILabel *dureeErrandLbl;
@end
