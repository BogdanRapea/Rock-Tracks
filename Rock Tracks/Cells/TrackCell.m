//
//  TrackCell.m
//  Rock Tracks
//
//  Created by Bogdan on 08/03/2018.
//  Copyright © 2018 Bogdan Rapea. All rights reserved.
//

#import "TrackCell.h"

@implementation TrackCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    UIColor *labelViewColor = self.labelView.backgroundColor;
    UIColor *imageViewColor = self.image.backgroundColor;
    [super setSelected:selected animated:animated];

    if (selected) {
        [self.labelView setBackgroundColor:labelViewColor];
        [self.image setBackgroundColor:imageViewColor];
    }
}

- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated{
    UIColor *labelViewColor = self.contentView.backgroundColor;
    UIColor *imageViewColor = self.image.backgroundColor;
    [super setHighlighted:highlighted animated:animated];
    if (highlighted) {
        [self.labelView setBackgroundColor:labelViewColor];
        [self.image setBackgroundColor:imageViewColor];
    }
}

@end
