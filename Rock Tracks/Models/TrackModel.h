//
//  RockTrackModel.h
//  Rock Tracks
//
//  Created by Bogdan on 08/03/2018.
//  Copyright © 2018 Bogdan Rapea. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface TrackModel : NSObject

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *artist;
@property (strong, nonatomic) NSString *price;
@property (strong, nonatomic) NSString *imageURL;
@property (strong, nonatomic) NSNumber *duration;
@property (strong, nonatomic) NSString *releaseDate;
@property (strong, nonatomic) NSString *trackViewUrl;
@property (strong, nonatomic) UIImage *image;
@property (strong, nonatomic) UIImage *defaultImage;

- (void)loadImage:(void (^)(UIImage* image))completionBlock;

@end
