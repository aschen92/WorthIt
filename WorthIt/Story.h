//
//  Story.h
//  WorthIt
//
//  Created by Aaron on 1/27/14.
//  Copyright (c) 2014 Aschen Inc. All rights reser	ved.
//

#import <Foundation/Foundation.h>

@interface Story : NSObject

@property (nonatomic, strong) NSString *storyText;
@property (nonatomic, strong) NSString *subject;

// should be a NSDate
@property (nonatomic, strong) NSString *datePosted;

@property (nonatomic, strong) UIImage *thumbnail;
@property (nonatomic, strong) NSString *author;

- initWithStorySubject:(NSString *)subject;



@end
