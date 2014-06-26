//
//  ScheduleViewController.h
//  YYScrollingTableViewCell
//
//  Created by yoyo on 6/26/14.
//  Copyright (c) 2014 yoyo. All rights reserved.
//

#import "YYViewController.h"

@interface ScheduleViewController : YYViewController <UITableViewDataSource, UITableViewDelegate> {
    IBOutlet UITableView *_tableView;
    NSArray *_data;
}

@end
