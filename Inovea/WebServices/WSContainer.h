//
//  WSContainer.h
//  Inovea
//
//  Created by Sébastien LOUIS on 29/05/2015.
//  Copyright (c) 2015 Inovea. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Container.h"
@interface WSContainer : NSObject

+(NSMutableArray*)getContainersByErrandId:(int)idd;
+(BOOL)changeContainerStateWithContainer:(Container*)container andState:(int)state;

@end
