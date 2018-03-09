//
//  RockTrackModel.m
//  Rock Tracks
//
//  Created by Bogdan on 08/03/2018.
//  Copyright © 2018 Bogdan Rapea. All rights reserved.
//

#import "TrackModel.h"

@implementation TrackModel

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (self) {
        self.name = [dictionary valueForKey:@"trackName"];
        self.artist = [dictionary valueForKey:@"artistName"];
        self.price = [NSString stringWithFormat:@"%@ %@",[dictionary valueForKey:@"trackPrice"], [dictionary valueForKey:@"currency"]];
        
        self.imageURL = [dictionary valueForKey:@"artworkUrl100"];
        //artworkUrl30
        //artworkUrl60
        //artworkUrl100
        self.duration = [dictionary valueForKey:@"trackTimeMillis"];
        self.releaseDate = [dictionary valueForKey:@"releaseDate"];
    }
    return self;
}


- (void)loadImage:(void (^)(UIImage* image))completionBlock {
    NSURL *url = [NSURL URLWithString:self.imageURL];
    
    __weak typeof (self) weakSelf = self;
    
    NSURLSessionDownloadTask *downloadPhotoTask = [[NSURLSession sharedSession] downloadTaskWithURL:url completionHandler:^(NSURL *location, NSURLResponse *response, NSError *error) {
        
        weakSelf.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:location]];
        
        if (completionBlock) {
            completionBlock(weakSelf.image);
        }
        
    }];
    
    [downloadPhotoTask resume];
    
}

@end
