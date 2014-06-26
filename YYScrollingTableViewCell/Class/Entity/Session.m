//
//  Session.m
//  YYScrollingTableViewCell
//
//  Created by yoyo on 6/26/14.
//  Copyright (c) 2014 yoyo. All rights reserved.
//

#import "Session.h"

@implementation Session

+(id)sessionWithTitle:(NSString*)title speakerName:(NSString*)speakerName time:(NSString*)time location:(NSString*)location avatarPath:(NSString*)avatarPath trackName:(NSString *)trackName trackColor:(UIColor *)trackColor {
    return [[Session alloc] initWithTitle:title speakerName:speakerName time:time location:location avatarPath:avatarPath trackName:trackName trackColor:trackColor];
}

-(id)initWithTitle:(NSString*)title speakerName:(NSString*)speakerName time:(NSString*)time location:(NSString*)location avatarPath:(NSString*)avatarPath trackName:(NSString *)trackName trackColor:(UIColor *)trackColor {
    if (self = [super init]) {
        _title = title;
        _speakerName = speakerName;
        _time = time;
        _location = location;
        _avatarPath = avatarPath;
        _trackName = trackName;
        _trackColor = trackColor;
    }
    
    return self;
}

@end
