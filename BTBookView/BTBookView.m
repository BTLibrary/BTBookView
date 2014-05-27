//
//  BTBookView.m
//  BTBookView
//
//  Created by Byte on 10/28/13.
//  Copyright (c) 2013 Byte. All rights reserved.
//

#import "BTBookView.h"


@implementation BTBookView

- (id)initWithFrame:(CGRect)frame initialViewControllers:(NSArray *)viewControllersArray
{
    self = [super initWithFrame:frame];
    if (self) {
        NSDictionary *options = [NSDictionary dictionaryWithObject: [NSNumber numberWithInt:UIPageViewControllerSpineLocationMid] forKey:UIPageViewControllerOptionSpineLocationKey];
        _pageViewController = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStylePageCurl navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:options];
        [_pageViewController.view.layer setShadowOpacity:.6];
        [_pageViewController.view.layer setShadowRadius:3];
        [_pageViewController.view.layer setShadowOffset:CGSizeMake(0, 3)];
        [_pageViewController.view setFrame:self.bounds];
        [_pageViewController setViewControllers:viewControllersArray direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
        [self addSubview:_pageViewController.view];
    }
    return self;
}

- (void)addShadowPagesWithWhite:(CGFloat)white parallaxIntensity:(CGFloat)parallaxIntensity
{
    UIView *shadowView = [[UIView alloc] init];
    [shadowView setTranslatesAutoresizingMaskIntoConstraints:NO];
    [shadowView setBackgroundColor:[UIColor colorWithWhite:white alpha:1]];
    [self addSubview:shadowView];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[shadowView]|" options:0 metrics:0 views:NSDictionaryOfVariableBindings(shadowView)]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[shadowView]|" options:0 metrics:0 views:NSDictionaryOfVariableBindings(shadowView)]];
}

@end


@implementation BTPageView

+ (instancetype)pageViewWithImage:(UIImage *)image index:(int)index showShadow:(BOOL)showShadow
{
    BTPageView *pageView = [[BTPageView alloc] init];
    pageView.index = index;
    
    //when images are not available, return blank
    if (!image) {
        pageView.view.backgroundColor = [UIColor clearColor];
        return pageView;
    }
    
    pageView.imageView = [[UIImageView alloc] initWithImage:image];
    [pageView.imageView setTranslatesAutoresizingMaskIntoConstraints:NO];
    [pageView.view addSubview:pageView.imageView];
    
    if (showShadow) {
        [pageView addDividerShadowFromLeft:index%2];
        [pageView addPageShadowFromLeft:(index+1)%2];
    }
    
    
    UIImageView *refImageView = pageView.imageView;
    [pageView.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[refImageView]|" options:0 metrics:0 views:NSDictionaryOfVariableBindings(refImageView)]];
    [pageView.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[refImageView]|" options:0 metrics:0 views:NSDictionaryOfVariableBindings(refImageView)]];
    
    return pageView;
}

- (void)addDividerShadowFromLeft:(BOOL)fromLeft;
{
    UIView *shadowView = [[UIView alloc] init];
    [shadowView setBackgroundColor:[UIColor clearColor]];
    [shadowView setTranslatesAutoresizingMaskIntoConstraints:NO];
    [shadowView setClipsToBounds:YES];
    [self.view addSubview:shadowView];
    
    if (fromLeft) {
        [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[shadowView(40)]" options:0 metrics:0 views:NSDictionaryOfVariableBindings(shadowView)]];
    }else{
        [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[shadowView(40)]|" options:0 metrics:0 views:NSDictionaryOfVariableBindings(shadowView)]];
    }
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[shadowView]|" options:0 metrics:0 views:NSDictionaryOfVariableBindings(shadowView)]];
    
    // Shadow distribution
    CGFloat g1 = 0.0;
    CGFloat g2 = 0.33;
    CGFloat g3 = 0.66;
    CGFloat g4 = 1;
    UIColor *c1 = [UIColor colorWithWhite:0 alpha:.7];
    UIColor *c2 = [UIColor colorWithWhite:0 alpha:.4];
    UIColor *c3 = [UIColor colorWithWhite:0 alpha:.1];
    UIColor *c4 = [UIColor colorWithWhite:0 alpha:.0];
    
    CAGradientLayer *shadowLayer = [CAGradientLayer layer];
    shadowLayer.anchorPoint = CGPointZero;
    shadowLayer.startPoint = CGPointMake(0.0f, 0.5f);
    shadowLayer.endPoint = CGPointMake(1.0f, 0.5f);

    if (fromLeft) {
        shadowLayer.colors = @[(id)c1.CGColor, (id)c2.CGColor, (id)c3.CGColor, (id)c4.CGColor];
        shadowLayer.locations = @[@(g1), @(g2), @(g3), @(g4)];
    }else{
        shadowLayer.colors = @[(id)c4.CGColor, (id)c3.CGColor, (id)c2.CGColor, (id)c1.CGColor];
        shadowLayer.locations = @[@(g1), @(g2), @(g3), @(g4)];
    }
    
    shadowLayer.frame = CGRectMake(0, 0, 40, self.view.frame.size.height);
    [shadowView.layer addSublayer:shadowLayer];
}

- (void)addPageShadowFromLeft:(BOOL)fromLeft;
{
    UIView *shadowView = [[UIView alloc] init];
    [shadowView setBackgroundColor:[UIColor clearColor]];
    [shadowView setTranslatesAutoresizingMaskIntoConstraints:NO];
    [shadowView setClipsToBounds:YES];
    [self.view addSubview:shadowView];
    
    if (fromLeft) {
        [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[shadowView(150)]" options:0 metrics:0 views:NSDictionaryOfVariableBindings(shadowView)]];
    }else{
        [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[shadowView(150)]|" options:0 metrics:0 views:NSDictionaryOfVariableBindings(shadowView)]];
    }
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[shadowView]|" options:0 metrics:0 views:NSDictionaryOfVariableBindings(shadowView)]];
    
    // Shadow distribution
    CGFloat g1 = 0.0;
    CGFloat g2 = 1;
    UIColor *c1 = [UIColor colorWithWhite:0 alpha:.3];
    UIColor *c2 = [UIColor colorWithWhite:0 alpha:.0];
    
    CAGradientLayer *shadowLayer = [CAGradientLayer layer];
    shadowLayer.anchorPoint = CGPointZero;
    shadowLayer.startPoint = CGPointMake(0.0f, 0.5f);
    shadowLayer.endPoint = CGPointMake(1.0f, 0.5f);
    
    if (fromLeft) {
        shadowLayer.colors = @[(id)c1.CGColor, (id)c2.CGColor];
        shadowLayer.locations = @[@(g1), @(g2)];
    }else{
        shadowLayer.colors = @[(id)c2.CGColor, (id)c1.CGColor];
        shadowLayer.locations = @[@(g1), @(g2)];
    }
    
    shadowLayer.frame = CGRectMake(0, 0, 150, self.view.frame.size.height);
    [shadowView.layer addSublayer:shadowLayer];
}

@end
