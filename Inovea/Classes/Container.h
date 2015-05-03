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
    long idd_;
    NSString* lat_;
    NSString* lng_;
    NSString* address_;
    Boolean state_;
    NSArray* alerts_;
}

@property (nonatomic,assign)long idd;
@property (nonatomic, strong) NSString* lat;
@property (nonatomic, strong) NSString* lng;
@property (nonatomic, strong) NSString* address;
@property (nonatomic,assign)Boolean state;
@property (nonatomic, strong) NSArray* alerts;

-(id)initContainerWithId :(long)idd andLat:(NSString*)lat andLng: (NSString*)lng andAddress: (NSString*)address andState: (Boolean)state andAlerts:(NSArray*)alerts;
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
