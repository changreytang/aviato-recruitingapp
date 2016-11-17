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
}

-(void)initApplicant:(NSString*)name withEmail:(NSString*)email withPhoneNum:(NSString*)phoneNum withAddress:(NSString*)address {
    [self setEmail:email];
    [self setPhoneNumber:phoneNum];
    [self setAddress:address];
    [self setName:name];
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

@end
