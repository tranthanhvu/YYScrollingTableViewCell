//
//  YYAppDelegate.h
//  YYScrollingTableViewCell
//
//  Created by yoyo on 6/19/14.
//  Copyright (c) 2014 yoyo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "iCoreGUIController.h"

@interface YYAppDelegate : UIResponder <UIApplicationDelegate>

@property (nonatomic, strong) iCoreGUIController *mainGUIController;

@property (strong, nonatomic) UIWindow *window;

+(YYAppDelegate*)shareAppDelegate;
+(iCoreGUIController*)shareMainGUI;

@end
