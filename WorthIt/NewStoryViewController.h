//
//  NewStoryViewController.h
//  WorthIt
//
//  Created by Aaron Schendel on 2/4/14.
//  Copyright (c) 2014 Aschen Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Story.h"

@interface NewStoryViewController : UIViewController <UITextFieldDelegate>
{
    __weak IBOutlet UITextField *nameField;
    __weak IBOutlet UITextField *subjectField;
    __weak IBOutlet UISwitch *shouldShowProfilePicture;
    __weak IBOutlet UITextView *storyText;
    
}

@property (nonatomic) NSInteger storyIndex;
@property (nonatomic, copy) void (^dismissBlock)(void);
@property (nonatomic, weak) Story *story;

- (IBAction)backgroundTapped:(id)sender;


@end
