//
//  TrajetsAttenteViewController.m
//  Inovea
//
//  Created by Sébastien LOUIS on 20/04/2015.
//  Copyright (c) 2015 Inovea. All rights reserved.
//

#import "TrajetsAttenteViewController.h"
#import "Circuit.h"
#import "Container.h"

@interface TrajetsAttenteViewController ()

@end

static NSString* const kHomeViewControllerCellIdentifier=@"SuperUniqueKey";

@implementation TrajetsAttenteViewController


@synthesize tabCircuits = tabCircuits_;


-(void) viewWillAppear:(BOOL)animated{
    
    [self.todayTableView reloadData];
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor clearColor];
    self.todayTableView.delegate = self;
    self.todayTableView.dataSource = self;
    
    
    
    self.todayDate = [NSDate date];
    self.dateFormatter = [[NSDateFormatter alloc] init];
    [self.dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm"];
    

    NSDate *now = [self.dateFormatter dateFromString:@"1994-04-28 20:50"];
       
    
    
    
    /* 
        Dictionnaire de conteneurs
    */
    
    NSMutableDictionary* tabContainers = [NSMutableDictionary new];
    [tabContainers setObject:[[Container alloc] initContainerWithId:0 andLat:@"25" andLng:@"35" andAddress:@"Houilles" andState:true andAlerts:[NSArray new]] forKey:@"0"];
    [tabContainers setObject:[[Container alloc] initContainerWithId:1 andLat:@"20" andLng:@"43" andAddress:@"Bezons" andState:true andAlerts:[NSArray new]] forKey:@"1"];
    [tabContainers setObject:[[Container alloc] initContainerWithId:2 andLat:@"21" andLng:@"5" andAddress:@"Sartrouville" andState:true andAlerts:[NSArray new]]forKey:@"2"];
    [tabContainers setObject:[[Container alloc] initContainerWithId:3 andLat:@"2" andLng:@"39" andAddress:@"Maisons-laffite" andState:true andAlerts:[NSArray new]]forKey:@"3"];
    [tabContainers setObject:[[Container alloc] initContainerWithId:4 andLat:@"6" andLng:@"0" andAddress:@"Aubergenville" andState:true andAlerts:[NSArray new]]forKey:@"4"];
        
    
    /*
        Tableau de circuits
    */
    
    self.tabCircuits = [NSMutableArray new];
    [self.tabCircuits addObject:[[Circuit alloc] initCircuitWithId:0 andState:true andContainers:tabContainers andDate:now]];
    [self.tabCircuits addObject:[[Circuit alloc] initCircuitWithId:1 andState:true andContainers:tabContainers andDate:now]];
    [self.tabCircuits addObject:[[Circuit alloc] initCircuitWithId:2 andState:true andContainers:tabContainers andDate:now]];
    [self.tabCircuits addObject:[[Circuit alloc] initCircuitWithId:3 andState:true andContainers:tabContainers andDate:self.todayDate]];
    

    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(NSInteger)tableView:(UITableView*)tableView numberOfRowsInSection:(NSInteger)section{
   NSLog(@"%lu", (unsigned long)[self.tabCircuits count]);
    return [self.tabCircuits count];
}

-(UITableViewCell *)tableView:(UITableView *)
tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:kHomeViewControllerCellIdentifier];
    
    
    if(cell==nil){
        cell= [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kHomeViewControllerCellIdentifier];
    }
    
//    NSArray* keys = [self.productList allKeys];
//    NSLog(@"%lu -- %@",indexPath.row, [keys objectAtIndex:indexPath.row]);
//
    
    
    NSDateFormatter* tableViewDateFormatter = [NSDateFormatter new];
   
    //  [dateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss.SSS"];
      [tableViewDateFormatter setDateFormat:@"HH:mm"];

    NSString *circuitDate =[tableViewDateFormatter stringFromDate:[[self.tabCircuits objectAtIndex:indexPath.row] date]];
    
    
    cell.textLabel.text = [NSString stringWithFormat:@"%@   Trajet : %ld", circuitDate, [[self.tabCircuits objectAtIndex:indexPath.row] idd]];
    
    NSLog(@"%ld", [[self.tabCircuits objectAtIndex:indexPath.row] idd]);
    
    
    cell.backgroundColor = [UIColor clearColor];
    
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
