
//

//  ProblemeViewController.h

//  Inovea

//

//  Created by Sébastien LOUIS on 21/06/2015.

//  Copyright (c) 2015 Inovea. All rights reserved.

//



#import <UIKit/UIKit.h>

#import "Container.h"
#import "Steed.h"
#import "MBProgressHUD.h"



@interface ProblemViewController :  UIViewController <UITextViewDelegate>

{
    
@private
    
    Container* selectedContainer_;
    UILabel* charlbl_;
    Steed* steed_;
    UITextView* commentary_;
}



@property (nonatomic, strong)Steed* steed;
@property (nonatomic, strong)Container* selectedContainer;
@property (nonatomic, strong)UILabel* charlbl;
@property (nonatomic, strong)UITextView* commentary;


@property (weak, nonatomic) IBOutlet UIButton *sendButton;




@end

