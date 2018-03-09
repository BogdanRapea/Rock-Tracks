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

@interface RockTracksViewController ()

@property (strong, nonatomic) RockTracksAPI *rockTracksAPI;
@property (strong, nonatomic) NSArray *tracks;

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

    [cell.image setImage:[UIImage imageNamed:@"Default"]];
    
    TrackModel *track = self.tracks[indexPath.row];
    cell.name.text = track.name;
    cell.artist.text = track.artist;
    cell.price.text = track.price;
    
    [track loadImage:^(UIImage *image) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [cell.image setImage:image];
            
        });
        
    }];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    [self performSegueWithIdentifier:@"SingleTrackView" sender:self];
}



@end
