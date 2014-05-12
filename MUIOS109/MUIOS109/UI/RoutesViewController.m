//
//  RoutesViewController.m
//  MUIOS109
//
//  Created by Igor Tomych on 24/04/14.
//  Copyright (c) 2014 itomych studio. All rights reserved.
//

#import "RoutesViewController.h"
#import "RoutesAPI.h"
#import <UIImageView+AFNetworking.h>
#import "Route.h"


@interface RoutesViewController ()

@property (strong, nonatomic) NSArray* routes;

@end

@implementation RoutesViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [[RoutesAPI sharedClient] getRoutesWithSuccess:nil];

    [[RoutesAPI sharedClient] getRoutesWithSuccess:^(NSArray *routes, NSError *error) {
        if (error) {
            NSLog(@"%@", error);
            return;
        }
        
        self.routes = routes;
        [self.tableView reloadData];
    }];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.routes count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"routeCell" forIndexPath:indexPath];
  
    NSDictionary* routeDictionary = self.routes[indexPath.row];
    
    cell.textLabel.text = routeDictionary[@"route_title"];
  
    return cell;
}

#pragma mark - UITableViewDelegate 

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"%@", indexPath);
    
    if ([self.routesDelegate respondsToSelector:@selector(didRouteSelect:)]) {
        Route* route = [[Route alloc] init];
        
        NSDictionary* routeDictionary = self.routes[indexPath.row];
        route.name = routeDictionary[@"route_title"];
        [self.routesDelegate didRouteSelect:route];
    }
    
}

@end
