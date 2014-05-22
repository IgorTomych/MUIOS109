//
//  AppDelegate.h
//  MUIOS109
//
//  Created by Igor Tomych on 21/04/14.
//  Copyright (c) 2014 itomych studio. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) NSManagedObjectContext* managedContext;
@property (strong, nonatomic) NSManagedObjectModel* managedModel;
@property (strong, nonatomic) NSPersistentStoreCoordinator* storeCoordinator;

@end
