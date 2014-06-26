//
//  SessionTVCell.h
//  YYScrollingTableViewCell
//
//  Created by yoyo on 6/26/14.
//  Copyright (c) 2014 yoyo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SessionView.h"

@interface SessionTVCell : UITableViewCell

@property (nonatomic, retain) SessionView *sessionView;

-(void)setBorderColor:(UIColor*)color;

+(CGSize)size;


@end
