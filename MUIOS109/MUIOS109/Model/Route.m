//
//  Route.m
//  MUIOS109
//
//  Created by Igor Tomych on 22/05/14.
//  Copyright (c) 2014 itomych studio. All rights reserved.
//

#import "Route.h"


@implementation Route

@dynamic title;
@dynamic price;
@dynamic path;
@dynamic customField;
@dynamic favorite;
@dynamic identifier;
@dynamic owner;

- (void)configureFromDictionary:(NSDictionary *)routeDictionary {
    self.title  = routeDictionary[@"route_title"];
    self.identifier = [NSNumber numberWithInteger:[routeDictionary[@"route_id"] integerValue]];
    self.price = [NSNumber numberWithInteger:[routeDictionary[@"route_price"] integerValue]];
}

@end



