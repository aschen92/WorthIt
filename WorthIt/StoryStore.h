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
}

+ (StoryStore *)sharedStore;
- (void)retrieveStories;

- (void)removeStory:(PFObject *)s;
- (void)removeAllStories;


- (NSArray *)allItems;
- (PFObject *)createStory;
- (void)moveItemAtIndex:(int)from
                toIndex:(int)to;
- (NSString *)itemArchivePath;


- (void)saveChanges;

@end
