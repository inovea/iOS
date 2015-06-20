//
//  Errand.h
//  Inovea
//
//  Created by Sébastien LOUIS on 11/03/2015.
//  Copyright (c) 2015 Inovea. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Errand : NSObject
{
@private
int idd_;
int state_;
NSDate* dateDebut_;
NSDate* dateFin_;
double duree_;
double distance_;
NSMutableArray* containers_;
int iddCourier_;
}

@property(nonatomic, assign)int idd;
@property(nonatomic, assign)int state;
@property(nonatomic, assign)double duree;
@property(nonatomic, assign)double distance;
@property(nonatomic, strong)NSDate* dateDebut;
@property(nonatomic, strong)NSDate* dateFin;
@property(nonatomic, strong)NSMutableArray* containers;
@property(nonatomic, assign)int iddCourier;



-(Errand*)initErrandWithId:(int)idd andState:(int)state andDateDebut:(NSDate*)dateDebut andDateFin:(NSDate*)dateFin andDistance:(double)distance andDuree:(double)duree andIddCourier:(int)iddCourier;

//
//-(long) getId;
//-(void) setId : (long) idd;
//-(Boolean) isState;
//-(void) setState:(Boolean)state;
//-(NSMutableDictionary*) getContainers;
//-(void) setContainers:(NSMutableDictionary *)containers;

@end
