//
//  HomeViewController.m
//  WorthIt
//
//  Created by Aaron Schendel on 1/21/14.
//  Copyright (c) 2014 Aschen Inc. All rights reserved.
//

#import "HomeViewController.h"
#import "StoriesViewController.h"
#import "StoryDetailViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    NSBundle *appBundle = [NSBundle mainBundle];
    self = [super initWithNibName:@"HomeViewController" bundle:appBundle];
    if (self) {
        
        
    }
    return self;
}

- (void)watchVideo:(id)sender
{
//    NSURL *url = [[NSURL alloc] initWithString: @"https://www.youtube.com/watch?v=_fZ5Vo3WWQQ"];
//    [[UIApplication sharedApplication] openURL:url];
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"worth_it" ofType:@"mp4"];
    player = [[MPMoviePlayerViewController alloc] initWithContentURL:[NSURL fileURLWithPath:path]];
    
    
    
    [self presentMoviePlayerViewControllerAnimated:player];
    

}

- (IBAction)showStories:(id)sender
{
    StoriesViewController *svc = [[StoriesViewController alloc] init];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:svc];
    
    [self presentViewController:nav animated:YES completion:nil];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
