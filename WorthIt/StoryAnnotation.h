//
//  StoryAnnotation.h
//  WorthIt
//
//  Created by Aaron on 3/24/14.
//  Copyright (c) 2014 Aschen Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface StoryAnnotation : NSObject <MKAnnotation>

@property (strong, nonatomic) NSString *title;
@property (nonatomic,assign) CLLocationCoordinate2D coordinate;

-(id) initWithCoordinate:(CLLocationCoordinate2D)coordinate title:(NSString *)title;

@end
