//
//  StoryCell.m
//  WorthIt
//
//  Created by Aaron Schendel on 1/22/14.
//  Copyright (c) 2014 Aschen Inc. All rights reserved.
//

#import "StoryCell.h"

@implementation StoryCell
@synthesize controller, tableView;

- (id)init
{
    self = [super init];
    
    if (self) {
        self.contentView.backgroundColor = [UIColor colorWithRed:1 green:0.435 blue:0.188 alpha:1.0];
    }
    return self;
}





@end
