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
    //[self consoleLog:contact_info];
    NSArray *contact_array = [contact_info componentsSeparatedByCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    contact_array = [contact_array filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"SELF != ''"]];
    NSArray* emails = [contact_array filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"SELF CONTAINS[c] '@'"]];
    NSString* phone_regex = @"^[\\(]{0,1}([0-9]){3}[\\)]{0,1}[ ]?([^0-1]){1}([0-9]){2}[ ]?[-]?[ ]?([0-9]){4}[ ]*((x){0,1}([0-9]){1,5}){0,1}$";
    NSArray* numbers = [contact_array filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"SELF MATCHES[c] %@", phone_regex]];
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
    [self consoleLog:[contact_array componentsJoinedByString:@","]];
    [self consoleLog:[numbers componentsJoinedByString:@""]];
    [self consoleLog:[emails componentsJoinedByString:@""]];
    [self consoleLog:[names componentsJoinedByString:@" "]];
}

//// Spawn an alert with the recognized text
//UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"OCR Result"
//                                                message:recognizedText
//                                               delegate:nil
//                                      cancelButtonTitle:@"OK"
//                                      otherButtonTitles:nil];
//[alert show];


@end
