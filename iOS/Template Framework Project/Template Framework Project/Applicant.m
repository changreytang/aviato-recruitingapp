//
//  Applicant.m
//  
//
//  Created by Tim Liew on 11/17/16.
//
//

#import "Applicant.h"

@implementation Applicant{
    NSString* fname;
    NSString* lname;
    NSString* email;
    NSString* address;
    NSString* phoneNum;
    NSString* rawInfo;
    NSArray* websites;
    NSString* myID;
}

-(void)initApplicant:(NSString*)aName withEmail:(NSString*)aEmail withPhoneNum:(NSString*)aPhoneNum withAddress:(NSString*)aAddress withWebsites:aWebsites {
    [self setEmail:aEmail];
    [self setPhoneNumber:aPhoneNum];
    [self setAddress:aAddress];
    //[self setName:aName];
    
    [self setWebsites:aWebsites];
    
}
-(NSString*)getFName{
    return fname;
}
-(NSString*)getLName{
    return lname;
}
-(NSString*)getPhoneNumber{
    return phoneNum;
}
-(NSString*)getAddress{
    return address;
}
-(NSArray*)getWebsites{
    return websites;
}
-(NSString*)getEmail{
    return email;
}
-(void)setEmail:(NSString*)aEmail{
    email = aEmail;
}
-(void)setPhoneNumber:(NSString*)aPhoneNum{
    phoneNum = aPhoneNum;
}
-(void)setAddress:(NSString*)aAddress{
    address = aAddress;
}
-(void)setWebsites:(NSArray*)aWebsite{
    websites = aWebsite;
}
-(void)setFName:(NSString*)aName{
    fname = aName;
}
-(void)setLName:(NSString*)aName{
    lname = aName;
}
-(void)setID:(NSString *)aID{
    myID = aID;
}
-(NSDictionary*)toJSON{
   // NSError *error = nil;

    NSDictionary *nameInfo = @{@"firstName" : fname, @"lastName" : lname, @"suffixes" : @""};
    NSDictionary *names = @{@"name" : nameInfo};
    //NSDictionary *website = @{@"websites" : websites};
    NSDictionary *phones = @{@"phones" : phoneNum};
    NSDictionary *emails = @{@"emails" : email};
    //NSArray *jsonArray = @[names, website, phones, emails];
    NSArray *jsonArray = @[names, phones, emails];

    NSString* contactKey = [NSString stringWithFormat:@"%@", myID];
    NSDictionary *contactDict= @{contactKey : jsonArray};
    //Workday's format: NSDictionary *contact= @{@"contact" : jsonArray};
    
    

    //NSData* jsonData = [NSJSONSerialization dataWithJSONObject:contact options:NSJSONWritingPrettyPrinted error:&error];
    return contactDict;
}

@end
