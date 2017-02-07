//
//  ResumeContactParser.m
//  Template Framework Project
//
//  Created by Chang Rey Tang on 11/7/16.
//  Copyright © 2016 Daniele Galiotto - www.g8production.com. All rights reserved.
//

#import "ResumeContactParser.h"
#import "ApplicantViewController.h"

@implementation ResumeContactParser{
    Applicant *candidate;
}

@synthesize viewController;


- (void)consoleLog:(NSString*)info {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Console Log"
                                                    message:info
                                                   delegate:nil
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    [alert show];
}

- (Applicant *)parseContactInfo:(NSString*)contact_info {
    
    // contact_array contains all raw tesseract information separated by white spaces into array format
    //NSArray *contact_array = [contact_info componentsSeparatedByCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    NSArray *contact_array = [contact_info componentsSeparatedByString:@"\n"];
    contact_array = [contact_array filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"SELF != ''"]];
    
    // emails contains all possible email matches from contact_array
    NSArray* emails = [contact_array filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"SELF CONTAINS[c] '@'"]];
    
    // numbers contain all possible number matches from contact_array
    //NSString* phone_regex = @"/^\\s*(?:\\+?(\\d{1,3}))?[- (]*(\\d{3})[- )]*(\\d{3})[- ]*(\\d{4})(?: *[x/#]{1}(\\d+))?\\s*$/";
    NSString* phone_regex = @"^[2-9]\\d{2}-\\d{3}-\\d{4}$";
    NSArray* numbers = [contact_array filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"SELF MATCHES[c] %@", phone_regex]];
    
    NSString* web_regex = @"[-a-zA-Z0-9@:%._\\+~#=]{2,256}\\.[a-z]{2,6}\\b([-a-zA-Z0-9@:%_\\+.~#?&//=]*)";
    NSArray* websites = [contact_array filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"SELF MATCHES[c] %@", web_regex]];
    
    NSMutableArray* names_mut = [NSMutableArray arrayWithArray:contact_array];
    
    for(NSInteger i = 0; i < [emails count]; i++) {
        for(NSInteger j = [names_mut count] - 1; j >= 0; j--) {
            if([emails[i] isEqualToString:names_mut[j]]) {
                [names_mut removeObjectAtIndex:j];
            }
        }
    }
    
    for(NSInteger i = 0; i < [numbers count]; i++) {
        for(NSInteger j = [names_mut count] - 1; j >= 0; j--) {
            if([numbers[i] isEqualToString:names_mut[j]]) {
                [names_mut removeObjectAtIndex:j];
            }
        }
    }
    
    for(NSInteger i = 0; i < [websites count]; i++) {
        for(NSInteger j = [names_mut count] - 1; j >= 0; j--) {
            if([websites[i] isEqualToString:names_mut[j]]) {
                [names_mut removeObjectAtIndex:j];
            }
        }
    }

    //NSString* name_regex = @"^[A-Za-z]+(((\\'|\\-|\\.)?([A-Za-z])+))?$";
    //NSArray* names = [names_mut filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"SELF MATCHES[c] %@", name_regex]];
    

    NSString *names_log = @"NAMES: ";
    NSString *emails_log = @"EMAILS: ";
    NSString *numbers_log = @"NUMBERS: ";
    NSString *websites_log = @"WEBSITE: ";
    NSString *contact_log = @"RAW CONTACT: ";
    
    [self setNames:names_mut];
    [self setEmails:emails];
    [self setPhoneNumbers:numbers];
    [self setWebsites:websites];
    
    NSArray *array = [[self.names objectAtIndex:0] componentsSeparatedByCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    array = [array filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"SELF != ''"]];
    candidate = [[Applicant alloc] init];
    [candidate setFName:[array objectAtIndex:0]];
    [candidate setLName:[array objectAtIndex:1]];
    [candidate setEmail:[self.emails objectAtIndex:0]];
    [candidate setWebsites:self.websites];
    //[candidate setPhoneNumber:[self.phoneNumbers objectAtIndex:0]];
    
    return candidate;

    
    //[self consoleLog:[contact_log stringByAppendingString:[contact_array componentsJoinedByString:@","]]];
    //[self consoleLog:[numbers_log stringByAppendingString:[numbers componentsJoinedByString:@","]]];
    //[self consoleLog:[emails_log stringByAppendingString:[emails componentsJoinedByString:@","]]];
    //[self consoleLog:[websites_log stringByAppendingString:[websites componentsJoinedByString:@","]]];
    //[self consoleLog:[names_log stringByAppendingString:[names_mut componentsJoinedByString:@" "]]];
    
}



//// Spawn an alert with the recognized text
//UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"OCR Result"
//                                                message:recognizedText
//                                               delegate:nil
//                                      cancelButtonTitle:@"OK"
//                                      otherButtonTitles:nil];
//[alert show];


@end
