//
//  TrajetsAttenteViewController.m
//  Inovea
//
//  Created by Sébastien LOUIS on 20/04/2015.
//  Copyright (c) 2015 Inovea. All rights reserved.
//

#import "TrajetsAttenteViewController.h"
#import "Errand.h"
#import "Container.h"
#import "WSErrand.h"

@interface TrajetsAttenteViewController ()

@end

static NSString* const kHomeViewControllerCellIdentifier=@"SuperUniqueKey";

@implementation TrajetsAttenteViewController


@synthesize tabErrands = tabErrands_;
@synthesize todayErrands = todayErrands_;
@synthesize otherErrands = otherErrands_;
@synthesize steed = steed_;


-(void) viewWillAppear:(BOOL)animated{
    
//    [self.todayTableView reloadData];
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor clearColor];
    self.todayTableView.delegate = self;
    self.todayTableView.dataSource = self;
    self.othersTableView.delegate = self;
    self.othersTableView.dataSource = self; 
    
    self.dateFormatter = [[NSDateFormatter alloc] init];
    [self.dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm"];
    

    
    /*
     Tableau de circuits
     */
    self.tabErrands = [WSErrand getErrandsWithId:self.steed.idd];
    
    self.todayErrands = [NSMutableArray new];
    self.otherErrands = [NSMutableArray new];
    
    
     NSCalendar *calendar = [NSCalendar currentCalendar];
    
    for(Errand* errand in self.tabErrands)
    {
        NSDateComponents* componentsForFirstDate = [calendar components:NSCalendarUnitDay|NSCalendarUnitMonth|NSCalendarUnitYear fromDate:[errand dateDebut]];
        NSLog(@"date course : %@", [errand dateDebut]);
        NSDateComponents* componentsForSecondDate = [calendar components:NSCalendarUnitDay|NSCalendarUnitMonth|NSCalendarUnitYear fromDate:[NSDate date]];

        
        
        if ([componentsForFirstDate day] == [componentsForSecondDate day] && [componentsForFirstDate month] == [componentsForSecondDate month] && [componentsForFirstDate year] == [componentsForSecondDate year])
        {
        
            [self.todayErrands addObject:errand];
            
        }
        else
        {
            [self.otherErrands addObject:errand];
        }
    
        NSLog(@"today : %lu   others : %lu", (unsigned long)[self.todayErrands count], (unsigned long)[self.otherErrands count]);
        
    }

    
    
   
    
    
    
    
    
    
//
//    NSDate *now = [self.dateFormatter dateFromString:@"1994-04-28 20:50"];
//    NSLog(@"id -> %d", self.steed.idd);
    
    

    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(NSInteger)tableView:(UITableView*)tableView numberOfRowsInSection:(NSInteger)section{
    
    if(tableView == self.todayTableView)
    return [self.todayErrands count];
    else
    return [self.otherErrands count];
}

-(UITableViewCell *)tableView:(UITableView *)
tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    Errand* errand = [Errand new];
    NSDateFormatter* tableViewDateFormatter = [NSDateFormatter new];
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:kHomeViewControllerCellIdentifier];
    
    
    if(tableView == self.todayTableView){
        //  [dateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss.SSS"];
        [tableViewDateFormatter setDateFormat:@"HH:mm"];
        errand = [self.todayErrands objectAtIndex:indexPath.row];
    }
    
    else{
        //  [dateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss.SSS"];
        [tableViewDateFormatter setDateFormat:@"dd/MM"];
        errand = [self.otherErrands objectAtIndex:indexPath.row];

    }
    
    
    NSLog(@"%@", errand);
    if(cell==nil){
        cell= [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kHomeViewControllerCellIdentifier];
    
  
        
        
    NSString *circuitDate =[tableViewDateFormatter stringFromDate:[errand dateDebut]];
   
        
        
        
    int min = [errand duree];
    int hours = 0;
    int minutes = min;
  
    while(minutes >59){
        minutes -= 60;
        hours ++;
    }
    min = min - 60*hours;

   
    UILabel* errandLbl = [[UILabel alloc]initWithFrame:CGRectMake(20, 22, 140, 20)];
    errandLbl.text = [NSString stringWithFormat:@"%@  Trajet n°%d", circuitDate, [errand idd]];
    
    
    UILabel* dureeLbl = [[UILabel alloc]initWithFrame:CGRectMake(300, 22, 140, 20)];
    dureeLbl.textColor = [UIColor colorWithRed:15/255. green:94/255. blue:30/255. alpha:1];
    dureeLbl.text = [NSString stringWithFormat:@"%2.f min",[errand duree]];
    
    if(hours != 0)
        dureeLbl.text = [NSString stringWithFormat:@"%dh %dmin", hours, min];
    
    else
        dureeLbl.text = [NSString stringWithFormat:@"%2.f min", [errand duree]];

    
    [cell.contentView addSubview:errandLbl];
    [cell.contentView addSubview:dureeLbl];

    cell.backgroundColor = [UIColor clearColor];
        
    }
    
    NSLog(@"%lu -- %@", indexPath.row, cell.textLabel.text);
    return cell;
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
