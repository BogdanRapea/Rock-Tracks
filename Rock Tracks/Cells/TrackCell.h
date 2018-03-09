//
//  TrackCell.h
//  Rock Tracks
//
//  Created by Bogdan on 08/03/2018.
//  Copyright © 2018 Bogdan Rapea. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TrackCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *artist;
@property (weak, nonatomic) IBOutlet UILabel *price;
@property (weak, nonatomic) IBOutlet UIImageView *image;
@property (weak, nonatomic) IBOutlet UIView *labelView;

@end
