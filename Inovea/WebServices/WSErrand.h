//
//  WSErrand.h
//  Inovea
//
//  Created by Sébastien LOUIS on 05/05/2015.
//  Copyright (c) 2015 Inovea. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Errand.h"

@interface WSErrand : NSObject

+(NSMutableArray*) getErrandsWithCourierId:(int) idd;
+(Errand*) getErrandWithId:(int) idd;
+(Boolean) finishErrand:(Errand*) errand;
@end
