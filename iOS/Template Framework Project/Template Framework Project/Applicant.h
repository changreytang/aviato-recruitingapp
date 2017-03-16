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
-(NSString*)getFName;
-(NSString*)getLName;
-(NSString*)getPhoneNumber;
-(NSString*)getAddress;
-(NSString*)getEmail;
-(NSArray*)getWebsites;
-(UIImage*)getResume;

-(void)setEmail:(NSString*)email;
-(void)setPhoneNumber:(NSString*)phoneNum;
-(void)setAddress:(NSString*)address;
-(void)setFName:(NSString*)fname;
-(void)setLName:(NSString*)lname;
-(void)setWebsites:(NSArray*)aWebsite;
-(void)setID:(NSString*)aID;
-(void)setResume:(UIImage*)aResume;

-(NSDictionary*)toJSON;

@end

