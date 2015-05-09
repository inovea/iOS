//
//  WSErrand.m
//  Inovea
//
//  Created by Sébastien LOUIS on 05/05/2015.
//  Copyright (c) 2015 Inovea. All rights reserved.
//

#import "WSErrand.h"
#import "WebService.h"
#import "Errand.h"

@implementation WSErrand

+(NSMutableArray*) getErrandsWithId:(int) idd{
    
    
    NSMutableArray* userErrands = [NSMutableArray new];
    
   
    
    NSString* url = [NSString stringWithFormat:@"http://inovea.herobo.com/webhost/errand.php?tag=getByCourier&idCourier=%d", idd];
    
    NSMutableDictionary* result = [WebService getResultWithUrl:url];
    
    
    NSDateFormatter* dateFormatter = [NSDateFormatter new];
    
          [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    
    
    if (result!=nil)
    {
        if([[result valueForKey:@"error"] isEqualToString:@"0"])
        {
            
            for(NSObject* obj in [result objectForKey:@"errand"]){
                NSLog(@"obj=%@", obj);
             Errand* errand = [Errand new];
                
            
                errand = [errand initErrandWithId:
                                        [[obj valueForKey:@"idErrand"] intValue]
                                        andState:[[obj valueForKey:@"state"] intValue]
                                        andDateDebut:[dateFormatter dateFromString:[obj valueForKey:@"dateDebut"]]
                                        andDistance:[[obj valueForKey:@"distance"] doubleValue]
                                         andDuree:[[obj valueForKey:@"duree"] doubleValue]];
                [userErrands addObject:errand];
                
            }
            
            
            for(Errand* obj in userErrands){
                NSLog(@"id -> %d",obj.idd);
            }
            return userErrands;
            
        }
        else
            NSLog(@"%@", [result objectForKey:@"msg"]);
    }
    
    
    else
        NSLog(@"ErrandById WebService error");
    
    return nil;
}
@end
