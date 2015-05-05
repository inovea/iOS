//
//  Connexion.m
//  Inovea
//
//  Created by Sébastien LOUIS on 01/05/2015.
//  Copyright (c) 2015 Inovea. All rights reserved.
//

#import "Connexion.h"
#import "WebService.h"
@implementation Connexion





+ (Steed*) loginWithMail: (NSString*) mail andPassword: (NSString*) password{
    
    
/* 
    Appel WebService
*/
    
   

    NSString* url = [NSString stringWithFormat:@"http://inovea.herobo.com/webhost/courier.php?tag=login&mail=%@&password=%@", mail, password];
    
    NSMutableDictionary* result = [WebService getResultWithUrl:url];
    
    if (result!=nil)
    {
          if([[result valueForKey:@"error"] isEqualToString:@"0"])
          {
              NSLog(@"Connexion réussi");
              Steed* steed = [Steed new];
              steed.idd =(int)[[result objectForKey:@"user"] valueForKey:@"idCourier"];
              steed.name =[[result objectForKey:@"user"] valueForKey:@"name"];
              steed.firstname =[[result objectForKey:@"user"] valueForKey:@"firstname"];
              steed.mail =[[result objectForKey:@"user"] valueForKey:@"mail"];
              return steed;

          }
          else
              NSLog(@"%@", [result objectForKey:@"error_msg"]);
    }
    
    
    else
        NSLog(@"WebService error");
    
    return nil;
 
};

@end
