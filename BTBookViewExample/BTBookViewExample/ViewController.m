//
//  ViewController.m
//  BTBookView
//
//  Created by Byte on 10/28/13.
//  Copyright (c) 2013 Byte. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
{
    int _numberOfImages;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        _numberOfImages = 8;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    BTPageView *page1 = [BTPageView pageViewWithImage:nil index:0 showShadow:NO]; // Blank Space
    BTPageView *page2 = [BTPageView pageViewWithImage:[UIImage imageNamed:@"1"] index:1 showShadow:NO];
    
    NSArray *viewControllersArray = @[page1, page2];
    
    BTBookView *bookView = [[BTBookView alloc] initWithFrame:CGRectZero	initialViewControllers:viewControllersArray];
    [bookView setTranslatesAutoresizingMaskIntoConstraints:NO];
    [bookView.pageViewController setDataSource:self];
    [self.view addSubview:bookView];

    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-(40)-[bookView]-(40)-|" options:0 metrics:0 views:NSDictionaryOfVariableBindings(bookView)]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-(40)-[bookView]-(40)-|" options:0 metrics:0 views:NSDictionaryOfVariableBindings(bookView)]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Delegate
#pragma mark - Datasource
- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
    int index = [(BTPageView *)viewController index] + 1;
    if (index > _numberOfImages+1) {
        return nil;
    }
    
    return [BTPageView pageViewWithImage:[UIImage imageNamed:@(index).stringValue] index:index showShadow:index < _numberOfImages];
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
    int index = [(BTPageView *)viewController index] - 1;
    if (index < 0) {
        return nil;
    }

    return [BTPageView pageViewWithImage:[UIImage imageNamed:@(index).stringValue] index:index showShadow:index > 1];
}


@end
