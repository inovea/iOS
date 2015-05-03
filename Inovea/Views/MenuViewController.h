//
//  MenuViewController.h
//  Inovea
//
//  Created by Sébastien LOUIS on 19/03/2015.
//  Copyright (c) 2015 Inovea. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Steed.h"

@interface MenuViewController : UIViewController
{
@private
    Steed* steed_;
}

@property (nonatomic, strong) Steed* steed;
@property (weak, nonatomic) IBOutlet UIButton *trajetsAttenteBtn;
@property (weak, nonatomic) IBOutlet UIButton *trajetsTerminesBtn;
@property (weak, nonatomic) IBOutlet UIButton *parametresBtn;

@end
