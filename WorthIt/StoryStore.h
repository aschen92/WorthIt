//
//  StoryStore.h
//  WorthIt
//
//  Created by Aaron on 1/27/14.
//  Copyright (c) 2014 Aschen Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Parse/Parse.h>

@class Story;

@interface StoryStore : NSObject
{
    NSMutableArray *allItems;
    NSMutableArray *allItemsDictionaryRepr;
    PFObject *ItemList;
}

+ (StoryStore *)sharedStore;
- (void)retrieveStories;

- (void)removeStory:(Story *)s;
- (void)removeAllStories;


- (NSArray *)allItems;
- (Story *)createStory;
- (void)moveItemAtIndex:(int)from
                toIndex:(int)to;
- (NSString *)itemArchivePath;


- (void)saveChanges;

@end
