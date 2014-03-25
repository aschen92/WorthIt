//
//  LocationViewController.m
//  WorthIt
//
//  Created by Aaron Schendel on 1/21/14.
//  Copyright (c) 2014 Aschen Inc. All rights reserved.
//

#import "LocationViewController.h"
#import "StoryAnnotation.h"
#import "StoryStore.h"

#define METERS_PER_MILE 1609.344

@interface LocationViewController ()

@end

@implementation LocationViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    NSBundle *appBundle = [NSBundle mainBundle];
    self = [super initWithNibName:@"LocationViewController" bundle:appBundle];
    if (self) {
        UINavigationItem *nav = [self navigationItem];
        [nav setTitle:@"Story Map"];
        
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];

    CLLocationCoordinate2D zoomLocation;
    zoomLocation.latitude = 40.740848;
    zoomLocation.longitude= -73.991145;

    MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(zoomLocation, 0.3*METERS_PER_MILE, 0.3*METERS_PER_MILE);
    [self.mapView setRegion:viewRegion animated:YES];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // use geocoding to get the list of stories
    
    

    self.mapView.delegate = self;
    
    CLLocationCoordinate2D coordinate1;
    coordinate1.latitude = 40.740384;
    coordinate1.longitude = -73.991146;
    StoryAnnotation *annotation = [[StoryAnnotation alloc] initWithCoordinate:coordinate1 title:@"Starbucks NY"];
    [self.mapView addAnnotation:annotation];
    
    CLLocationCoordinate2D coordinate2;
    coordinate2.latitude = 40.741623;
    coordinate2.longitude = -73.992021;
    StoryAnnotation *annotation2 = [[StoryAnnotation alloc] initWithCoordinate:coordinate2 title:@"Pascal Boyer Gallery"];
    [self.mapView addAnnotation:annotation2];
    
    CLLocationCoordinate2D coordinate3;
    coordinate3.latitude = 40.739490;
    coordinate3.longitude = -73.991154;
    StoryAnnotation *annotation3 = [[StoryAnnotation alloc] initWithCoordinate:coordinate3 title:@"Virgin Records"];
    [self.mapView addAnnotation:annotation3];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
