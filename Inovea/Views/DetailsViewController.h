//
//  DetailsViewController.h
//  Inovea
//
//  Created by Sébastien LOUIS on 09/05/2015.
//  Copyright (c) 2015 Inovea. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Errand.h"
#import "Steed.h"

@interface DetailsViewController : UIViewController
{
    @private
    Errand* errand_;
    Steed* steed_;
}

@property (weak, nonatomic) IBOutlet UIImageView *previewImage;
@property (nonatomic, strong) Errand* errand;
@property (nonatomic, strong) Steed* steed;

@property (weak, nonatomic) IBOutlet UILabel *idErrandLbl;
@property (weak, nonatomic) IBOutlet UILabel *distanceErrandLbl;
@property (weak, nonatomic) IBOutlet UILabel *dureeErrandLbl;
@property (weak, nonatomic) IBOutlet UIButton *finishButton;
@property (weak, nonatomic) IBOutlet UIButton *finishTextButton;
@property (weak, nonatomic) IBOutlet UIButton *startButton;
@property (weak, nonatomic) IBOutlet UIButton *startTextButton;
@property (weak, nonatomic) IBOutlet UIButton *listButton;
@property (weak, nonatomic) IBOutlet UIButton *listTextButton;
@property (weak, nonatomic) IBOutlet UILabel *loadingLabel;

@end
