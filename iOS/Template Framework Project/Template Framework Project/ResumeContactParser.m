//
//  ResumeContactParser.m
//  Template Framework Project
//
//  Created by Chang Rey Tang on 11/7/16.
//  Copyright © 2016 Daniele Galiotto - www.g8production.com. All rights reserved.
//

#import "ResumeContactParser.h"

@implementation ResumeContactParser

- (void)parseContactInfo:(NSString*)contact_info {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Raw Contact Information"
                                                    message:contact_info
                                                   delegate:nil
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    [alert show];
    NSArray *contact_array = [contact_info componentsSeparatedByCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    contact_array = [contact_array filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"SELF != ''"]];
}

//// Spawn an alert with the recognized text
//UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"OCR Result"
//                                                message:recognizedText
//                                               delegate:nil
//                                      cancelButtonTitle:@"OK"
//                                      otherButtonTitles:nil];
//[alert show];


@end
