//
//  SessionCVCell.m
//  YYScrollingTableViewCell
//
//  Created by yoyo on 6/26/14.
//  Copyright (c) 2014 yoyo. All rights reserved.
//

#import "SessionCVCell.h"

@implementation SessionCVCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self setup];
    }
    return self;
}

-(void)setup {
    _sessionView = [[SessionView alloc] initWithFrame:self.bounds];
    [_sessionView setAutoresizingMask:
     UIViewAutoresizingFlexibleBottomMargin |
     UIViewAutoresizingFlexibleHeight |
     UIViewAutoresizingFlexibleLeftMargin |
     UIViewAutoresizingFlexibleRightMargin |
     UIViewAutoresizingFlexibleTopMargin |
     UIViewAutoresizingFlexibleWidth];
    
    [self.contentView addSubview:_sessionView];
}

-(void)setBorderColor:(UIColor*)color {
    if (color == nil) {
        color = COLOR_BACKGROUND_INFO;
    }
    
    [self.sessionView.layer setBorderWidth:5];
    [self.sessionView.layer setBorderColor:color.CGColor];
}

+(CGSize)size {
    return CGSizeMake(310, 110);
}

@end
