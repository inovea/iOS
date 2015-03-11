//
//  Circuit.h
//  Inovea
//
//  Created by Sébastien LOUIS on 11/03/2015.
//  Copyright (c) 2015 Inovea. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Circuit : NSObject
{
@private
long idd_;
Boolean state_;
NSMutableDictionary* containers_;
}

@property(nonatomic, assign)long idd;
@property(nonatomic, assign)Boolean state;
@property(nonatomic, strong)NSMutableDictionary* containers;



-(id)initCircuitWithId:(long) id andState:(Boolean) state andContainers:(NSMutableDictionary*)containers;

-(long) getId;
-(void) setId : (long) idd;
-(Boolean) isState;
-(void) setState:(Boolean)state;
-(NSMutableDictionary*) getContainers;
-(void) setContainers:(NSMutableDictionary *)containers;

@end
