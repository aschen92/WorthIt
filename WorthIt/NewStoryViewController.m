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

#pragma mark - Initialization Stuff

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        UIBarButtonItem *doneItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(save:)];
        [[self navigationItem] setRightBarButtonItem:doneItem];
        
        UIBarButtonItem *cancelItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(cancel:)];
        
        [[self navigationItem] setLeftBarButtonItem:cancelItem];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

#pragma mark - Button methods

- (void)cancel:(id)sender
{
    [[StoryStore sharedStore] removeItem:[self story]];
    [[self presentingViewController] dismissViewControllerAnimated:YES completion:[self dismissBlock]];
}


- (void)save:(id)sender
{
    [[self presentingViewController] dismissViewControllerAnimated:YES completion:[self dismissBlock]];
    NSLog(@"%@", [[StoryStore sharedStore] allItems]);
}


#pragma mark - Other stuff

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// removes the keyboard when the background is tapped.
- (IBAction)backgroundTapped:(id)sender
{
    [[self view] endEditing:YES];
}
@end
