//
//  ProblemeViewController.h
//  Inovea
//
//  Created by Sébastien LOUIS on 21/06/2015.
//  Copyright (c) 2015 Inovea. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Container.h"

@interface ProblemeViewController :  UIViewController
{
@private
    Container* selectedContainer_;
}

@property (nonatomic, strong)Container* selectedContainer;


@end
