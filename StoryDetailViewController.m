//
//  StoryDetailViewController.m
//  WorthIt
//
//  Created by Aaron Schendel on 1/21/14.
//  Copyright (c) 2014 Aschen Inc. All rights reserved.
//

#import "StoryDetailViewController.h"
#import "Story.h"
#import "StoryStore.h"

@implementation StoryDetailViewController
@synthesize story, dismissBlock;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        UINavigationItem *nav = [self navigationItem];
        NSString *title = [[NSString alloc] initWithFormat:@"%@'s Story", [story author]];
        [nav setTitle:title];
        
        // Wartburg Orange - #FF6F30
        [self.view setBackgroundColor:[UIColor colorWithRed:1 green:0.435 blue:0.188 alpha:1.0]];
    }
    return self;
}


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    
    //[subjectField setText:[NSString stringWithFormat:@"%@'s Worth It Story", [story author]]];
    [storyTextField setText:[story storyText]];
    [subjectField setFont:[UIFont systemFontOfSize:17.0f]];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    // Makes it so that there isn't a space before the UITextView
    self.automaticallyAdjustsScrollViewInsets = NO;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (id)initWithNewStory:(BOOL)isNew
{
    self = [super initWithNibName:@"StoryDetailViewController" bundle:nil];
    
    if (self) {
        if (isNew) {
            UIBarButtonItem *doneItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(save:)];
            [[self navigationItem] setRightBarButtonItem:doneItem];
            
            UIBarButtonItem *cancelItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(cancel:)];
            
            [[self navigationItem] setLeftBarButtonItem:cancelItem];
        }
    }
    return self;
    
}

- (void)save:(id)sender
{
    [[self presentingViewController] dismissViewControllerAnimated:YES completion:dismissBlock];
}

- (void)cancel:(id)sender
{
    [[StoryStore sharedStore] removeItem:story];
    [[self presentingViewController] dismissViewControllerAnimated:YES completion:dismissBlock];
}



@end
