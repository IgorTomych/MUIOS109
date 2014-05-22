//
//  AppDelegate.m
//  MUIOS109
//
//  Created by Igor Tomych on 21/04/14.
//  Copyright (c) 2014 itomych studio. All rights reserved.
//

#import "AppDelegate.h"
#import "Route.h"
#import "Owner.h"
#import "RoutesAPI.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    UIWindow* window = application.windows[0];
    window.tintColor = [UIColor whiteColor];
    application.statusBarStyle = UIStatusBarStyleLightContent;
    
    
    self.managedModel = [NSManagedObjectModel mergedModelFromBundles:nil];
    
    NSString* documentsStorePath = [[[self applicationDocumentsDirectory] path] stringByAppendingPathComponent:@"Transport.sqlite"];
    
    
    self.storeCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:self.managedModel];
    
    NSError* error;
    [self.storeCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:[NSURL fileURLWithPath:documentsStorePath] options:nil error:&error];
    
    if (error) {
        NSLog(@"%@", error);
    }
    
    self.managedContext = [[NSManagedObjectContext alloc] init];
    [self.managedContext setPersistentStoreCoordinator:self.storeCoordinator];
    
//    Route* route = [NSEntityDescription insertNewObjectForEntityForName:@"Route" inManagedObjectContext:self.managedContext];
//    
//    route.title = @"299E";
//    
//    Owner* owner = [NSEntityDescription insertNewObjectForEntityForName:@"Owner" inManagedObjectContext:self.managedContext];
//    
//    owner.name = @"Карусель";
//    
//    [owner addRoutesObject:route];
//    
//    [self.managedContext save:&error];
    
    [[RoutesAPI sharedClient] getRoutesWithSuccess:nil];
    
    [[RoutesAPI sharedClient] getRoutesWithSuccess:^(NSArray *routes, NSError *error) {
        if (error) {
            NSLog(@"%@", error);
            return;
        }
        
        NSFetchRequest* allRoutes = [[NSFetchRequest alloc] init];
        [allRoutes setEntity:[NSEntityDescription entityForName:@"Route" inManagedObjectContext:self.managedContext]];
        [allRoutes setIncludesPropertyValues:NO];
        
        NSError* fetchError;
        
        NSArray* routesToDelete = [self.managedContext executeFetchRequest:allRoutes error:&fetchError];
        
        
        for (NSManagedObject* routeToDelete in routesToDelete) {
            [self.managedContext deleteObject:routeToDelete];
        }
        
        for (NSDictionary *routeDictionary in routes) {
            Route* route = [NSEntityDescription insertNewObjectForEntityForName:@"Route" inManagedObjectContext:self.managedContext];
            [route configureFromDictionary:routeDictionary];
        }

        NSError* saveError;
        [self.managedContext save:&saveError];
        
    }];
    
    
    
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


#pragma mark - 

- (NSURL *)applicationDocumentsDirectory
{
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}


@end
