//
//  ParametersViewController.h
//  Inovea
//
//  Created by Sébastien LOUIS on 01/05/2015.
//  Copyright (c) 2015 Inovea. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Steed.h"

@interface ParametersViewController : UIViewController
{
@private
    Steed* steed_;
}

@property (nonatomic, strong) Steed* steed;
@property (weak, nonatomic) IBOutlet UISwitch *switchNotifications;

@end
