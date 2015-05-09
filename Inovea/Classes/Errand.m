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

-(Errand*)initErrandWithId:(int)idd andState:(int)state andDateDebut:(NSDate*)dateDebut andDistance:(double)distance andDuree:(double)duree{
self = [super init];
self.idd = idd;
self.state = state;
self.dateDebut = dateDebut;
self.duree = duree;
self.distance = distance;
    
return self;
}
@end
