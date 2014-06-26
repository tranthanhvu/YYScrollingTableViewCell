//
//  SessionTVCell.m
//  YYScrollingTableViewCell
//
//  Created by yoyo on 6/26/14.
//  Copyright (c) 2014 yoyo. All rights reserved.
//

#import "SessionTVCell.h"

@implementation SessionTVCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        [self setup];
    }
    return self;
}

-(void)setup {
    _sessionView = [[SessionView alloc] initWithFrame:self.frame];
    [_sessionView setAutoresizingMask:
     UIViewAutoresizingFlexibleBottomMargin |
     UIViewAutoresizingFlexibleHeight |
     UIViewAutoresizingFlexibleLeftMargin |
     UIViewAutoresizingFlexibleRightMargin |
     UIViewAutoresizingFlexibleTopMargin |
     UIViewAutoresizingFlexibleWidth];
    
    [self.contentView addSubview:_sessionView];
    
    [self setSelectionStyle:UITableViewCellSelectionStyleNone];
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

-(void)setBorderColor:(UIColor*)color {
    if (color == nil) {
        color = COLOR_BACKGROUND_INFO;
    }
    
    [self.contentView.layer setBorderWidth:5];
    [self.contentView.layer setBorderColor:color.CGColor];
}

+(CGSize)size {
    return CGSizeMake(320, 110);
}

@end
