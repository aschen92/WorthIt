//
//  StoryStore.m
//  WorthIt
//
//  Created by Aaron on 1/27/14.
//  Copyright (c) 2014 Aschen Inc. All rights reserved.
//

#import "StoryStore.h"
#import "Story.h"
#import <Parse/Parse.h>


@implementation StoryStore


#pragma mark - Init overriding

- (id)init
{
    self = [super init];
    if (self) {
        
        
        if (!allItems) {
            //allItems = [[NSMutableArray alloc] init];
            PFObject *story1 = [[PFObject alloc] initWithClassName:@"Story"];
            NSString *aaronsStory = @"My experience at Wartburg College allowed me to succeed in ways that I never though possible. I had one professor that was willing to offer extra help whenever I needed it. The staff in the business office allowed me to actually figure out my loans so that I could pay it off in a timely manner.";
            story1[@"text"] = aaronsStory;
            story1[@"subject"] = @"Wartburg Choir";
            story1[@"datePosted"] = @"1/20/14";
            story1[@"author"] = @"Aaron Schendel";
            //story1[@"thumbnail"] = [UIImage imageNamed:@"aaron_pic.jpg"];

            
            PFObject *story2 = [[PFObject alloc] initWithClassName:@"Story"];
            story2[@"text"] = @"Yo mah name iz adam";
            story2[@"subject"] = @"Track and Field";
            story2[@"datePosted"] = @"1/23/14";
            story2[@"author"] = @"Adam Kucera";
            //story2[@"thumbnail"] = [UIImage imageNamed:@"adam_pic.jpg"];
            
            //[story1 saveInBackground];
            //[story2 saveInBackground];

            //allItems = [[NSMutableArray alloc] initWithObjects:story1, story2, nil];
            
        }
    }
    return self;
}



+ (id)allocWithZone:(NSZone *)zone
{
    return [self sharedStore];
}

#pragma mark - Instance Methods

- (NSArray *)allItems
{
    return allItems;
}

- (void)retrieveStories
{
    //[allItems removeAllObjects];
    PFQuery *query = [PFQuery queryWithClassName:@"Story"];
    [query findObjectsInBackgroundWithBlock:^(NSArray *stories, NSError *error) {
        if (!error) {
            allItems = [stories mutableCopy];
            NSLog(@"%lu", (unsigned long)stories.count);
            NSLog(@"%lu", (unsigned long)allItems.count);
            //NSLog(@"allitems is filled with PFObjects: %@", [[allItems objectAtIndex:0] isKindOfClass:[PFObject class]] ? @"true" : @"false");
        } else {
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        }
    }];
    
}

- (PFObject *)createStory
{
    PFObject *s = [PFObject objectWithClassName:@"Story"];
    [allItems addObject:s];
    //[s saveInBackground];
    return s;
}

- (void)removeStory:(PFObject *)s
{
    [allItems removeObjectIdenticalTo:s];
}

//helper method for retrieve stories
- (void)removeAllStories
{
    allItems = nil;
}


- (void)saveChanges
{

}

+ (StoryStore *)sharedStore
{
    static StoryStore *sharedStore = nil;
    if (!sharedStore) {
        sharedStore = [[super allocWithZone:nil] init];
    }
    return sharedStore;
}



- (void)moveItemAtIndex:(int)from toIndex:(int)to
{
    if (from == to) {
        return;
    }
    
    Story *s = [allItems objectAtIndex:from];
    [allItems removeObjectAtIndex:from];
    [allItems insertObject:s atIndex:to];
}





@end
