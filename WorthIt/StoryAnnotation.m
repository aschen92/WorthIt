//
//  StoryAnnotation.m
//  WorthIt
//
//  Created by Aaron on 3/24/14.
//  Copyright (c) 2014 Aschen Inc. All rights reserved.
//

#import "StoryAnnotation.h"


@implementation StoryAnnotation

-(id) initWithCoordinate:(CLLocationCoordinate2D)coordinate title:(NSString *)title {
    if ((self = [super init])) {
        self.coordinate =coordinate;
        self.title = title;
    }
    return self;
}


@end
