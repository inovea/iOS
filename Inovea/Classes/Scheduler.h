//
//  Scheduler.h
//  Inovea
//
//  Created by Sébastien LOUIS on 12/03/2015.
//  Copyright (c) 2015 Inovea. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Steed.h"

@interface Scheduler : Steed

-(id)initSchedulerWithMail:(NSString*)mail andPassword:(NSString*)password andName:(NSString*)name andFirstname:(NSString*)firstname;

@end