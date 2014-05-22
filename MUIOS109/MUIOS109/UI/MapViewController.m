//
//  MapViewController.m
//  MUIOS109
//
//  Created by Igor Tomych on 21/04/14.
//  Copyright (c) 2014 itomych studio. All rights reserved.
//

#import "MapViewController.h"
#import "Route.h"

@interface MapViewController ()
@property (weak, nonatomic) IBOutlet UILabel *headerLabel;

@end

@implementation MapViewController


- (void)viewDidLoad
{
    [super viewDidLoad];    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)didRouteSelect:(Route *)selectedRoute {
//    self.headerLabel.text = selectedRoute.name;
}
@end
