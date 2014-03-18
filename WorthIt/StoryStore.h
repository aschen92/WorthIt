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

- (void)setAllItems:(NSArray *)newArray;

+ (StoryStore *)sharedStore;
- (void)retrieveStories;

- (void)removeStory:(PFObject *)s;
- (void)removeAllStories;

//changed to mutable from normal array.
- (NSMutableArray *)allItems;
- (PFObject *)createStory;
- (void)moveItemAtIndex:(int)from
                toIndex:(int)to;



- (void)saveChanges;

@end
