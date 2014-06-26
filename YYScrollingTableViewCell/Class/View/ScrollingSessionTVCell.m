//
//  ScrollingSessionTVCell.m
//  YYScrollingTableViewCell
//
//  Created by yoyo on 6/26/14.
//  Copyright (c) 2014 yoyo. All rights reserved.
//

#import "ScrollingSessionTVCell.h"
#import "TrackHeaderCVCell.h"
#import "SessionCVCell.h"
#import "NSArray+ArrayOfArray.h"
#import "Session.h"

@implementation ScrollingSessionTVCell
static NSString *identifierSession = @"identifierSession";
static NSString *identifierHeader = @"identifierHeader";

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
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
    // Set flowLayout for CollectionView
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    flowLayout.itemSize = [SessionCVCell size];
    flowLayout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
    flowLayout.minimumLineSpacing = 0;
    flowLayout.minimumInteritemSpacing = 0;
    
    float padding = (self.frame.size.width - [SessionCVCell size].width) * 0.5;
    
    // Init and Set CollectionView
    _collectionView = [[UICollectionView alloc] initWithFrame:self.bounds
                                         collectionViewLayout:flowLayout];
    [_collectionView setClipsToBounds:YES];
    [_collectionView setAutoresizingMask:
     UIViewAutoresizingFlexibleLeftMargin |
     UIViewAutoresizingFlexibleWidth |
     UIViewAutoresizingFlexibleRightMargin |
     UIViewAutoresizingFlexibleTopMargin |
     UIViewAutoresizingFlexibleHeight |
     UIViewAutoresizingFlexibleBottomMargin ];
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    _collectionView.showsHorizontalScrollIndicator = NO;
    [self.contentView addSubview:_collectionView];
    [_collectionView setContentInset:UIEdgeInsetsMake(0, padding, 0, padding)];
    
    [_collectionView setBackgroundColor:COLOR_BACKGROUND_INFO];
    [_collectionView registerClass:[SessionCVCell class] forCellWithReuseIdentifier:identifierSession];
    [_collectionView registerClass:[TrackHeaderCVCell class] forCellWithReuseIdentifier:identifierHeader];
    
    // setup UIScrollView
    _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0,
                                                                 [SessionCVCell size].width,
                                                                 [SessionCVCell size].height)];
    [_scrollView setAutoresizingMask:
     UIViewAutoresizingFlexibleLeftMargin |
     UIViewAutoresizingFlexibleWidth |
     UIViewAutoresizingFlexibleRightMargin |
     UIViewAutoresizingFlexibleTopMargin |
     UIViewAutoresizingFlexibleHeight |
     UIViewAutoresizingFlexibleBottomMargin ];
    [_scrollView setDelegate:self];
    [_scrollView setPagingEnabled:YES];
    
    // Move your gesture recognizer
    // Add the scrollview’s gesture recognizer to the collection view, and disable the collection view’s gesture recognizer:
    [_collectionView addGestureRecognizer:_scrollView.panGestureRecognizer];
    _collectionView.panGestureRecognizer.enabled = NO;
    
    [self.contentView setClipsToBounds:YES];
    
    _currentPage = 0;
    _contentOffset = CGPointMake(-5, 0);
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

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (scrollView == _scrollView) { //ignore collection view scrolling callbacks
        _contentOffset = scrollView.contentOffset;
        _contentOffset.x = _contentOffset.x - _collectionView.contentInset.left;
    }
//    NSLog(@"%f", _contentOffset.x);
    _collectionView.contentOffset = _contentOffset;
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    if (scrollView == _scrollView) {
        if (_delegate && [_delegate respondsToSelector:@selector(scrollingSessionTVCell:currentPageValueChanged:)]) {
            
            _currentPage = scrollView.contentOffset.x / scrollView.frame.size.width;
            
            [_delegate scrollingSessionTVCell:self currentPageValueChanged:_currentPage];
        }
    }
}

-(void)setData:(NSArray*)arr {
    _data = arr;
    [_scrollView setContentSize:CGSizeMake(_scrollView.frame.size.width * _data.count,
                                           _scrollView.frame.size.height)];
    
    [_collectionView reloadData];
}

-(void)scrollToSection:(int)section {
    [_scrollView scrollRectToVisible:CGRectMake(section * _scrollView.frame.size.width, 0,
                                                _scrollView.frame.size.width,
                                                _scrollView.frame.size.height) animated:YES];
}

#pragma mark - UICollectionViewDataSource
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return _data.count;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    NSArray *arr = [_data objectAtIndex:section];
    return arr.count + 1;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        // header
        Session *firstSession = [_data objectAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:indexPath.section]];
        
        TrackHeaderCVCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifierHeader forIndexPath:indexPath];
        
        NSString *title = [NSString stringWithFormat:@"Track %d %@", indexPath.section + 1, firstSession.trackName];
        [cell.lblTrack setText:title.uppercaseString];
        [cell setBackgroundColor:firstSession.trackColor];
        
        return cell;
    } else {
        Session *session = [_data objectAtIndexPath:[NSIndexPath indexPathForRow:indexPath.row - 1 inSection:indexPath.section]];
        
        SessionCVCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifierSession forIndexPath:indexPath];
        
        [cell.sessionView.lblSpeakerName setText:session.speakerName];
        [cell.sessionView.imgAvatar setImage:[UIImage imageNamed:session.avatarPath]];
        [cell.sessionView.lblName setText:session.title];
        [cell.sessionView.lblTime setText:session.time];
        [cell.sessionView.lblLocation setText:session.location];
        
        [cell setBorderColor:session.trackColor];
        
        return cell;
    }
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        // header
        return [TrackHeaderCVCell size];
    } else {
        return [SessionCVCell size];
    }
}

#pragma mark - UICollectionViewDataDelegate
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if (_delegate && [_delegate respondsToSelector:@selector(scrollingSessionTVCell:selectedSession:)]) {
        Session *session = [_data objectAtIndexPath:indexPath];
        [_delegate scrollingSessionTVCell:self selectedSession:session];
    }
}


@end
