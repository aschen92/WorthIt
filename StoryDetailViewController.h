//
//  StoryDetailViewController.h
//  WorthIt
//
//  Created by Aaron Schendel on 1/21/14.
//  Copyright (c) 2014 Aschen Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Story;

@interface StoryDetailViewController : UIViewController <UINavigationControllerDelegate, UITextFieldDelegate>
{
    
    __weak IBOutlet UITextView *storyTextField;
    __weak IBOutlet UILabel *subjectField;
    
    
    
}



@property (nonatomic, strong) Story *story;
@property (nonatomic, copy) void (^dismissBlock)(void);


@end
