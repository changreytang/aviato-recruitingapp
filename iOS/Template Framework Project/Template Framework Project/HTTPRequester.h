//
//  HTTPRequester.h
//  
//
//  Created by Tim Liew on 1/9/17.
//
//

#import <Foundation/Foundation.h>

@interface HTTPRequester : NSObject <NSURLConnectionDataDelegate>

- (void)sendHttpPost:(NSData *)postData withID:(NSString *)currentID;
- (void)sendHttpPostPicture:(UIImage *)imageToPost withID:(NSString *)currentID;


@end
