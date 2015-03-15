//
//  HomeViewController.h
//  Inovea
//
//  Created by Sébastien LOUIS on 14/03/2015.
//  Copyright (c) 2015 Inovea. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeViewController : UIViewController <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *tbpseudo;
@property (weak, nonatomic) IBOutlet UITextField *tbmdp;
@end
