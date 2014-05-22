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
#import <CoreData/CoreData.h>
#import "AppDelegate.h"


@interface RoutesViewController () <NSFetchedResultsControllerDelegate>

@property (nonatomic, strong) NSFetchedResultsController* routesResultsController;

@property (nonatomic, strong) NSManagedObjectContext* context;
@end

@implementation RoutesViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.context = ((AppDelegate *)[UIApplication sharedApplication].delegate).managedContext;
    
    NSFetchRequest* routesFetch = [[NSFetchRequest alloc] init];
    
    [routesFetch setEntity:[NSEntityDescription entityForName:@"Route" inManagedObjectContext:self.context]];
    
    NSSortDescriptor* sortDescription = [[NSSortDescriptor alloc] initWithKey:@"title" ascending:YES];
    
    routesFetch.sortDescriptors = @[sortDescription];
    
    self.routesResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:routesFetch managedObjectContext:self.context sectionNameKeyPath:nil cacheName:nil];

    NSError* error;
    self.routesResultsController.delegate = self;
    [self.routesResultsController performFetch:&error];
    

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    NSInteger count = [self.routesResultsController sections].count;
    
    return count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSInteger numberOfRows = 0;
	
    if ([self.routesResultsController sections].count > 0) {
        id <NSFetchedResultsSectionInfo> sectionInfo = [[self.routesResultsController sections] objectAtIndex:section];
        numberOfRows = [sectionInfo numberOfObjects];
    }
    
    return numberOfRows;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"routeCell" forIndexPath:indexPath];
  
    [self configureCell:cell atIndexPath:indexPath];
    return cell;
}

#pragma mark - UITableViewDelegate 

//-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//    NSLog(@"%@", indexPath);
//    
//    if ([self.routesDelegate respondsToSelector:@selector(didRouteSelect:)]) {
//        /*
//        Route* route = [[Route alloc] init];
//        
//        NSDictionary* routeDictionary = self.routes[indexPath.row];
//        route.name = routeDictionary[@"route_title"];
//         */
//        
//        [self.routesDelegate didRouteSelect:nil];
//    }
//    
//}

#pragma mark - FetchedResultControllerDelegate


- (void)configureCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    
	Route *route = (Route *)[self.routesResultsController objectAtIndexPath:indexPath];
    
    cell.textLabel.text = route.title;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@", route.price];
}

- (void)controllerWillChangeContent:(NSFetchedResultsController *)controller {
    
	// The fetch controller is about to start sending change notifications, so prepare the table view for updates.
	[self.tableView beginUpdates];
}

- (void)controller:(NSFetchedResultsController *)controller didChangeObject:(id)anObject atIndexPath:(NSIndexPath *)indexPath forChangeType:(NSFetchedResultsChangeType)type newIndexPath:(NSIndexPath *)newIndexPath {
    
	UITableView *tableView = self.tableView;
	
	switch(type) {
		case NSFetchedResultsChangeInsert:
			[tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:newIndexPath] withRowAnimation:UITableViewRowAnimationFade];
			break;
			
		case NSFetchedResultsChangeDelete:
			[tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
			break;
			
		case NSFetchedResultsChangeUpdate:
			[self configureCell:[tableView cellForRowAtIndexPath:indexPath] atIndexPath:indexPath];
            [self.tableView reloadData];
			break;
			
		case NSFetchedResultsChangeMove:
			[tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
            [tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:newIndexPath] withRowAnimation:UITableViewRowAnimationFade];
            break;
	}
}

- (void)controller:(NSFetchedResultsController *)controller didChangeSection:(id <NSFetchedResultsSectionInfo>)sectionInfo atIndex:(NSUInteger)sectionIndex forChangeType:(NSFetchedResultsChangeType)type {
    
	switch(type) {
		case NSFetchedResultsChangeInsert:
			[self.tableView insertSections:[NSIndexSet indexSetWithIndex:sectionIndex] withRowAnimation:UITableViewRowAnimationFade];
			break;
			
		case NSFetchedResultsChangeDelete:
			[self.tableView deleteSections:[NSIndexSet indexSetWithIndex:sectionIndex] withRowAnimation:UITableViewRowAnimationFade];
			break;
	}
}

- (void)controllerDidChangeContent:(NSFetchedResultsController *)controller {
    
	// The fetch controller has sent all current change notifications,
    // so tell the table view to process all updates.
	[self.tableView endUpdates];
}

@end
