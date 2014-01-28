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

- (void)addItem:(Story *)s
{
    [allItems addObject:s];
}

+ (StoryStore *)sharedStore
{
    static StoryStore *sharedStore = nil;
    if (!sharedStore) {
        sharedStore = [[super allocWithZone:nil] init];
    }
    return sharedStore;
}

- (void)removeItem:(Story *)s
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

// FIX THIS SO THAT CHANGES ARE SAVED
//- (BOOL)saveChanges
//{
//    NSError *err = nil;
//    BOOL successful = [context save:&err];
//    if (!successful) {
//        NSLog(@"Error saving: %@", [err localizedDescription]);
//    }
//    return successful;
//}





@end
