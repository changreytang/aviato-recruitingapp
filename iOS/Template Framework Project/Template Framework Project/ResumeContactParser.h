//
//  ResumeContactParser.h
//  Template Framework Project
//
//  Created by Chang Rey Tang on 11/7/16.
//

#import <Foundation/Foundation.h>
#import "CropViewController.h"
#import "Applicant.h"

@interface ResumeContactParser : NSObject

@property (nonatomic,strong) CropViewController *viewController;
@property (nonatomic) NSArray* names;
@property (nonatomic) NSArray* emails;
@property (nonatomic) NSArray* phoneNumbers;
@property (nonatomic) NSArray* websites;


- (Applicant *)parseContactInfo:(NSString*)contact_info;
- (void)consoleLog:(NSString*)info;

@end
