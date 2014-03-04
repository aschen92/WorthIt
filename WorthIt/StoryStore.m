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
            Story *story1 = [[Story alloc] init];
            NSString *aaronsStory = @"My experience at Wartburg College allowed me to succeed in ways that I never though possible. I had one professor that was willing to offer extra help whenever I needed it. The staff in the business office allowed me to actually figure out my loans so that I could pay it off in a timely manner.";
            [story1 setStoryText:@"trollololol"];
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
            
            [story1 updateDict];
            [story2 updateDict];
            
            allItems = [[NSMutableArray alloc] initWithObjects:story1, nil];
            allItemsDictionaryRepr = [[NSMutableArray alloc] initWithObjects:story1.dictionaryRepr, nil];
            if (!ItemList) {
                ItemList = [PFObject objectWithClassName:@"ItemList"];
            }
            
            
            
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
    [allItemsDictionaryRepr addObject:s.dictionaryRepr];
    ItemList[@"itemList"] = allItemsDictionaryRepr;
    [ItemList saveInBackground];
    return s;
}

- (void)removeStory:(Story *)s
{
    [allItems removeObjectIdenticalTo:s];
    ItemList[@"itemList"] = [allItems copy];
}

//helper method for retrieve stories
- (void)removeAllStories
{
    allItems = nil;
}

- (void)retrieveStories
{
//    PFQuery *query = [PFQuery queryWithClassName:@"ItemList"];
//    [query getObjectInBackgroundWithId:@"5s3fccpU2a" block:^(PFObject *itemList, NSError *error) {
//        //do something with the itemList
//        //NSLog(@"%@ doggie", itemList);
//    }];
    PFQuery *query = [PFQuery queryWithClassName:@"ItemList"];
    [query whereKey:@"itemList" equalTo:@"itemList"];
    [query findObjectsInBackgroundWithBlock:^(NSArray *storiesList, NSError *error) {
        if (!error) {
            //worked!
            NSLog(@"got this list of stories %lu", (unsigned long)storiesList.count);
        }
        else {
            NSLog(@"kitty");
        }
    }];
    NSMutableArray *storyDictList = ItemList[@"itemList"];
    NSMutableArray *storyList = [[NSMutableArray alloc] init];

    for (Story *story in ItemList[@"itemList"]) {
        Story *s = [[StoryStore sharedStore] createStory];
        s.author = [story valueForKey:@"author"];
        s.storyText = [story valueForKey:@"storyText"];
        s.datePosted = [story valueForKey:@"datePosted"];
        s.subject = [story valueForKey:@"subject"];
        NSLog(@"%@", s);
        [storyList addObject:s];
        }
    
    //self.removeAllStories;
    
    for (Story *s in storyList){
        [allItems addObject:s];
    }
    
    
    
}

- (void)saveChanges
{
    [ItemList saveInBackground];
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

- (NSString *)itemArchivePath
{
    NSArray *documentDirectories = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docDirectory = [documentDirectories objectAtIndex:0];
    return [docDirectory stringByAppendingPathComponent:@"store.data"];
}



@end
