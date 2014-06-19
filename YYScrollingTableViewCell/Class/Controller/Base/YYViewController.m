//
//  YYViewController.m
//  YYScrollingTableViewCell
//
//  Created by yoyo on 6/19/14.
//  Copyright (c) 2014 yoyo. All rights reserved.
//

#import "YYViewController.h"

@interface YYViewController ()

@end

@implementation YYViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    [self tracking];
}

-(void)tracking {
}

-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}

#pragma mark - Rotate
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (BOOL)shouldAutorotate {
    return NO;
}

- (NSUInteger)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskPortrait;
}

@end

@implementation UIViewController (SelectedTabBarItemImage)

- (void)setSelectedTabBarItemImage:(NSString *)imageName {
    self.tabBarItem.selectedImage = [UIImage imageNamed:imageName];
}

@end
