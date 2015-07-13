//
//  TrajetsFinisViewController.h
//  Inovea
//
//  Created by Sébastien LOUIS on 01/05/2015.
//  Copyright (c) 2015 Inovea. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Steed.h"
#import "MBProgressHUD.h"

@interface TrajetsFinisViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
{
@private
NSMutableArray* tabErrands_;
NSMutableArray* tabFinishErrands_;
Steed* steed_;
}

@property (nonatomic, strong) IBOutlet NSMutableArray* tabErrands;
@property (nonatomic, strong) IBOutlet NSMutableArray* tabFinishErrands;
@property (nonatomic, strong) Steed* steed;


@property (weak, nonatomic) IBOutlet UITableView *finishErrandsTableView;

@property (weak, nonatomic) IBOutlet UILabel *noErrandsLbl;


@end
