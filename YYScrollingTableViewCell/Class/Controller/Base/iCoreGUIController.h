//
//  iCoreGUIController.h
//  GloveBox
//
//  Created by appazure on 9/10/13.
//  Copyright (c) 2013 appazure. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface iCoreGUIController : NSObject {
    UIWindow *_window;
}

-(id)initWithWindow:(UIWindow*)window;
-(void)startUp;
-(void)trackWithAction:(NSString*)actoin content:(NSString*)content;

@end
