//
//  RockTracksAPI.h
//  Rock Tracks
//
//  Created by Bogdan on 08/03/2018.
//  Copyright © 2018 Bogdan Rapea. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TrackModel.h"

@interface RockTracksAPI : NSObject

- (void)getTracks:(void (^)(NSArray <TrackModel*> *trackModels))successBlock failure:(void (^)(NSError *error))failureBlock;

@end
