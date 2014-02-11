//
//  StoryStore.m
//  WorthIt
//
//  Created by Aaron on 1/27/14.
//  Copyright (c) 2014 Aschen Inc. All rights reserved.
//

#import "StoryStore.h"
#import "Story.h"


@implementation StoryStore

#pragma mark - Init overriding

- (id)init
{
    self = [super init];
    if (self) {
        NSString *path = [self itemArchivePath];
        allItems = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
        
        if (!allItems) {
            //allItems = [[NSMutableArray alloc] init];
            Story *story1 = [[Story alloc] init];
            NSString *aaronsStory = @"My experience at Wartburg College allowed me to succeed in ways that I never though possible. I had one professor that was willing to offer extra help whenever I needed it. The staff in the business office allowed me to actually figure out my loans so that I could pay it off in a timely manner.";
            [story1 setStoryText:aaronsStory];
            [story1 setSubject:@"Wartburg Choir"];
            [story1 setDatePosted:@"1/20/14"];
            [story1 setAuthor:@"Aaron Schendel"];
            [story1 setThumbnail:[UIImage imageNamed:@"aaron_pic.jpg"]];
            
            Story *story2 = [[Story alloc] init];
            [story2 setStoryText:@"Adam's Story Text"];
            [story2 setSubject:@"Wartburg Track and Field"];
            [story2 setDatePosted:@"1/25/14"];
            [story2 setAuthor:@"Adam Kucera"];
            [story2 setThumbnail:[UIImage imageNamed:@"adam_pic.jpg"]];
            
            Story *story3 = [[Story alloc] init];
            [story3 setStoryText:@"Brett's Story Text"];
            [story3 setSubject:@"Financial Aid Packages"];
            [story3 setDatePosted:@"1/28/14"];
            [story3 setAuthor:@"Brett Peterson"];
            [story3 setThumbnail:[UIImage imageNamed:@"brett_pic.jpg"]];
            
            Story *story4 = [[Story alloc] init];
            [story4 setStoryText:@"Chris' Story Text"];
            [story4 setSubject:@"Mensa Food"];
            [story4 setDatePosted:@"1/30/14"];
            [story4 setAuthor:@"Chris Smith"];
            [story4 setThumbnail:[UIImage imageNamed:@"chris_pic.jpg"]];
            
            allItems = [[NSMutableArray alloc] initWithObjects:story1, story2, story3, story4, nil];
            
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

- (Story *)createStory
{
    Story *s = [[Story alloc] init];
    [allItems addObject:s];
    return s;
}

+ (StoryStore *)sharedStore
{
    static StoryStore *sharedStore = nil;
    if (!sharedStore) {
        sharedStore = [[super allocWithZone:nil] init];
    }
    return sharedStore;
}

- (void)removeStory:(Story *)s
{
    [allItems removeObjectIdenticalTo:s];
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

- (NSString *)itemArchivePath
{
    NSArray *documentDirectories = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docDirectory = [documentDirectories objectAtIndex:0];
    return [docDirectory stringByAppendingPathComponent:@"store.data"];
}






@end
