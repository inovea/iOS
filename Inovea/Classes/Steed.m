//
//  Steed.m
//  Inovea
//
//  Created by Sébastien LOUIS on 12/03/2015.
//  Copyright (c) 2015 Inovea. All rights reserved.
//

#import "Steed.h"

@implementation Steed


@synthesize idd = idd_;
@synthesize name = name_;
@synthesize firstname = firstname_;
@synthesize mail = mail_;
@synthesize password = password_;
@synthesize circuits = circuits_;

-(id) initSteedWithMail:(NSString*)mail andPassword:(NSString*)password andName:(NSString*)name andFirstname:(NSString*)firstname{

    self = [super init];
    self.mail = mail;
    self.password = password;
    self.name = name;
    self.firstname = firstname;
    return self;
}
//
//
//-(long) getId{
//    return self.idd;
//}
//
//-(void) setIdd:(long)idd{
//    self.idd = idd;
//}
//
//-(NSString*) getMail{
//    return self.mail;
//}
//
//-(void) setMail:(NSString *)mail{
//    self.mail = mail;
//}
//
//-(NSString*) getPassword{
//    return self.password;
//}
//
//-(void) setPassword:(NSString *)password{
//    self.password = password;
//}
//
//-(NSString*) getName{
//    return self.name;
//}
//
//-(void) setName:(NSString *)name{
//    self.name = name;
//}
//
//-(NSString*) getFirstname{
//    return self.firstname;
//}
//
//-(void) setFirstname:(NSString *)firstname{
//    self.firstname = firstname;
//}
//

@end
