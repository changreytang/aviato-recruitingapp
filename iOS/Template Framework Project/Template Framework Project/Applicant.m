//
//  Applicant.m
//  
//
//  Created by Tim Liew on 11/17/16.
//
//

#import "Applicant.h"

@implementation Applicant{
    NSString* name;
    NSString* email;
    NSString* address;
    NSString* phoneNum;
    NSString* rawInfo;
    NSArray* websites;
}

-(void)initApplicant:(NSString*)aName withEmail:(NSString*)aEmail withPhoneNum:(NSString*)aPhoneNum withAddress:(NSString*)aAddress withWebsites:aWebsites {
    [self setEmail:aEmail];
    [self setPhoneNumber:aPhoneNum];
    [self setAddress:aAddress];
    [self setName:aName];
    [self setWebsites:aWebsites];
    
}
-(NSString*)getName{
    return name;
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
-(void)setName:(NSString*)aName{
    name = aName;
}
-(NSData*)toJSON{
    NSError *error = nil;

    NSDictionary *nameInfo = @{@"firstName" : name, @"lastName" : name, @"suffixes" : @""};
    NSDictionary *names = @{@"name" : nameInfo};
    NSDictionary *website = @{@"websites" : websites};
    NSDictionary *phones = @{@"phones" : phoneNum};
    NSDictionary *emails = @{@"emails" : email};
    NSArray *jsonArray = @[names, website, phones, emails];
    NSDictionary *contact= @{@"contact" : jsonArray};
    
    NSData* jsonData = [NSJSONSerialization dataWithJSONObject:contact options:NSJSONWritingPrettyPrinted error:&error];
    return jsonData;
}

@end
