//
//  iCoreGUIController.m
//  GloveBox
//
//  Created by appazure on 9/10/13.
//  Copyright (c) 2013 appazure. All rights reserved.
//

#import "iCoreGUIController.h"

@interface iCoreGUIController () {
}

@end

@implementation iCoreGUIController

-(id)initWithWindow:(UIWindow *)window {
    if (self = [super init]) {
        _window = window;
    }
    
    return self;
}

-(void)startUp {
    [self appearance];
    
    // initialize view controllers
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard-iPhone" bundle:nil];
    UIViewController *vc = [storyboard instantiateInitialViewController];
    
    [_window setRootViewController:vc];
}

-(void)appearance {
//    // set background color of navigation bar
//    [[UINavigationBar appearance] setBarTintColor:COLOR_NAVI_BAR];
//    
    // set color of controls on navigation bar
//    [[UINavigationBar appearance] setTintColor:COLOR_BUTT_BAR];
    
    // set attributes of the title on navigation bar
//    [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName : COLOR_TITLE_BAR}];
//
//    // set color of selected tab on tabbar
//    [[UITabBar appearance] setTintColor:COLOR_BUTT_BAR];
//
//    // color for all
//    [_window setTintColor:COLOR_BUTT_BAR];
}

#pragma mark - Tracking
-(void)trackWithAction:(NSString*)actoin content:(NSString*)content {
//    NSMutableDictionary *event = [[[GAIDictionaryBuilder createAppView] set:content forKey:kGAIScreenName] build];
//    
//    [[GAI sharedInstance].defaultTracker send:event];
//    [[GAI sharedInstance] dispatch];
//    
//    [Flurry logEvent:content];
}

@end
