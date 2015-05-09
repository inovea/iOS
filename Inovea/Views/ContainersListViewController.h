//
//  ContainersListViewController.h
//  Inovea
//
//  Created by Sébastien LOUIS on 09/05/2015.
//  Copyright (c) 2015 Inovea. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Errand.h"

@interface ContainersListViewController : UIViewController
{
@private
    Errand* errand_;
}
@property (nonatomic, strong) Errand* errand;

@property (weak, nonatomic) IBOutlet UILabel *idErrandLbl;

@end
