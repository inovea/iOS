//
//  Alert.m
//  Inovea
//
//  Created by Sébastien LOUIS on 10/03/2015.
//  Copyright (c) 2015 Inovea. All rights reserved.
//

#import "Alert.h"

@implementation Alert

@synthesize idd = idd_;
@synthesize state = state_;
@synthesize description = description_;

-(id) initAlertWithId:(long) idd andState:(Boolean)state andDescription:(NSString*) description{
    self = [super init];
    self.idd = idd;
    self.state = state;
    self.description = description;
}

-(long) getId{
    return self.idd;
}

-(void)setId:(long) idd{
    self.idd = idd;
}

-(Boolean) isState{
    return self.state;
}

-(void) setState:(Boolean)state{
    self.state = state;
}

-(NSString*)getDescription{
    return self.description;
}

-(void) setDescription:(NSString*) description{
    self.description = description;
}

@end
