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
    NSURL *url = [ [ NSURL alloc ] initWithString: @"http://www.youtube.com" ];
    [[UIApplication sharedApplication] openURL:url];

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
