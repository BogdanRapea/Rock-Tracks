//
//  ViewController.m
//  Rock Tracks
//
//  Created by Bogdan on 08/03/2018.
//  Copyright © 2018 Bogdan Rapea. All rights reserved.
//

#import "RockTracksViewController.h"
#import "RockTracksAPI.h"
#import "TrackCell.h"
#import "SingleTrackViewController.h"

@interface RockTracksViewController ()

@property (strong, nonatomic) RockTracksAPI *rockTracksAPI;
@property (strong, nonatomic) NSArray *tracks;
@property (assign, nonatomic) NSInteger lastSelectedRow;

@end

@implementation RockTracksViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadTracks];
    
}


- (RockTracksAPI *)rockTracksAPI {
    if (!_rockTracksAPI) {
        _rockTracksAPI = [[RockTracksAPI alloc] init];
    }
    return _rockTracksAPI;
}

- (void)loadTracks {
    __weak typeof (self) weakSelf = self;
    [self.rockTracksAPI getTracks:^(NSArray<TrackModel *> *trackModels) {
        dispatch_async(dispatch_get_main_queue(), ^{
            weakSelf.tracks = trackModels;
            [weakSelf.tableView reloadData];
        });
    } failure:^(NSError *error) {
        
    }];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    SingleTrackViewController *controller = [segue destinationViewController];
    [controller setTrackModel:self.tracks[self.lastSelectedRow]];
}


#pragma mark - Table View
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.tracks.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString *trackCellID = @"trackCell";
    TrackCell *cell = [tableView dequeueReusableCellWithIdentifier:trackCellID];
    
    if (cell == nil) {
        cell = [[TrackCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:trackCellID];
        
    }
    
    TrackModel *track = self.tracks[indexPath.row];
    cell.name.text = track.name;
    cell.artist.text = track.artist;
    cell.price.text = track.price;
    
    if (track.image) {
        [cell.image setImage:track.image];
    }
    else {
        [cell.image setImage:track.defaultImage];
        [track loadImage:^(UIImage *image) {
            dispatch_async(dispatch_get_main_queue(), ^{
                [cell.image setImage:image];
                
            });
            
        }];
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    self.lastSelectedRow = indexPath.row;
    [self performSegueWithIdentifier:@"SingleTrackView" sender:self];
}



@end
