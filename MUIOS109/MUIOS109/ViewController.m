//
//  ViewController.m
//  MUIOS109
//
//  Created by Igor Tomych on 21/04/14.
//  Copyright (c) 2014 itomych studio. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    NSLog(@"%@ view did load", self);
}


-(void)viewWillAppear:(BOOL)animated {
    NSLog(@"%@ view will appear", self);
}

- (void)viewDidAppear:(BOOL)animated {
    NSLog(@"%@ view did appear", self);
}

- (void)viewWillDisappear:(BOOL)animated {
    NSLog(@"%@ view will disappear", self);
}

- (void)viewDidDisappear:(BOOL)animated {
    NSLog(@"%@ view did disappear", self);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
