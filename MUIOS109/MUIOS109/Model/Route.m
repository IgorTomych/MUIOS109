//
//  Route.m
//  MUIOS109
//
//  Created by Igor Tomych on 21/04/14.
//  Copyright (c) 2014 itomych studio. All rights reserved.
//

#import "Route.h"

@interface Route ()

- (void)myHiddenMethod;

@end

@implementation Route

-(void)beep {
    NSLog(@"%@ is saying \"beep-beep!\"", self.name);
}


-(void)myHiddenMethod {
    NSLog(@"myHiddenMethod");
}

@end
