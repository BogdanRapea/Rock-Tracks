//
//  SingleTrackViewController.h
//  Rock Tracks
//
//  Created by Bogdan on 08/03/2018.
//  Copyright © 2018 Bogdan Rapea. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TrackModel.h"

@interface SingleTrackViewController : UIViewController

@property (strong, nonatomic) TrackModel *trackModel;

@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *artist;
@property (weak, nonatomic) IBOutlet UILabel *price;

@property (weak, nonatomic) IBOutlet UILabel *duration;
@property (weak, nonatomic) IBOutlet UILabel *releaseDate;
@property (weak, nonatomic) IBOutlet UIButton *moreButton;
@property (weak, nonatomic) IBOutlet UIImageView *trackImageView;

- (IBAction)onMore:(id)sender;

@end
