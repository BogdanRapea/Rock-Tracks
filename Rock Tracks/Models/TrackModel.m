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
        
        
        if ([dictionary valueForKey:@"artworkUrl100"]) {
            self.imageURL = [dictionary valueForKey:@"artworkUrl100"];
        }
        else if ([dictionary valueForKey:@"artworkUrl60"]) {
            self.imageURL = [dictionary valueForKey:@"artworkUrl60"];
        }
        else if ([dictionary valueForKey:@"artworkUrl30"]) {
            self.imageURL = [dictionary valueForKey:@"artworkUrl30"];
        }
     
        self.duration = [dictionary valueForKey:@"trackTimeMillis"];
        self.releaseDate = [dictionary valueForKey:@"releaseDate"];
        self.trackViewUrl = [dictionary valueForKey:@"trackViewUrl"];
    }
    return self;
}


- (UIImage *)defaultImage {
    if (!_defaultImage) {
        _defaultImage = [UIImage imageNamed:@"Default"];
    }
    return _defaultImage;
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
