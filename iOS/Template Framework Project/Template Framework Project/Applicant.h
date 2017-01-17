//
//  Applicant.h
//  
//
//  Created by Tim Liew on 11/17/16.
//
//

#import <Foundation/Foundation.h>

@interface Applicant : NSObject

-(void)initApplicant:(NSString*)name withEmail:(NSString*)email withPhoneNum:(NSString*)phoneNum withAddress:(NSString*)address;
-(NSString*)getName;
-(NSString*)getPhoneNumber;
-(NSString*)getAddress;
-(NSString*)getEmail;
-(void)setEmail:(NSString*)email;
-(void)setPhoneNumber:(NSString*)phoneNum;
-(void)setAddress:(NSString*)address;
-(void)setName:(NSString*)name;
-(NSData*)toJSON;

@end

