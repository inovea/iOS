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
#import "DetailsViewController.h"
#import "MBProgressHUD.h"

@interface TrajetsAttenteViewController ()

@end

static NSString* const kHomeViewControllerCellIdentifier=@"SuperUniqueKey";

@implementation TrajetsAttenteViewController


@synthesize tabErrands = tabErrands_;
@synthesize todayErrands = todayErrands_;
@synthesize otherErrands = otherErrands_;
@synthesize steed = steed_;



-(void) viewWillAppear:(BOOL)animated{
    
    MBProgressHUD *hud =[MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.mode = MBProgressHUDModeAnnularDeterminate;
    hud.labelText = @"Chargement";
    
    
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
    self.tabErrands = [WSErrand getErrandsWithCourierId:self.steed.idd];
    
    self.todayErrands = [NSMutableArray new];
    self.otherErrands = [NSMutableArray new];
    
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    for(Errand* errand in self.tabErrands)
    {
        NSDateComponents* componentsForFirstDate = [calendar components:NSCalendarUnitDay|NSCalendarUnitMonth|NSCalendarUnitYear fromDate:[errand dateDebut]];
        NSDateComponents* componentsForSecondDate = [calendar components:NSCalendarUnitDay|NSCalendarUnitMonth|NSCalendarUnitYear fromDate:[NSDate date]];
        
        
        if ([componentsForFirstDate day] == [componentsForSecondDate day] && [componentsForFirstDate month] == [componentsForSecondDate month] && [componentsForFirstDate year] == [componentsForSecondDate year] && [errand state] != 2)
        {
            
            [self.todayErrands addObject:errand];
            
        }
        else if([[errand dateDebut] compare:[NSDate date]] == NSOrderedDescending && [errand state] != 2)
        {
            [self.otherErrands addObject:errand];
        }
        
        NSLog(@"today : %lu   others : %lu", (unsigned long)[self.todayErrands count], (unsigned long)[self.otherErrands count]);
        
    }
  

    self.todayErrands = [self sortErrandsByAscendingTime:self.todayErrands];

    
    if([self.todayErrands count] == 0){
        [self.noTodayErrandsLbl setHidden:false];
           }
    
    if([self.otherErrands count] == 0)
        [self.noFuturErrandsLbl setHidden:false];
    
        [self.todayTableView reloadData];
    
    [hud hide:YES];
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    
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
    NSDate* todayDate = [NSDate new];
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

   
        
        UILabel* dateLbl = [[UILabel alloc]initWithFrame:CGRectMake(20, 22, 140, 20)];
        dateLbl.text = [NSString stringWithFormat:@"%@", circuitDate];
        
        //Add color for today errands
        if(tableView == self.todayTableView){
            
            if([[errand dateDebut] compare:todayDate] == NSOrderedDescending)
            {
                NSCalendar *calendar = [NSCalendar currentCalendar];
                NSDateComponents *componentsDateDebut = [calendar components:(NSCalendarUnitHour | NSCalendarUnitMinute) fromDate:[errand dateDebut]];
                NSDateComponents *componentsDateToday = [calendar components:(NSCalendarUnitHour | NSCalendarUnitMinute) fromDate:todayDate];
            
            
                int time = ([componentsDateDebut hour]*60 + [componentsDateDebut minute]) - ([componentsDateToday hour]*60 + [componentsDateToday minute]);
                //If errand start time is in the next hour
                if(time < 60)
                    dateLbl.textColor = [UIColor colorWithRed:255/255. green:153/255. blue:51/255. alpha:1];
            
                else
                    dateLbl.textColor = [UIColor colorWithRed:255/255. green:255/255. blue:255  /255. alpha:1];
                
            }
        
            else
                dateLbl.textColor = [UIColor colorWithRed:255/255. green:0/255. blue:0/255. alpha:1];
        }
        
        else{
            dateLbl.textColor = [UIColor colorWithRed:255/255. green:255/255. blue:255/255. alpha:1];
        }
    UILabel* errandLbl = [[UILabel alloc]initWithFrame:CGRectMake(80, 22, 140, 20)];
    errandLbl.text = [NSString stringWithFormat:@"Trajet n°%d", [errand idd]];
    errandLbl.textColor = [UIColor colorWithRed:255/255. green:255/255. blue:255/255. alpha:1];
    
    
    UILabel* dureeLbl = [[UILabel alloc]initWithFrame:CGRectMake(245, 22, 140, 20)];
    dureeLbl.textColor = [UIColor colorWithRed:255/255. green:255/255. blue:255/255. alpha:1];
    dureeLbl.text = [NSString stringWithFormat:@"%2.f min",[errand duree]];
    
    if(hours != 0)
        dureeLbl.text = [NSString stringWithFormat:@"%dh %dmin", hours, min];
    
    else
        dureeLbl.text = [NSString stringWithFormat:@"%2.f min", [errand duree]];

    [cell.contentView addSubview:dateLbl];
    [cell.contentView addSubview:errandLbl];
    [cell.contentView addSubview:dureeLbl];

    cell.backgroundColor = [UIColor clearColor];
        
    }

    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    if(tableView == self.todayTableView)
    {
        Errand* selectedErrand = [self.todayErrands objectAtIndex:indexPath.row];
        DetailsViewController* detailsViewController = [DetailsViewController new];
        
        detailsViewController.errand = selectedErrand;
        [self.navigationController pushViewController:detailsViewController animated:NO];
    }
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(NSMutableArray*) sortErrandsByAscendingTime:(NSMutableArray*)array{
    
    
    NSLog(@"%d ---- :) ", [array count]);
    if([array count] > 1)
    {
       
        int i, min, j;
        Errand* tmpErrand;
        
        for (i =0; i < [array count]-1; i++){
            min = i;
                for(j = i+1; j < [array count] ; j++)
                    if([[array[j] dateDebut] compare: [array[min] dateDebut]] == NSOrderedAscending)
                        min = j;
                
                
                    if(min != i){
                        tmpErrand = array[i];
                        array[i] = array[min];
                        array[min] = tmpErrand;
                    }
                
        }
        
        
    }
    
    else if([array count] == 0)
        NSLog(@"Impossible de trier un tableau vide");
    
      return array;
    
}

@end
