//
//  RoutesAPI.m
//  MUIOS109
//
//  Created by Igor Tomych on 28/04/14.
//  Copyright (c) 2014 itomych studio. All rights reserved.
//

#import "RoutesAPI.h"
#import <AFNetworking.h>

@implementation RoutesAPI

+(instancetype)sharedClient {
    static RoutesAPI* _sharedClient = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        _sharedClient = [[RoutesAPI alloc] init];
    });

    return _sharedClient;
}


-(void)getRoutesWithSuccess:(void (^)(NSArray *, NSError *))finishBlock {
    AFHTTPRequestOperationManager* manager = [AFHTTPRequestOperationManager manager];
    
    [manager GET:@"http://marshrutki.com.ua/mu/routes" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"%@", responseObject);
        
        if (finishBlock) {
            finishBlock(responseObject, nil);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (finishBlock) {
            finishBlock(nil, error);
        }
    }];
}
@end
