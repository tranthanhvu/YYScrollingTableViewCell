//
//  TrackHeaderCVCell.m
//  YYScrollingTableViewCell
//
//  Created by yoyo on 6/26/14.
//  Copyright (c) 2014 yoyo. All rights reserved.
//

#import "TrackHeaderCVCell.h"

@implementation TrackHeaderCVCell

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
        [self setup];
    }
    
    return self;
}

-(void)setup {
    _lblTrack = [[UILabel alloc] initWithFrame:CGRectMake(5, 0, self.bounds.size.width - 10, self.bounds.size.height)];
    [_lblTrack setNumberOfLines:2];
    [self.contentView addSubview:_lblTrack];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

+(CGSize)size {
    return CGSizeMake(310, 44);
}

@end
