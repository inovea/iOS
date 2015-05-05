//
//  WebService.h
//  Inovea
//
//  Created by Sébastien LOUIS on 05/05/2015.
//  Copyright (c) 2015 Inovea. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WebService : NSObject

+(NSMutableDictionary*) getResultWithUrl:(NSString*)url;
@end
