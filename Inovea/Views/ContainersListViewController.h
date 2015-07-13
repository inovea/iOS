//
//  ContainersListViewController.h
//  Inovea
//
//  Created by Sébastien LOUIS on 09/05/2015.
//  Copyright (c) 2015 Inovea. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Errand.h"
#import "Steed.h"
#import "Container.h"
#import "MBProgressHUD.h"

@interface ContainersListViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, MBProgressHUDDelegate>
{
@private
    MBProgressHUD* hud_;
    Errand* errand_;
    Steed* steed_;
    int selectedContaineur_;
    NSMutableArray* buttons_;
    Container* containerToUpdate_;
}
@property (nonatomic, strong) MBProgressHUD* hud;
@property (nonatomic, strong) Errand* errand;
@property (nonatomic, strong) Steed* steed;
@property (nonatomic, strong) Container* containerToUpdate;
@property(nonatomic, assign)int selectedContaineur;
@property (nonatomic, strong)NSMutableArray* buttons;
@property (weak, nonatomic) IBOutlet UITableView *containersTableView;
@property (weak, nonatomic) IBOutlet UILabel *idErrandLbl;
@property (weak, nonatomic) IBOutlet UIButton *problemBtn;




@end
