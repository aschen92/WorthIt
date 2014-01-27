//
//  Story.h
//  WorthIt
//
//  Created by Aaron on 1/27/14.
//  Copyright (c) 2014 Aschen Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Story : NSObject

@property (nonatomic, weak) NSString *storyText;
@property (nonatomic, weak) NSString *subject;

// should be a NSDate
@property (nonatomic, weak) NSString *datePosted;

@property (nonatomic, weak) UIImage *thumbnail;

@end
