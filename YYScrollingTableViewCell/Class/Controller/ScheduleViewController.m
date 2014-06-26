//
//  ScheduleViewController.m
//  YYScrollingTableViewCell
//
//  Created by yoyo on 6/26/14.
//  Copyright (c) 2014 yoyo. All rights reserved.
//

#import "ScheduleViewController.h"
#import "ScrollingSessionTVCell.h"
#import "SessionTVCell.h"
#import "SessionCVCell.h"
#import "TrackHeaderCVCell.h"
#import "Session.h"

@interface ScheduleViewController () <ScrollingSessionTVCellDelegate> {
    NSMutableArray *_listCurrentPages;
}

@end

@implementation ScheduleViewController
static NSString *identifierSession = @"identifierSession";
static NSString *identifierSessionRest = @"identifierSessionRest";
static NSString *identifierMultiSession = @"identifierMultiSession";


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _data =
    @[
      @[
          [Session sessionWithTitle:@"Title 1" speakerName:@"speaker 1" time:@"9:00 AM - 10:00 AM" location:@"Location 1" avatarPath:@"yoyo1" trackName:@"Track 1" trackColor:[UIColor colorWithRed:0.5 green:1 blue:0.5 alpha:1]]
          ],
      @[
          @[
              [Session sessionWithTitle:@"Title 2" speakerName:@"speaker 2" time:@"10:00 AM - 10:30 AM" location:@"Location 2" avatarPath:@"yoyo1" trackName:@"Track 2" trackColor:[UIColor colorWithRed:0 green:122.f/255.f blue:1.f alpha:1.f]],
              [Session sessionWithTitle:@"Title 3" speakerName:@"speaker 3" time:@"10:00 AM - 10:30 AM" location:@"Location 1" avatarPath:@"yoyo1" trackName:@"Track 1" trackColor:[UIColor colorWithRed:0 green:122.f/255.f blue:1.f alpha:1.f]]
              ],
          @[
              [Session sessionWithTitle:@"Title 1" speakerName:@"speaker 1" time:@"10:00 AM - 10:30 AM" location:@"Location 1" avatarPath:@"yoyo3" trackName:@"Track 1" trackColor:[UIColor colorWithRed:0.1 green:0.3 blue:0.2 alpha:1]]
              ],
          @[
              [Session sessionWithTitle:@"Title 1" speakerName:@"speaker 1" time:@"10:00 AM - 10:30 AM" location:@"Location 1" avatarPath:@"yoyo2" trackName:@"Track 1" trackColor:[UIColor colorWithRed:123.f/255.f green:137.f/255.f blue:148.f/255.f alpha:1.f]],
              [Session sessionWithTitle:@"Title 1" speakerName:@"speaker 1" time:@"10:00 AM - 10:30 AM" location:@"Location 1" avatarPath:@"yoyo2" trackName:@"Track 1" trackColor:[UIColor colorWithRed:123.f/255.f green:137.f/255.f blue:148.f/255.f alpha:1.f]],
              [Session sessionWithTitle:@"Title 1" speakerName:@"speaker 1" time:@"10:00 AM - 10:30 AM" location:@"Location 1" avatarPath:@"yoyo2" trackName:@"Track 1" trackColor:[UIColor colorWithRed:123.f/255.f green:137.f/255.f blue:148.f/255.f alpha:1.f]]
              ],
          @[
              [Session sessionWithTitle:@"Title 1" speakerName:@"speaker 1" time:@"10:00 AM - 10:30 AM" location:@"Location 1" avatarPath:@"yoyo4" trackName:@"Track 1" trackColor:[UIColor colorWithRed:0.5 green:1 blue:0.5 alpha:1]],
              [Session sessionWithTitle:@"Title 1" speakerName:@"speaker 1" time:@"10:00 AM - 10:30 AM" location:@"Location 1" avatarPath:@"yoyo4" trackName:@"Track 1" trackColor:[UIColor colorWithRed:0.5 green:1 blue:0.5 alpha:1]],
              [Session sessionWithTitle:@"Title 1" speakerName:@"speaker 1" time:@"10:00 AM - 10:30 AM" location:@"Location 1" avatarPath:@"yoyo4" trackName:@"Track 1" trackColor:[UIColor colorWithRed:0.5 green:1 blue:0.5 alpha:1]],
              [Session sessionWithTitle:@"Title 1" speakerName:@"speaker 1" time:@"10:00 AM - 10:30 AM" location:@"Location 1" avatarPath:@"yoyo4" trackName:@"Track 1" trackColor:[UIColor colorWithRed:0.5 green:1 blue:0.5 alpha:1]]
              ]
          ],
      @[
          [Session sessionWithTitle:@"Title 2" speakerName:@"speaker 1" time:@"10:30 AM - 12:00 PM" location:@"Location 1" avatarPath:@"yoyo2" trackName:@"Track 1" trackColor:nil]
          ],
      @[
          [Session sessionWithTitle:@"Lunce" speakerName:nil time:@"12:00 PM - 1:00 PM" location:@"Location 1" avatarPath:@"yoyo3" trackName:@"Track 1" trackColor:nil]
          ],
      @[
          [Session sessionWithTitle:@"Title 1" speakerName:@"speaker 1" time:@"1:00 PM - 2:00 PM" location:@"Location 1" avatarPath:@"yoyo4" trackName:@"Track 1" trackColor:nil]
          ],
      @[
          @[
              [Session sessionWithTitle:@"Title 1" speakerName:@"speaker 1" time:@"2:00 PM - 5:30 PM" location:@"Location 1" avatarPath:@"yoyo1" trackName:@"Track 1" trackColor:[UIColor colorWithRed:37.f/255.f green:40.f/255.f blue:40.f/255.f alpha:1.f]]
              ],
          @[
              [Session sessionWithTitle:@"Title 1" speakerName:@"speaker 1" time:@"2:00 PM - 5:30 PM" location:@"Location 1" avatarPath:@"yoyo2" trackName:@"Track 1" trackColor:[UIColor colorWithRed:0 green:122.f/255.f blue:1.f alpha:1.f]],
              [Session sessionWithTitle:@"Title 1" speakerName:@"speaker 1" time:@"2:00 PM - 5:30 PM" location:@"Location 1" avatarPath:@"yoyo3" trackName:@"Track 1" trackColor:[UIColor colorWithRed:0 green:122.f/255.f blue:1.f alpha:1.f]]
              ],
          @[
              [Session sessionWithTitle:@"Title 1" speakerName:@"speaker 1" time:@"2:00 PM - 5:30 PM" location:@"Location 1" avatarPath:@"yoyo4" trackName:@"Track 1" trackColor:[UIColor colorWithRed:0.1 green:1 blue:1 alpha:1]],
              [Session sessionWithTitle:@"Title 1" speakerName:@"speaker 1" time:@"2:00 PM - 5:30 PM" location:@"Location 1" avatarPath:@"yoyo4" trackName:@"Track 1" trackColor:[UIColor colorWithRed:0.1 green:1 blue:1 alpha:1]],
              [Session sessionWithTitle:@"Title 1" speakerName:@"speaker 1" time:@"2:00 PM - 5:30 PM" location:@"Location 1" avatarPath:@"yoyo4" trackName:@"Track 1" trackColor:[UIColor colorWithRed:0.1 green:1 blue:1 alpha:1]]
              ]
          ],
      @[
          [Session sessionWithTitle:@"End" speakerName:nil time:@"5:30 PM - 6:00 PM" location:@"Location 1" avatarPath:@"yoyo1" trackName:@"Track 1" trackColor:nil]
          ]
      ];
    
    _listCurrentPages = [NSMutableArray array];
    for (int i=0; i<_data.count; i++) {
        [_listCurrentPages addObject:[NSNumber numberWithInt:0]];
    }
    
    // register cells and headers
    [_tableView registerClass:[SessionTVCell class] forCellReuseIdentifier:identifierSession];
    [_tableView registerClass:[ScrollingSessionTVCell class] forCellReuseIdentifier:identifierMultiSession];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _data.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSArray *arr = [_data objectAtIndex:indexPath.row];
    if (arr.count == 1) {
        Session *session = arr.firstObject;
        if ([session isKindOfClass:[Session class]]) {
            if (session.speakerName) {
                
                SessionTVCell * cell = [tableView dequeueReusableCellWithIdentifier:identifierSession];
                
                [cell.sessionView.lblName setText:session.title];
                [cell.sessionView.lblTime setText:[NSString stringWithFormat:@"%@", session.time]];
                [cell.sessionView.lblLocation setText:session.location];
                [cell.sessionView.lblSpeakerName setText:session.speakerName];
                [cell.sessionView.imgAvatar setImage:[UIImage imageNamed:session.avatarPath]];
                
                [cell setBorderColor:session.trackColor];
                
                return cell;
            } else {
                UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifierSessionRest];
                if (cell == nil) {
                    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifierSessionRest];
                    [cell.textLabel setFont:[UIFont boldSystemFontOfSize:15]];
                    [cell.detailTextLabel setNumberOfLines:2];
                    [cell.detailTextLabel setFont:[UIFont systemFontOfSize:14]];
                    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
                    
                    // cosmetic
                    [cell.contentView.layer setBorderWidth:5];
                    [cell.contentView.layer setBorderColor:COLOR_BACKGROUND_INFO.CGColor];
                }
                
                [cell.textLabel setText:session.title];
                
                NSMutableArray *arr = [NSMutableArray array];
                if (session.time) {
                    [arr addObject:session.time];
                }
                
                if (session.location) {
                    [arr addObject:session.location];
                }
                
                [cell.detailTextLabel setText:[arr componentsJoinedByString:@"\n"]];
                
                return cell;
            }
        } else {
            ScrollingSessionTVCell *cell = [tableView dequeueReusableCellWithIdentifier:identifierMultiSession];
            [cell setDelegate:self];
            [cell setData:arr];
            int currentPage = [[_listCurrentPages objectAtIndex:indexPath.row] intValue];
            [cell scrollToSection:currentPage];
            
            return cell;
        }
        
    } else {
        ScrollingSessionTVCell *cell = [tableView dequeueReusableCellWithIdentifier:identifierMultiSession];
        [cell setDelegate:self];
        [cell setData:arr];
        int currentPage = [[_listCurrentPages objectAtIndex:indexPath.row] intValue];
        [cell scrollToSection:currentPage];
        
        return cell;
    }
}

//-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
//    return [_headers objectAtIndex:section];
//}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSArray *arr = [_data objectAtIndex:indexPath.row];
    if (arr.count == 1) {
        NSObject *firstObject = arr.firstObject;
        
        if ([firstObject isKindOfClass:[Session class]]) {
            Session *session = (Session*)firstObject;
            if (session.speakerName > 0) {
                return 110;
            } else {
                return 60;
            }
        } else if ([firstObject isKindOfClass:[NSArray class]]){
            NSArray *sessions = (NSArray*)firstObject;
            return [SessionCVCell size].height * sessions.count + [TrackHeaderCVCell size].height;
        } else {
            return -1;
        }
        
    } else {
        int currentPage = [[_listCurrentPages objectAtIndex:indexPath.row] intValue];
        
        // get number of element of current page
        int currentCount = ((NSArray*)[arr objectAtIndex:currentPage]).count;
        
        // get number of elements of previous page
        int previousCount = 0;
        if (currentPage > 0) {
            previousCount = ((NSArray*)[arr objectAtIndex:currentPage - 1]).count;
        }
        
        // get number of elements of next page
        int nextCount = 0;
        if (currentPage < arr.count - 1) {
            nextCount = ((NSArray*)[arr objectAtIndex:currentPage + 1]).count;
        }
        
        int max = MAX(MAX(nextCount, currentCount), previousCount);
        
        return [SessionCVCell size].height * max + [TrackHeaderCVCell size].height;
    }
}

#pragma mark - UITableViewDelegate
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSArray *arr = [_data objectAtIndex:indexPath.row];
    if (arr.count == 1) {
        Session *session = arr.firstObject;
        
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:nil message:session.title delegate:nil cancelButtonTitle:@"Close" otherButtonTitles:nil];
        [alertView show];
    }
}

#pragma mark - ScrollingSessionCellDelegate
-(void)scrollingSessionTVCell:(ScrollingSessionTVCell *)cell selectedSession:(Session *)session {
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:nil message:session.title delegate:nil cancelButtonTitle:@"Close" otherButtonTitles:nil];
    [alertView show];
}

-(void)scrollingSessionTVCell:(ScrollingSessionTVCell *)cell currentPageValueChanged:(int)currentPage {
    NSIndexPath *indexPath = [_tableView indexPathForCell:cell];
    
    [_tableView beginUpdates];
    [_listCurrentPages replaceObjectAtIndex:indexPath.row withObject:[NSNumber numberWithInt:currentPage]];
    [_tableView endUpdates];
}


@end
