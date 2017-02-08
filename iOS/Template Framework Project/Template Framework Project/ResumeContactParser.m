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
    //NSMutableArray *contact_array;
    NSMutableArray *_emails;
    NSMutableArray *_phoneNumbers;
    NSMutableArray *_websites;
    NSMutableArray *_names;
    //NSMutableArray *address;
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

- (NSString *)trim:(NSString*)str {
    return [str stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
}

- (Applicant *)parseContactInfo:(NSString*)contact_info {
    
    _emails = [[NSMutableArray alloc] init];
    _phoneNumbers = [[NSMutableArray alloc] init];
    _websites = [[NSMutableArray alloc] init];
    _names = [[NSMutableArray alloc] init];
    NSString* phone_regex = @"(\\D?(\\d{3})\\D?\\D?(\\d{3})\\D?(\\d{4}))";
    NSString* email_regex = @"([\\w\\.=-]+@[\\w\\.-]+\\.[\\w]{2,3})|([\\w\\.=-]+@[\\w\\.-]+)";
    NSString* website_regex = @"((http\\:\\/\\/|https\\:\\/\\/)?([a-z0-9][a-z0-9\\-]*\\.)+[a-z0-9][a-z0-9\\-]*)";
    NSString* name_regex = @"(([a-zA-Z]{2,}\\s[a-zA-z]{1,}'?-?[a-zA-Z]{2,}))";
    
    NSRegularExpression *phoneExpression = [NSRegularExpression regularExpressionWithPattern:phone_regex
                                                                                     options:NSRegularExpressionSearch
                                                                                       error:nil];
    
    NSArray *phoneMatches = [phoneExpression matchesInString:contact_info
                                                     options:0
                                                       range:NSMakeRange(0, [contact_info length])];
    
    for (NSTextCheckingResult *match in phoneMatches) {
        NSRange matchRange = [match rangeAtIndex:1];
        NSString *matchString = [contact_info substringWithRange:matchRange];
        [_phoneNumbers addObject:[self trim:matchString]];
        NSLog(@"MATCHED PHONE: %@", matchString);
    }
    
    NSRegularExpression *emailExpression = [NSRegularExpression regularExpressionWithPattern:email_regex
                                                                                     options:NSRegularExpressionSearch
                                                                                       error:nil];
    
    NSArray *emailMatches = [emailExpression matchesInString:contact_info
                                                     options:0
                                                       range:NSMakeRange(0, [contact_info length])];
    
    for (NSTextCheckingResult *match in emailMatches) {
        NSRange matchRange = [match rangeAtIndex:1];
        NSString *matchString = [contact_info substringWithRange:matchRange];
        [_emails addObject:[self trim:matchString]];
        NSLog(@"MATCHED EMAIL: %@", matchString);
    }
    
    
    NSRegularExpression *websiteExpression = [NSRegularExpression regularExpressionWithPattern:website_regex
                                                                                       options:NSRegularExpressionSearch
                                                                                         error:nil];
    
    NSArray *websiteMatches = [websiteExpression matchesInString:contact_info
                                                         options:0
                                                           range:NSMakeRange(0, [contact_info length])];
    
    for (NSTextCheckingResult *match in websiteMatches) {
        NSRange matchRange = [match rangeAtIndex:1];
        NSString *matchString = [contact_info substringWithRange:matchRange];
        [_websites addObject:[self trim:matchString]];
        NSLog(@"MATCHED WEBSITE: %@", matchString);
    }
    
    
    NSRegularExpression *nameExpression = [NSRegularExpression regularExpressionWithPattern:name_regex
                                                                                       options:NSRegularExpressionSearch
                                                                                         error:nil];
    
    NSArray *nameMatches = [nameExpression matchesInString:contact_info
                                                         options:0
                                                           range:NSMakeRange(0, [contact_info length])];
    
    for (NSTextCheckingResult *match in nameMatches) {
        NSRange matchRange = [match rangeAtIndex:1];
        NSString *matchString = [contact_info substringWithRange:matchRange];
        [_names addObject:[self trim:matchString]];
        NSLog(@"MATCHED NAME: %@", matchString);
    }
    
    /*
    // [Rey, Tang, 2476, Bruce, Drive, al;dsjf;lasd, a;lskdfj, ;a510, 223, 3242]
    
    // contact_array contains all raw tesseract information separated by white spaces into array format
    NSArray *contact_array = [contact_info componentsSeparatedByCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    //NSCharacterSet *delim = [NSCharacterSet whitespaceAndNewlineCharacterSet];
    contact_array = [[contact_info componentsSeparatedByCharactersInSet:delim] mutableCopy];
    contact_array = [[contact_array filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"SELF != ''"]] mutableCopy];
    
    
    // emails contains all possible email matches from contact_array
    NSArray* emails = [contact_array filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"SELF CONTAINS[c] '@'"]];
    
    // numbers contain all possible number matches from contact_array
    //NSString* phone_regex = @"/^\\s*(?:\\+?(\\d{1,3}))?[- (]*(\\d{3})[- )]*(\\d{3})[- ]*(\\d{4})(?: *[x/#]{1}(\\d+))?\\s*$/";
    NSString* phone_regex = @"(\\D?(\\d{3})\\D?\\D?(\\d{3})\\D?(\\d{4}))";
    NSMutableArray* numbers = [contact_array filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"SELF MATCHES[c] %@", phone_regex]];
    
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
    
    */
    [self setNames:_names];
    [self setEmails:_emails];
    [self setPhoneNumbers:_phoneNumbers];
    [self setWebsites:_websites];
     
    
    
    NSArray *array = [[self.names objectAtIndex:0] componentsSeparatedByCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    array = [array filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"SELF != ''"]];
    candidate = [[Applicant alloc] init];
    [candidate setFName:[array objectAtIndex:0]];
    [candidate setLName:[array objectAtIndex:1]];
    [candidate setEmail:[self.emails objectAtIndex:0]];
    [candidate setWebsites:[self.websites objectAtIndex:1]];
    [candidate setPhoneNumber:[self.phoneNumbers objectAtIndex:0]];
    
    return candidate;

    
    //[self consoleLog:[contact_log stringByAppendingString:[contact_array componentsJoinedByString:@","]]];
    //[self consoleLog:[numbers_log stringByAppendingString:[numbers componentsJoinedByString:@","]]];
    //[self consoleLog:[emails_log stringByAppendingString:[emails componentsJoinedByString:@","]]];
    //[self consoleLog:[websites_log stringByAppendingString:[websites componentsJoinedByString:@","]]];
    //[self consoleLog:[names_log stringByAppendingString:[names_mut componentsJoinedByString:@" "]]];
    
    
    //return 0;
    
}



//// Spawn an alert with the recognized text
//UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"OCR Result"
//                                                message:recognizedText
//                                               delegate:nil
//                                      cancelButtonTitle:@"OK"
//                                      otherButtonTitles:nil];
//[alert show];


@end
