//
//  Story.m
//  WorthIt
//
//  Created by Aaron on 1/27/14.
//  Copyright (c) 2014 Aschen Inc. All rights reserved.
//

#import "Story.h"

@implementation Story
@synthesize storyText, subject, thumbnail, datePosted, author;


- (NSString *)description
{
    NSString *descriptionString = [[NSString alloc] initWithFormat:@"Story subject: %@", subject];
    return descriptionString;
}

- (id)initWithStorySubject:(NSString *)subject
{
    self = [super init];
    if (self) {
        [self setSubject:[self subject]];
    }
    return self;
}

- (id)init
{
    return [self initWithStorySubject:@"kitty"];
}

@end
