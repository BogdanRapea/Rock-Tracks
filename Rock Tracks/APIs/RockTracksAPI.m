//
//  RockTracksAPI.m
//  Rock Tracks
//
//  Created by Bogdan on 08/03/2018.
//  Copyright © 2018 Bogdan Rapea. All rights reserved.
//

#import "RockTracksAPI.h"

@implementation RockTracksAPI

- (void)getTracks:(void (^)(NSArray <TrackModel*> *trackModels))successBlock failure:(void (^)(NSError *error))failureBlock {
    
    //__weak typeof (self) weakSelf = self;
    
    NSURL *url = [NSURL URLWithString:@"https://itunes.apple.com/search?term=rock&media=music"];

    NSURLSessionDataTask *downloadTask = [[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        if ([data length] > 0 && error == nil) {
            
            NSError *jsonError;
            id responseData = [NSJSONSerialization
                               JSONObjectWithData:data
                               options:kNilOptions
                               error:&jsonError];
            
            if (jsonError) {
                if (failureBlock) {
                    failureBlock(jsonError);
                    
                }
                return;
                
            }
            
            if (successBlock) {
                
                NSDictionary *results = [responseData valueForKey:@"results"];
                
                NSMutableArray *tempArray = [[NSMutableArray alloc] init];
                for (NSDictionary *dict in results) {
                    TrackModel *model = [[TrackModel alloc] initWithDictionary:dict];
                    [tempArray addObject:model];
                }
                successBlock ([NSArray arrayWithArray:tempArray]);
            }
        }
        else if (error != nil && failureBlock) {
            failureBlock (error);
        }
        
                                              
                                              
                                          }];
    [downloadTask resume];
    
}


@end
