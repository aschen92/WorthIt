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
    NSString *descriptionString = [[NSString alloc] initWithFormat:@"Story subject: %@ AUTHOR: %@", subject, author];
    return descriptionString;
}

- (id)init
{
    self = [super init];
    if (self) {
        NSArray *keys = @[@"storyText", @"subject", @"datePosted", @"author"];
        NSArray *values = @[@"foobar", @"foobar", @"foobar", @"foobar"];
        storyDictionary = [[NSMutableDictionary alloc] initWithObjects:values forKeys:keys];
    }
    return self;
}



- (void)updateDict
{
    [self.dictionaryRepr setObject:self.storyText forKey:@"storyText"];
    [self.dictionaryRepr setObject:self.subject forKey:@"subject"];
    [self.dictionaryRepr setObject:self.datePosted forKey:@"datePosted"];
    [self.dictionaryRepr setObject:self.author forKey:@"author"];
}



- (NSMutableDictionary *)dictionaryRepr
{
    return storyDictionary;
}

@end

