//
//  SessionView.m
//  YYScrollingTableViewCell
//
//  Created by yoyo on 6/26/14.
//  Copyright (c) 2014 yoyo. All rights reserved.
//

#import "SessionView.h"

@implementation SessionView

- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        // Initialization code
        [self setup];
    }
    
    return self;
}

-(id)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        // Initialization code
        [self setup];
    }
    
    return self;
}

-(void)setup {
    UIView *view = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self.class) owner:self options:nil] objectAtIndex:0];
    [view setFrame:self.frame];
    [self addSubview:view];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
