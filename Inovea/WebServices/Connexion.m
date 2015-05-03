//
//  Connexion.m
//  Inovea
//
//  Created by Sébastien LOUIS on 01/05/2015.
//  Copyright (c) 2015 Inovea. All rights reserved.
//

#import "Connexion.h"

@implementation Connexion

+ (Steed*) loginWithMail: (NSString*) mail andPassword: (NSString*) password{
    
    
    if([mail  isEqual: @"a"] && [password  isEqual: @"aa"])
    {
        Steed* steed = [Steed new];
        steed = [steed initSteedWithMail:mail andPassword:password andName:@"Dupont" andFirstname:@"Jean"];
        return steed;
    }
    
    return nil;
 
};

@end
