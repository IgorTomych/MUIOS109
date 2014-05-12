//
//  RoutesViewController.h
//  MUIOS109
//
//  Created by Igor Tomych on 24/04/14.
//  Copyright (c) 2014 itomych studio. All rights reserved.
//

#import <UIKit/UIKit.h>


@class Route;

@protocol RoutesDelegate <NSObject>

- (void)didRouteSelect:(Route*)selectedRoute;

@end

@interface RoutesViewController : UITableViewController

@property (nonatomic, weak) id<RoutesDelegate> routesDelegate;

@end
