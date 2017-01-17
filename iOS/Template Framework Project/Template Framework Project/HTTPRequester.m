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
- (void)sendHttpPost:(NSData *)postData {
    //NSString *post = [NSString stringWithFormat:@"Username=%@&Password=%@",@"_username",@"_password"];
    NSString *postLength = [NSString stringWithFormat:@"%lu",(unsigned long)[postData length]];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:[NSURL URLWithString:@"https://1kgafeo9xg.execute-api.us-west-2.amazonaws.com/prod"]];
    [request setHTTPMethod:@"POST"];
    [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [request setHTTPBody:postData];
    NSURLConnection *conn = [NSURLConnection connectionWithRequest:request delegate:self];
    if(conn) {
        NSLog(@"Connection Successful");
    } else {
        NSLog(@"Connection could not be made");
    }
}

@end
