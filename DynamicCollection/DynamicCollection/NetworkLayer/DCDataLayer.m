//
//  DCDataLayer.m
//  DynamicCollection
//
//  Created by DaljeetSingh on 15/04/17.
//  Copyright © 2017 mli. All rights reserved.
//

#import "DCDataLayer.h"
#import "DCNetworkLayer.h"
@implementation DCDataLayer

+(void)getFlickrData:(NSString *)url success:(void (^)(NSDictionary* responseObject))success  failure:(void (^)(NSError *error))failure{
    [DCNetworkLayer getFlickrData:url success:success failure:failure];
}

@end
