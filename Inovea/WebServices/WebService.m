//
//  WebService.m
//  Inovea
//
//  Created by Sébastien LOUIS on 05/05/2015.
//  Copyright (c) 2015 Inovea. All rights reserved.
//

#import "WebService.h"

@implementation WebService

+(NSMutableDictionary*) getResultWithUrl:(NSString*)url{


NSURL* URL = [NSURL URLWithString:url];
NSURLRequest* request = [NSURLRequest requestWithURL:URL];
NSError* error = nil;
NSData* data = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:&error];
NSString *jsonString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:@"\\s+<!--.*$"
                                                                       options:NSRegularExpressionDotMatchesLineSeparators
                                                                         error:nil];
NSTextCheckingResult *result = [regex firstMatchInString:jsonString
                                                 options:0
                                                   range:NSMakeRange(0, jsonString.length)];
if(result) {
    NSRange range = [result rangeAtIndex:0];
    jsonString = [jsonString stringByReplacingCharactersInRange:range withString:@""];
}

NSData *objectData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];

NSMutableDictionary* jsonDict = [NSJSONSerialization JSONObjectWithData:objectData options:0 error:&error];
  
    
    if (!error)
    {
        return jsonDict;
    }
    
    
    else
        return nil;
    
    
}


@end
