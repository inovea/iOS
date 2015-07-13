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

+(NSMutableArray*) getErrandsWithCourierId:(int) idd{
    
    
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
                                        andDateFin:[dateFormatter dateFromString:[obj valueForKey:@"dateFin"]]
                                        andDistance:[[obj valueForKey:@"distance"] doubleValue]
                                         andDuree:[[obj valueForKey:@"duree"] doubleValue]
                                        andIddCourier:[[obj valueForKey:@"Courier_idCourier"] intValue]
                        ];
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

+(Errand*) getErrandWithId:(int) idd{
    
    
    NSString* url = [NSString stringWithFormat:@"http://inovea.herobo.com/webhost/errand.php?tag=getById&idErrand=%d", idd];
    
    NSMutableDictionary* result = [WebService getResultWithUrl:url];
    
    
    NSDateFormatter* dateFormatter = [NSDateFormatter new];
    
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    
    
    if (result!=nil)
    {
        Errand* errand = [Errand new];
        
        if([[result valueForKey:@"error"] isEqualToString:@"0"])
        {
                errand = [errand initErrandWithId:
                          [[[result objectForKey:@"errand"] valueForKey:@"idErrand"] intValue]
                                         andState:[[[result objectForKey:@"errand"] valueForKey:@"state"] intValue]
                                     andDateDebut:[dateFormatter dateFromString:[[result objectForKey:@"errand"]  valueForKey:@"dateDebut"]]
                                     andDateFin:[dateFormatter dateFromString:[[result objectForKey:@"errand"]  valueForKey:@"dateFin"]]
                                      andDistance:[[[result objectForKey:@"errand"] valueForKey:@"distance"] doubleValue]
                                         andDuree:[[[result objectForKey:@"errand"] valueForKey:@"duree"] doubleValue]
                                        andIddCourier:[[[result objectForKey:@"errand"] valueForKey:@"idCourier"] intValue]];
        
            return errand;
            
        }
        else
            NSLog(@"%@", [result objectForKey:@"msg"]);
    }
    
    
    else
        NSLog(@"ErrandById WebService error");
    
    return nil;
}


+(Boolean) updateErrand:(Errand*) errand withState: (int)state{
    
    NSDate* date = [NSDate new];
    
    NSDateFormatter* dateFormatter = [NSDateFormatter new];
    [dateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm"];
    
    NSString* dateFinStr = [dateFormatter stringFromDate:date];
    NSString* dateDebutStr = [dateFormatter stringFromDate:[errand dateDebut]];
    
    NSString* url = [NSString stringWithFormat:@"http://inovea.herobo.com/webhost/errand.php?tag=update&idErrand=%d&state=%d&dateDebut=%@&dateFin=%@&duree=%lf&distance=%lf&idCourier=%d", [errand idd], state, dateDebutStr, dateFinStr, [errand duree], [errand distance], [errand iddCourier]];
    
    NSLog(@"url : %@", url);
    
    NSMutableDictionary* result = [WebService getResultWithUrl:url];
    
    if(result!=nil && [[result valueForKey:@"error"] isEqualToString:@"0"])
        return true;
    else
        return false;
}
@end
