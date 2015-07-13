//
//  TrajetsFinisViewController.m
//  Inovea
//
//  Created by Sébastien LOUIS on 01/05/2015.
//  Copyright (c) 2015 Inovea. All rights reserved.
//

#import "TrajetsFinisViewController.h"
#import "WSErrand.h"
#import "Errand.h"

@interface TrajetsFinisViewController ()

@end

static NSString* const kHomeViewControllerCellIdentifier=@"SuperUniqueKey";

@implementation TrajetsFinisViewController

@synthesize tabErrands = tabErrands_;
@synthesize tabFinishErrands = tabFinishErrands_;
@synthesize steed = steed_;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];

    self.view.backgroundColor = [UIColor clearColor];
    self.finishErrandsTableView.delegate = self;
    self.finishErrandsTableView.dataSource = self;
    
    self.tabErrands = [WSErrand getErrandsWithCourierId:self.steed.idd];
    self.tabFinishErrands = [NSMutableArray new];

    
    for(Errand* errand in self.tabErrands)
    {
        if([errand state] == 2){
            [self.tabFinishErrands addObject:errand];
        }
    }
    
    if([self.tabFinishErrands count] == 0)
        self.noErrandsLbl.hidden = false;
    
    
    [MBProgressHUD hideHUDForView:self.view animated:YES];


}


-(NSInteger)tableView:(UITableView*)tableView numberOfRowsInSection:(NSInteger)section{
          return [self.tabFinishErrands count];
}

-(UITableViewCell *)tableView:(UITableView *)
tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    Errand* errand = [Errand new];
    NSDateFormatter* tableViewDateFormatter = [NSDateFormatter new];
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:kHomeViewControllerCellIdentifier];
    
    
        //  [dateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss.SSS"];
        [tableViewDateFormatter setDateFormat:@"dd/MM"];
        errand = [self.tabFinishErrands objectAtIndex:indexPath.row];
    
    
    if(cell==nil){
        cell= [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kHomeViewControllerCellIdentifier];
        
        NSString *errandDate =[tableViewDateFormatter stringFromDate:[errand dateFin]];
        
        
        UILabel* errandLbl = [[UILabel alloc]initWithFrame:CGRectMake(20, 22, 140, 20)];
        errandLbl.text = [NSString stringWithFormat:@"%@  Trajet n°%d", errandDate, [errand idd]];
        errandLbl.textColor = [UIColor colorWithRed:255/255. green:255/255. blue:255/255. alpha:1];
        [cell.contentView addSubview:errandLbl];
        
        cell.backgroundColor = [UIColor clearColor];
        
    }
        
    return cell;
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
