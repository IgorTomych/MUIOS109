//
//  RoutesAPI.h
//  MUIOS109
//
//  Created by Igor Tomych on 28/04/14.
//  Copyright (c) 2014 itomych studio. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RoutesAPI : NSObject

+(instancetype)sharedClient;

- (void)getRoutesWithSuccess:(void (^)(NSArray *, NSError *))finishBlock;
@end
