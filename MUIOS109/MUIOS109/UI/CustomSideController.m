//
//  CustomSideController.m
//  MUIOS109
//
//  Created by Igor Tomych on 28/04/14.
//  Copyright (c) 2014 itomych studio. All rights reserved.
//

#import "CustomSideController.h"
#import "RoutesViewController.h"
#import "MapViewController.h"

@interface CustomSideController ()

@end

@implementation CustomSideController

-(void)awakeFromNib {
    RoutesViewController* routesViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"routesController"];
    
    UINavigationController* mapNavigationController = [self.storyboard instantiateViewControllerWithIdentifier:@"mapNavigationController"];
    
    
    MapViewController* mapViewController = (MapViewController *)mapNavigationController.topViewController;
    routesViewController.routesDelegate = mapViewController;
    
    [self setLeftPanel:routesViewController];
    [self setCenterPanel:mapNavigationController];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

@end
