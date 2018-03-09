//
//  SingleTrackViewController.m
//  Rock Tracks
//
//  Created by Bogdan on 08/03/2018.
//  Copyright © 2018 Bogdan Rapea. All rights reserved.
//

#import "SingleTrackViewController.h"

@interface SingleTrackViewController ()

@end

@implementation SingleTrackViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self fillViewFromModel];
    self.moreButton.layer.cornerRadius = 15.0f;
}



- (void)fillViewFromModel {
    
    self.name.text = self.trackModel.name;
    self.artist.text = self.trackModel.artist;
    self.price.text = self.trackModel.price;

    self.releaseDate.text = [self formatDate:self.trackModel.releaseDate];
    self.duration.text = [self formatDuration:self.trackModel.duration];
    
    [self.trackImageView setImage:self.trackModel.image];
}

- (NSString *)formatDate:(NSString *)date {
    NSString *day = [date substringWithRange:NSMakeRange(8, 2)];
    NSString *month = [date substringWithRange:NSMakeRange(5, 2)];
    NSString *year = [date substringWithRange:NSMakeRange(0,4)];
    
    return [NSString stringWithFormat:@"%@-%@-%@",day, month, year];
    
}

- (NSString *)formatDuration:(NSNumber *)milliseconds {
    
    int milli =[milliseconds intValue];
    
    int sec = (milli / 1000) % 60;
    int min = ((milli / 1000) / 60) % 60;
    int hours = (((milli / 1000) / 60) / 60) % 60;
    
    if (hours != 0) {
        return [NSString stringWithFormat:@"%d:%d:%d", hours, min, sec];
    }
    else if(min != 0) {
        return [NSString stringWithFormat:@"%d:%d", min , sec];
    }
    else if (sec !=0 ) {
        return [NSString stringWithFormat:@"%d", sec];
    }
    else {
        return @"0";
    }
    
}

- (IBAction)onMore:(id)sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:self.trackModel.trackViewUrl]];
}
@end
