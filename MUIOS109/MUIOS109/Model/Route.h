//
//  Route.h
//  MUIOS109
//
//  Created by Igor Tomych on 22/05/14.
//  Copyright (c) 2014 itomych studio. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Route : NSManagedObject

@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) NSNumber * price;
@property (nonatomic, retain) NSString * path;
@property (nonatomic, retain) NSString * customField;
@property (nonatomic, retain) NSNumber * favorite;
@property (nonatomic, retain) NSNumber * identifier;
@property (nonatomic, retain) NSManagedObject *owner;

@end


@interface Route (HelperFunctionality)

-(void)configureFromDictionary:(NSDictionary*)routeDictionary;
@end
