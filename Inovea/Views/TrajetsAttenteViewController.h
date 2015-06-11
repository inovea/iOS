//
//  TrajetsAttenteViewController.h
//  Inovea
//
//  Created by Sébastien LOUIS on 20/04/2015.
//  Copyright (c) 2015 Inovea. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Errand.h"
#import "Steed.h"


@interface TrajetsAttenteViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
{
    @private
    NSMutableArray* tabErrands_;
    NSMutableArray* todayErrands_;
    NSMutableArray* otherErrands_;
    NSDateFormatter* dateFormatter_;
    Steed* steed_;
}
@property (weak, nonatomic) IBOutlet UITableView *todayTableView;
@property (weak, nonatomic) IBOutlet UILabel *noTodayErrandsLbl;
@property (weak, nonatomic) IBOutlet UILabel *noFuturErrandsLbl;
@property (weak, nonatomic) IBOutlet UITableView *othersTableView;

@property (nonatomic, strong) IBOutlet NSMutableArray* tabErrands;
@property (nonatomic, strong) NSMutableArray* todayErrands;
@property (nonatomic, strong) NSMutableArray* otherErrands;
@property (nonatomic, strong) NSDateFormatter* dateFormatter;
@property (nonatomic, strong) Steed* steed;

-(NSMutableArray*) sortErrandsByAscendingTime:(NSMutableArray*)array;
@end
    