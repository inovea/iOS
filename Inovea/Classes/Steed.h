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
    long idd_;
    NSString* mail_;
    NSString* password_;
    NSString* name_;
    NSString* firstname_;
    NSMutableDictionary* circuits_;
}

@property(nonatomic, assign)long idd;
@property(nonatomic, strong)NSString* mail;
@property(nonatomic, strong)NSString* password;
@property(nonatomic, strong)NSString* name;
@property(nonatomic, strong)NSString* firstname;
@property(nonatomic, strong)NSMutableDictionary* circuits;



-(id) initSteedWithMail:(NSString*)mail andPassword:(NSString*)password andName:(NSString*)name andFirstname:(NSString*)firstname;
-(long) getId;
-(void) setIdd:(long)idd;
-(NSString*) getMail;
-(void) setMail:(NSString *)mail;
-(NSString*) getPassword;
-(void) setPassword:(NSString *)password;
-(NSString*) getName;
-(void) setName:(NSString *)name;
-(NSString*) getFirstname;
-(void) setFirstname:(NSString *)firstname;

@end
