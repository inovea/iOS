//
//  TrajetsAttenteViewController.h
//  Inovea
//
//  Created by Sébastien LOUIS on 20/04/2015.
//  Copyright (c) 2015 Inovea. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Circuit.h"


@interface TrajetsAttenteViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
{
    @private
    NSMutableArray* tabCircuits_;
    NSDate* todayDate_;
    NSDateFormatter* dateFormatter_;
}
@property (weak, nonatomic) IBOutlet UITableView *todayTableView;
@property (nonatomic, strong) IBOutlet NSMutableArray* tabCircuits;
@property (nonatomic, strong) NSDate* todayDate;
@property (nonatomic, strong) NSDateFormatter* dateFormatter;

@end
    