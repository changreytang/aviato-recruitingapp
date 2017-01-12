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
}

-(void)initApplicant:(NSString*)aName withEmail:(NSString*)aEmail withPhoneNum:(NSString*)aPhoneNum withAddress:(NSString*)aAddress {
    [self setEmail:aEmail];
    [self setPhoneNumber:aPhoneNum];
    [self setAddress:aAddress];
    [self setName:aName];
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
-(void)setName:(NSString*)aName{
    name = aName;
}
-(NSData*)toJSON{
    
    NSDictionary *gradedetails = @{@"studentresult" : @"pass", @"marksheet" : @"provided"};
    NSDictionary *grade = @{ @"Grade1" : gradedetails}
    NSDictionary *contactInfo = @{@"firstName" : name, @"lastName" : name, @"Student1" : @"Name"};
    NSArray *resultsArray = @[grade, sdetails];
    NSDictionary *results= @{@"results" : resultsArray};
    NSDictionary *stud = @{@"Students" : results};
    
    NSData *jsondata = [NSJSONSerialization dataWithJSONObject:stud options:NSJSONWritingPrettyPrinted error:&error];
}

@end
