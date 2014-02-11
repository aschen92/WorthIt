//
//  NewStoryViewController.m
//  WorthIt
//
//  Created by Aaron Schendel on 2/4/14.
//  Copyright (c) 2014 Aschen Inc. All rights reserved.
//

#import "NewStoryViewController.h"
#import "StoryStore.h"

@interface NewStoryViewController ()

@end

@implementation NewStoryViewController
@synthesize story;
@synthesize storyIndex;
@synthesize dismissBlock;
@synthesize nameField, subjectField, locationField, shouldShowProfilePicture, storyTextField;

#pragma mark - Initialization Stuff

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        UIBarButtonItem *cancelItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(cancel:)];
        UIBarButtonItem *saveItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(save:)];
        
        [[self navigationItem] setLeftBarButtonItem:cancelItem];
        [[self navigationItem] setRightBarButtonItem:saveItem];
        
        // Wartburg Orange - #FF6F30
        [self.view setBackgroundColor:[UIColor colorWithRed:1 green:0.435 blue:0.188 alpha:1.0]];
        
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [[self view] endEditing:YES];
    
    [story setSubject:[subjectField text]];
    [story setStoryText:[storyTextField text]];
    [story setAuthor:[nameField text]];
    
    
    // set the creation date with an NSDate object lol
    
    // checks to see if the user wants to use their own picture as a display img
    if ([shouldShowProfilePicture isOn]) {
        //code to set facebook profile pic as thumbnail
    } else {
        // use brett's dog.
    }
}

#pragma mark - Button methods

- (void)cancel:(id)sender
{
    [[StoryStore sharedStore] removeStory:[self story]];
    [[self presentingViewController] dismissViewControllerAnimated:YES completion:dismissBlock];
}


- (void)save:(id)sender
{
    //story = [[[StoryStore sharedStore] allItems] objectAtIndex:self.storyIndex];
    
    


    
    [[self presentingViewController] dismissViewControllerAnimated:YES completion:dismissBlock];
}


#pragma mark - Other stuff

//- (void)setStoryIndex:(NSInteger)storyIndex:
//{
//    [self storyIndex] = storyIndex;
//}

// removes the keyboard when the background is tapped.
- (IBAction)backgroundTapped:(id)sender
{
    [[self view] endEditing:YES];
}
@end
