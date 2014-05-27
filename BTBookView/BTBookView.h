//
//  BTBookView.h
//  BTBookView
//
//  Created by Byte on 10/28/13.
//  Copyright (c) 2013 Byte. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BTBookView : UIView
@property (strong, nonatomic) UIPageViewController *pageViewController;
// 'frame' is there if you need it, I suggest use Auto Layout
- (id)initWithFrame:(CGRect)frame initialViewControllers:(NSArray *)viewControllersArray;
@end

@interface BTPageView : UIViewController
@property (strong, nonatomic) UIImageView *imageView;
@property (assign, nonatomic) int index;
// Blank page also counts as +1 index
+ (instancetype)pageViewWithImage:(UIImage *)image index:(int)index showShadow:(BOOL)showShadow;
@end
