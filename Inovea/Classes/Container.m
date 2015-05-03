//
//  Container.m
//  Inovea
//
//  Created by Sébastien LOUIS on 10/03/2015.
//  Copyright (c) 2015 Inovea. All rights reserved.
//

#import "Container.h"

@implementation Container

@synthesize idd = idd_;
@synthesize lat = lat_;
@synthesize lng = lng_;
@synthesize address = address_;
@synthesize state = state_;
@synthesize alerts = alerts_;


-(id)initContainerWithId :(long)idd andLat:(NSString*)lat andLng: (NSString*)lng andAddress: (NSString*)address andState: (Boolean)state andAlerts:(NSArray*)alerts{
    self = [super init];
    self.idd = idd;
    self.lat = lat;
    self.lng = lng;
    self.address = address;
    self.state = state;
    self.alerts = alerts;
    return self;
}
//
//
//-(long) getId{
//    return self.idd;
//}
//
//-(void) setIdd:(long)idd{
//    self.idd = idd;
//}
//
//-(NSString*) getLat{
//    return self.lat;
//}
//
//-(void) setLat:(NSString*)lat{
//    self.lat = lat;
//}
//
//-(NSString*) getLng{
//    return self.lng;
//}
//
//-(void) setLng:(NSString *)lng{
//    self.lng = lng;
//}
//
//-(NSString*) getAddress{
//    return self.address;
//}
//
//-(void) setAddress:(NSString*)address{
//    self.address = address;
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
//-(NSArray*) getAlerts{
//    return self.alerts;
//}
//
//-(void) setAlerts:(NSArray *)alerts{
//    self.alerts = alerts;
//}

@end


