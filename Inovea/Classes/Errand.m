//
//  Errand.m
//  Inovea
//
//  Created by Sébastien LOUIS on 11/03/2015.
//  Copyright (c) 2015 Inovea. All rights reserved.
//

#import "Errand.h"

@implementation Errand

@synthesize idd =idd_;
@synthesize state = state_;
@synthesize containers = containers_;
@synthesize dateDebut = dateDebut_;
@synthesize dateFin = dateFin_;
@synthesize duree = duree_;
@synthesize distance = distance_;
@synthesize iddCourier = iddCourier_;

-(Errand*)initErrandWithId:(int)idd andState:(int)state andDateDebut:(NSDate*)dateDebut andDateFin:(NSDate*)dateFin andDistance:(double)distance andDuree:(double)duree andIddCourier:(int)iddCourier{
self = [super init];
self.idd = idd;
self.state = state;
self.dateDebut = dateDebut;
if(dateFin != nil)
    self.dateFin = dateFin;
self.duree = duree;
self.distance = distance;
self.iddCourier = iddCourier;
    
return self;
}
@end
