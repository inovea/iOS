//
//  ContainersListViewController.m
//  Inovea
//
//  Created by Sébastien LOUIS on 09/05/2015.
//  Copyright (c) 2015 Inovea. All rights reserved.
//

#import "ContainersListViewController.h"
#import "Container.h"

@interface ContainersListViewController ()

@end

static NSString* const kHomeViewControllerCellIdentifier=@"SuperUniqueKey";

@implementation ContainersListViewController

@synthesize errand = errand_;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor clearColor];
    self.containersTableView.delegate = self;
    self.containersTableView.dataSource = self;
    self.idErrandLbl.text = [NSString stringWithFormat:@" %d",[self.errand idd]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)tableView:(UITableView*)tableView numberOfRowsInSection:(NSInteger)section{
    return [[self.errand containers] count];
}

-(UITableViewCell *)tableView:(UITableView *)
tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSMutableArray* containersList = [self.errand containers];
    Container* container  = [Container new];
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:kHomeViewControllerCellIdentifier];
    
    
  
    container = [containersList objectAtIndex:indexPath.row];
    
    
    if(cell==nil){
        cell= [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kHomeViewControllerCellIdentifier];
        
        
        UILabel* containerLbl = [[UILabel alloc]initWithFrame:CGRectMake(20, 22, 140, 20)];
        containerLbl.text = [NSString stringWithFormat:@"Conteneur n°%d", [container idd]];
        containerLbl.textColor = [UIColor colorWithRed:255/255. green:255/255. blue:255/255. alpha:1];
        [cell.contentView addSubview:containerLbl];
        
        cell.backgroundColor = [UIColor clearColor];
        
    }
    
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
