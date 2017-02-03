//
//  ResumeContactParser.h
//  Template Framework Project
//
//  Created by Chang Rey Tang on 11/7/16.
//  Copyright © 2016 Daniele Galiotto - www.g8production.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ResumeContactParser : NSObject

@property (nonatomic) NSArray* names;
@property (nonatomic) NSArray* emails;
@property (nonatomic) NSArray* phoneNumbers;
@property (nonatomic) NSArray* websites;


- (void)parseContactInfo:(NSString*)contact_info;
- (void)consoleLog:(NSString*)info;

@end
