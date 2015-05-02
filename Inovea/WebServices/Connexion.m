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
    
    NSString* name = @"Jean";
    NSString* firstname = @"Dupont";
    
    Steed* steed = [Steed initSteedWithMail:mail andPassword:password andName:name andFirstname:firstname];
    return steed;
 
};

@end
