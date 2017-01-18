//
//  ResumeContactParser.h
//  Template Framework Project
//
//  Created by Chang Rey Tang on 11/7/16.
//  Copyright © 2016 Daniele Galiotto - www.g8production.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ResumeContactParser : NSObject

@property (readonly, nonatomic) NSArray* names;
@property (readonly, nonatomic) NSArray* emails;
@property (readonly, nonatomic) NSArray* phoneNumbers;
@property (readonly, nonatomic) NSArray* websites;


- (void)parseContactInfo:(NSString*)contact_info;
- (void)consoleLog:(NSString*)info;

@end
