//
//  Circuit.m
//  Inovea
//
//  Created by Sébastien LOUIS on 11/03/2015.
//  Copyright (c) 2015 Inovea. All rights reserved.
//

#import "Circuit.h"

@implementation Circuit

@synthesize idd =idd_;
@synthesize state = state_;
@synthesize  containers = containers_;


-(id)initCircuitWithId:(long)idd andState:(Boolean)state andContainers:(NSMutableDictionary*)containers andDate:(NSDate *)date{
    
self = [super init];
self.idd = idd;
self.state = state;
self.containers = containers;
    self.date = date;
    
return self;
}
//
//-(long) getId{
//    return self.idd;
//}
//
//-(void) setId:(long)idd{
//    self.idd = idd;
//}
//
//-(Boolean) isState{
//    return self.state;
//}
//
//-(void) setState:(Boolean)state{
//    self.state = state;
//}
//
//-(NSMutableDictionary*) getContainers{
//    return self.containers;
//}
//
//-(void) setContainers:(NSMutableDictionary *)containers{
//    self.containers = containers;
//}
@end
