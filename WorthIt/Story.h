//
//  Story.h
//  WorthIt
//
//  Created by Aaron on 1/27/14.
//  Copyright (c) 2014 Aschen Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Story : NSObject

@property (nonatomic, strong) NSString *text;
@property (nonatomic, strong) NSString *subject;

@property (nonatomic, strong) NSString *datePosted;

@property (nonatomic, strong) UIImage *thumbnail;
@property (nonatomic, strong) NSString *author;

@property (nonatomic, strong) NSString *location;


@end