//
//  WSContainer.m
//  Inovea
//
//  Created by Sébastien LOUIS on 29/05/2015.
//  Copyright (c) 2015 Inovea. All rights reserved.
//

#import "WSContainer.h"
#import "WebService.h"
#import "Container.h"

@implementation WSContainer

+(NSMutableArray*)getContainersByErrandId:(int)idd{
    
    
     NSMutableArray* containers = [NSMutableArray new];
    
    NSDateFormatter* dateFormatter = [NSDateFormatter new];
    
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    
    NSString* url = [NSString stringWithFormat:@"http://inovea.herobo.com/webhost/container.php?tag=getByErrand&idErrand=%d", idd];
    
    NSMutableDictionary* result = [WebService getResultWithUrl:url];
    
    
    if (result!=nil)
    {
        
        
        if([[result valueForKey:@"error"] isEqualToString:@"0"])
        {
            for(NSObject* obj in [result objectForKey:@"container"]){
                
                Container* container = [Container new];
                
            container = [container initContainerWithId:[[obj valueForKey:@"idContainer"] intValue]
                                                andName:[obj valueForKey:@"name"]
                                                andLat:[[obj valueForKey:@"lat"] doubleValue]
                                                andLng:[[obj valueForKey:@"lng"] doubleValue]
                                                andState:[[obj valueForKey:@"state"] intValue]
                                                andLastCollect:[dateFormatter dateFromString:[obj valueForKey:@"lastCollect"]]
                                                andAddress:[obj valueForKey:@"address"]
                                                andIdErrand:[[obj valueForKey:@"Errand_idErrand"] intValue]];
                
                
                [containers addObject:container];
            }
            return containers;
            
        }
        else
            NSLog(@"%@", [result objectForKey:@"msg"]);
    }
    
    
    else
        NSLog(@"ErrandById WebService error");
    
    return nil;

}
@end
