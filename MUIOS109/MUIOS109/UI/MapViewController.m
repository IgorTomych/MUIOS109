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
    
    
    UIImageView* imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 64, 138, 80)];
    [self.view addSubview:imageView];
    
    
    dispatch_queue_t myQueue = dispatch_queue_create("myQueue", DISPATCH_QUEUE_CONCURRENT);
    
    __block int multiplier = 7;
    
    NSLog(@"view did load");
    dispatch_async(myQueue, ^{
        //
        multiplier = 10;
        
        NSLog(@"starting loading image");
        NSData* data = [NSData dataWithContentsOfURL:[NSURL URLWithString:@"http://images.apple.com/home/images/promo_macbookair.jpg"]];
        
        UIImage* image = [[UIImage alloc] initWithData:data];
        NSLog(@"image loaded");
        
        dispatch_async(dispatch_get_main_queue(), ^{
        NSLog(@"image set in main queue");
            imageView.image = image;
        });
    });
    
    NSLog(@"view did load finished");
    
//    dispatch_release(myQueue);
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)didRouteSelect:(Route *)selectedRoute {
    self.headerLabel.text = selectedRoute.name;
}
@end
