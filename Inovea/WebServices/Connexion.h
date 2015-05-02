//
//  Connexion.h
//  Inovea
//
//  Created by Sébastien LOUIS on 01/05/2015.
//  Copyright (c) 2015 Inovea. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Steed.h"

@interface Connexion : NSObject
+ (Steed*) loginWithMail: (NSString*)mail andPassword: (NSString*)password;
@end
