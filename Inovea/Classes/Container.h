//
//  Container.h
//  Inovea
//
//  Created by Sébastien LOUIS on 10/03/2015.
//  Copyright (c) 2015 Inovea. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Container : NSObject
{
@private
    int idd_;
    NSString* name_;
    double lat_;
    double lng_;
    NSString* address_;
    int state_;
    NSDate* lastCollect_;
    int idErrand_;
}

@property (nonatomic,assign)int idd;
@property (nonatomic, strong) NSString* name;
@property (nonatomic,assign)double lat;
@property (nonatomic,assign)double lng;
@property (nonatomic, strong) NSString* address;
@property (nonatomic,assign)int state;
@property (nonatomic, strong) NSDate* lastCollect;
@property (nonatomic,assign)int idErrand;

-(id)initContainerWithId :(int)idd andName:(NSString*)name andLat:(double)lat andLng: (double)lng andState: (int)state andLastCollect:(NSDate*)lastCollect andAddress: (NSString*)address andIdErrand:(int)idErrand;

//
//-(long) getId;
//-(void) setIdd:(long)idd;
//
//-(NSString*) getLat;
//-(void) setLat:(NSString*)lat;
//
//-(NSString*) getLng;
//-(void) setLng:(NSString *)lng;
//
//-(NSString*) getAddress;
//-(void) setAddress:(NSString*)address;
//
//-(Boolean) isState;
//-(void) setState:(Boolean)state;
//
//-(NSArray*) getAlerts;
//-(void) setAlerts:(NSArray *)alerts;
//
@end
