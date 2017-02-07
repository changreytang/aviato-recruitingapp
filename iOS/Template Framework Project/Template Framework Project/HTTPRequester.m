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
- (void)sendHttpPost:(NSData *)postData withID:(NSString *)currentID {
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
        NSLog(@"%@",[[NSString alloc] initWithData:postData encoding:NSUTF8StringEncoding]);
    } else {
        NSLog(@"Connection could not be made");
    }
    
    //We want a response
    NSData *returnData = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    NSDictionary *dict=[NSJSONSerialization JSONObjectWithData:returnData options:NSJSONReadingMutableLeaves error:nil];
    NSLog(@"Reponse %@",dict);

}

- (void)sendHttpPostPicture:(UIImage *)imageToPost withID:(NSString *)currentID {
    // Dictionary that holds post parameters. Set post parameters that your server accepts or programmed to accept.
    NSMutableDictionary* _params = [[NSMutableDictionary alloc] init];
    //[_params setObject:@"1.0" forKey:@"ver"];
    //[_params setObject:@"en" forKey:@"lan"];
    [_params setObject:[NSString stringWithFormat:@"%@", currentID] forKey:@"userId"];
    //[_params setObject:[NSString stringWithFormat:@"%@",title] forKey:[NSString stringWithString:@"title"]];
    
    // the boundary string : a random string, that will not repeat in post data, to separate post data fields.
    NSString *BoundaryConstant = @"----------V2ymHFg03ehbqgZCaKO6jy";
    
    // string constant for the post parameter 'file'. My server uses this name: `file`. Your's may differ
    NSString* FileParamConstant = @"file";
    
    // the server url to which the image (or the media) is uploaded.
    NSURL* requestURL = [NSURL URLWithString:@"https://1kgafeo9xg.execute-api.us-west-2.amazonaws.com/prod"];
    
    // create request
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setCachePolicy:NSURLRequestReloadIgnoringLocalCacheData];
    [request setHTTPShouldHandleCookies:NO];
    [request setTimeoutInterval:30];
    [request setHTTPMethod:@"POST"];
    
    // set Content-Type in HTTP header
    NSString *contentType = [NSString stringWithFormat:@"multipart/form-data; boundary=%@", BoundaryConstant];
    [request setValue:contentType forHTTPHeaderField: @"Content-Type"];
    
    // post body
    NSMutableData *body = [NSMutableData data];
    
    // add params (all params are strings)
    for (NSString *param in _params) {
        [body appendData:[[NSString stringWithFormat:@"--%@\r\n", BoundaryConstant] dataUsingEncoding:NSUTF8StringEncoding]];
        [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"%@\"\r\n\r\n", param] dataUsingEncoding:NSUTF8StringEncoding]];
        [body appendData:[[NSString stringWithFormat:@"%@\r\n", [_params objectForKey:param]] dataUsingEncoding:NSUTF8StringEncoding]];
    }
    
    // add image data
    NSData *imageData = UIImageJPEGRepresentation(imageToPost, 1.0);
    if (imageData) {
        [body appendData:[[NSString stringWithFormat:@"--%@\r\n", BoundaryConstant] dataUsingEncoding:NSUTF8StringEncoding]];
        [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"%@\"; filename=\"%@\"\r\n", FileParamConstant, currentID] dataUsingEncoding:NSUTF8StringEncoding]];
        
        //to send jpeg
        //[body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"%@\"; filename=\"%@.jpg\"\r\n", FileParamConstant, currentID] dataUsingEncoding:NSUTF8StringEncoding]];
        [body appendData:[@"Content-Type: image/jpeg\r\n\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
        
        [body appendData:imageData];
        [body appendData:[[NSString stringWithFormat:@"\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
    }
    
    [body appendData:[[NSString stringWithFormat:@"--%@--\r\n", BoundaryConstant] dataUsingEncoding:NSUTF8StringEncoding]];
    
    // setting the body of the post to the reqeust
    [request setHTTPBody:body];
    
    // set the content-length
    NSString *postLength = [NSString stringWithFormat:@"%lu", (unsigned long)[body length]];
    [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
    
    // set URL
    [request setURL:requestURL];
    NSURLConnection *conn = [NSURLConnection connectionWithRequest:request delegate:self];
    if(conn) {
        NSLog(@"Connection Successful");
        NSLog(@"with ID: %@", currentID);
        //NSLog(@"%@",[[NSString alloc] initWithData:imageData encoding:NSUTF8StringEncoding]);
        //NSLog(@"body is %@", body);
        //NSLog(@"%@", [request http])
    } else {
        NSLog(@"Connection could not be made");
    }

    //Async request
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    [NSURLConnection sendAsynchronousRequest:request queue:queue completionHandler:^(NSURLResponse *response, NSData *returnData, NSError *error)
    {
    
        if (error)
        {
            NSLog(@"Error,%@", [error localizedDescription]);
        }
        else
        {
            //NSLog(@"%@", [[NSString alloc] initWithData:data encoding:NSASCIIStringEncoding]);
            NSDictionary *dict=[NSJSONSerialization JSONObjectWithData:returnData options:NSJSONReadingMutableLeaves error:nil];
            NSLog(@"%@",dict);
        }
    }];

}


@end
