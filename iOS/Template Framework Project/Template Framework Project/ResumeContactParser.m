//
//  ResumeContactParser.m
//  Template Framework Project
//
//  Created by Chang Rey Tang on 11/7/16.
//  Copyright © 2016 Daniele Galiotto - www.g8production.com. All rights reserved.
//

#import "ResumeContactParser.h"

@implementation ResumeContactParser

- (void)consoleLog:(NSString*)info {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Console Log"
                                                    message:info
                                                   delegate:nil
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    [alert show];
}

- (void)parseContactInfo:(NSString*)contact_info {
    
    // contact_array contains all raw tesseract information separated by white spaces into array format
    NSArray *contact_array = [contact_info componentsSeparatedByCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    contact_array = [contact_array filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"SELF != ''"]];
    
    // emails contains all possible email matches from contact_array
    NSArray* emails = [contact_array filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"SELF CONTAINS[c] '@'"]];
    
    // numbers contain all possible number matches from contact_array
    NSString* phone_regex = @"^[\\(]{0,1}([0-9]){3}[\\)]{0,1}[ ]?([^0-1]){1}([0-9]){2}[ ]?[-]?[ ]?([0-9]){4}[ ]*((x){0,1}([0-9]){1,5}){0,1}$";
    NSArray* numbers = [contact_array filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"SELF MATCHES[c] %@", phone_regex]];
    
    NSString* web_regex = @"[-a-zA-Z0-9@:%._\\+~#=]{2,256}\\.[a-z]{2,6}\\b([-a-zA-Z0-9@:%_\\+.~#?&//=]*)";
    NSArray* websites = [contact_array filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"SELF MATCHES[c] %@", web_regex]];
    
    NSMutableArray* names = [NSMutableArray arrayWithArray:contact_array];
    
    for(NSInteger i = 0; i < [emails count]; i++) {
        for(NSInteger j = [names count] - 1; j >= 0; j--) {
            if([emails[i] isEqualToString:names[j]]) {
                [names removeObjectAtIndex:j];
            }
        }
    }
    
    for(NSInteger i = 0; i < [numbers count]; i++) {
        for(NSInteger j = [names count] - 1; j >= 0; j--) {
            if([numbers[i] isEqualToString:names[j]]) {
                [names removeObjectAtIndex:j];
            }
        }
    }
    
    for(NSInteger i = 0; i < [websites count]; i++) {
        for(NSInteger j = [names count] - 1; j >= 0; j--) {
            if([websites[i] isEqualToString:names[j]]) {
                [names removeObjectAtIndex:j];
            }
        }
    }
    
    //[self setNames:names];
    //[self setEmails:emails];
    //[self setPhoneNumbers:numbers];
    //[self setWebsites:websites];
    
    //[self consoleLog:[contact_array componentsJoinedByString:@","]];
    //[self consoleLog:[numbers componentsJoinedByString:@""]];
    //[self consoleLog:[emails componentsJoinedByString:@""]];
    //[self consoleLog:[websites componentsJoinedByString:@""]];
    //[self consoleLog:[names componentsJoinedByString:@" "]];
}

//// Spawn an alert with the recognized text
//UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"OCR Result"
//                                                message:recognizedText
//                                               delegate:nil
//                                      cancelButtonTitle:@"OK"
//                                      otherButtonTitles:nil];
//[alert show];


@end
