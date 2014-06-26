//
//  Session.h
//  YYScrollingTableViewCell
//
//  Created by yoyo on 6/26/14.
//  Copyright (c) 2014 yoyo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Session : NSObject

@property (nonatomic, retain) NSString *title;
@property (nonatomic, retain) NSString *speakerName;
@property (nonatomic, retain) NSString *time;
@property (nonatomic, retain) NSString *location;
@property (nonatomic, retain) NSString *avatarPath;
@property (nonatomic, retain) NSString *trackName;
@property (nonatomic, retain) UIColor *trackColor;

+(id)sessionWithTitle:(NSString*)title speakerName:(NSString*)speakerName time:(NSString*)time location:(NSString*)location avatarPath:(NSString*)avatarPath trackName:(NSString*)trackName trackColor:(UIColor*)trackColor;
-(id)initWithTitle:(NSString*)title speakerName:(NSString*)speakerName time:(NSString*)time location:(NSString*)location avatarPath:(NSString*)avatarPath trackName:(NSString*)trackName trackColor:(UIColor*)trackColor;

@end
