//
//  HTTPRequester.m
//  
//
//  Created by Tim Liew on 1/9/17.
//
//

#import "HTTPRequester.h"

@implementation HTTPRequester

/**
 *  Sends synchronous HTTP POST request.
 *  Gather response data inside the same method.
 */
- (void)sendHttpPost {
    NSArray *objects = [NSArray arrayWithObjects:[[NSUserDefaults standardUserDefaults]valueForKey:@"StoreNickName"],
                        [[UIDevice currentDevice] uniqueIdentifier], [dict objectForKey:@"user_question"],     nil];
    NSArray *keys = [NSArray arrayWithObjects:@"nick_name", @"UDID", @"user_question", nil];
    NSDictionary *questionDict = [NSDictionary dictionaryWithObjects:objects forKeys:keys];
    
    NSDictionary *jsonDict = [NSDictionary dictionaryWithObject:questionDict forKey:@"question"];
    
    NSString *jsonRequest = [jsonDict JSONRepresentation];
    
    NSLog(@"jsonRequest is %@", jsonRequest);
    
    NSURL *url = [NSURL URLWithString:@"https://xxxxxxx.com/questions"];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url
                                                           cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:60.0];
    
    
    NSData *requestData = [jsonRequest dataUsingEncoding:NSUTF8StringEncoding];
    
    [request setHTTPMethod:@"POST"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request setValue:[NSString stringWithFormat:@"%d", [requestData length]] forHTTPHeaderField:@"Content-Length"];
    [request setHTTPBody: requestData];
    
    NSURLConnection *connection = [[NSURLConnection alloc]initWithRequest:request delegate:self];
    if (connection) {
        receivedData = [[NSMutableData data] retain];
    }
}

@end
