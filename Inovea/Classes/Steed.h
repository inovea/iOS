//
//  Steed.h
//  Inovea
//
//  Created by Sébastien LOUIS on 12/03/2015.
//  Copyright (c) 2015 Inovea. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Steed : NSObject
{
    
    @private
    int idd_;
    NSString* mail_;
    NSString* password_;
    NSString* name_;
    NSString* firstname_;
    NSMutableDictionary* circuits_;
}

@property(nonatomic, assign)int idd;
@property(nonatomic, strong)NSString* name;
@property(nonatomic, strong)NSString* firstname;
@property(nonatomic, strong)NSString* mail;
@property(nonatomic, strong)NSString* password;
@property(nonatomic, strong)NSMutableDictionary* circuits;



-(id) initSteedWithId:(int)idd andMail:(NSString*)mail andName:(NSString*)name andFirstname:(NSString*)firstname;

//
//-(long) getId;
//-(void) setIdd:(long)idd;
//-(NSString*) getMail;
//-(void) setMail:(NSString *)mail;
//-(NSString*) getPassword;
//-(void) setPassword:(NSString *)password;
//-(NSString*) getName;
//-(void) setName:(NSString *)name;
//-(NSString*) getFirstname;
//-(void) setFirstname:(NSString *)firstname;

@end
