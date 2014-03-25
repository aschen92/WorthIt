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
#import "Story.h"

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



- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // use geocoding to get the list of stories
    
    for (PFObject *s in [[StoryStore sharedStore] allItems]){
        CLGeocoder *geocoder = [[CLGeocoder alloc] init];
        [geocoder geocodeAddressString:s[@"location"] completionHandler:^(NSArray *placemarks, NSError *error) {
            CLPlacemark *placemark = [placemarks objectAtIndex:0];
            CLLocation *location = placemark.location;
            CLLocationCoordinate2D coordinate = location.coordinate;
            StoryAnnotation *test = [[StoryAnnotation alloc] initWithCoordinate:coordinate title:s[@"author"]];
            [self.mapView addAnnotation:test];
            }];
    }
    

    self.mapView.delegate = self;
    
    CLLocationCoordinate2D coordinate1;
    coordinate1.latitude = 40.740384;
    coordinate1.longitude = -73.991146;
    StoryAnnotation *annotation = [[StoryAnnotation alloc] initWithCoordinate:coordinate1 title:@"Starbucks NY"];
    [self.mapView addAnnotation:annotation];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
