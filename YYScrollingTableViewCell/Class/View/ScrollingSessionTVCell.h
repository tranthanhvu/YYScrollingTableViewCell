//
//  ScrollingSessionTVCell.h
//  YYScrollingTableViewCell
//
//  Created by yoyo on 6/26/14.
//  Copyright (c) 2014 yoyo. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ScrollingSessionTVCellDelegate;
@class Session;
@interface ScrollingSessionTVCell : UITableViewCell <UICollectionViewDataSource, UICollectionViewDelegate> {
    UICollectionView *_collectionView;
    UIScrollView *_scrollView; // it's a paging controller
    int _currentPage;
    CGPoint _contentOffset; // because collectionview will be changed contentsize when cell change frame, so it will  scroll and break interface.
    NSArray *_data;
}

@property (nonatomic, retain) id<ScrollingSessionTVCellDelegate> delegate;
-(void)setData:(NSArray*)arr; // list sessions with 2 dimensions
-(void)scrollToSection:(int)section;

@end

@protocol ScrollingSessionTVCellDelegate <NSObject>

-(void)scrollingSessionTVCell:(ScrollingSessionTVCell*)cell selectedSession:(Session*)session;
-(void)scrollingSessionTVCell:(ScrollingSessionTVCell*)cell currentPageValueChanged:(int)currentPage;

@end