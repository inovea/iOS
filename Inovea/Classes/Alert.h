//
//  Alert.h
//  Inovea
//
//  Created by Sébastien LOUIS on 10/03/2015.
//  Copyright (c) 2015 Inovea. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Alert : NSObject
{
@private
long idd_;
Boolean state_;
NSString* description_;
}

@property(nonatomic, assign)long idd;
@property(nonatomic, assign)Boolean state;
@property(nonatomic, strong)NSString* description;
    
-(id) initAlertWithId:(long) idd andState:(Boolean)state andDescription:(NSString*) description;

-(long) getId;

-(void)setId:(long) idd;

-(Boolean) isState;

-(void) setState:(Boolean)state;
    
-(NSString*)getDescription;
    
-(void) setDescription:(NSString*) description;

@end
