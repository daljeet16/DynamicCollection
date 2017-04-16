//
//  DCNetworkLayer.m
//  DynamicCollection
//
//  Created by DaljeetSingh on 15/04/17.
//  Copyright © 2017 mli. All rights reserved.
//

#import "DCNetworkLayer.h"
#import <AFNetworking/AFNetworking.h>
@implementation DCNetworkLayer

+ (void)success:(void (^)(NSDictionary* responseObject))successBlock andResponse:(id)response
{
    dispatch_async(dispatch_get_main_queue(), ^{
        if (successBlock != nil) {
            successBlock(response);
        }
    });
}

+ (void)failure:(void (^)(NSError *error))failureBlock andError:(NSError*)error
{
    dispatch_async(dispatch_get_main_queue(), ^{
        if (failureBlock != nil) {
            failureBlock(error);
        }
    });
}

+(void)makeGetRequest:(NSDictionary*)params andPath:(NSString*)path andSuccess:(void (^)(NSDictionary* responseObject))successBlock andFailure:(void (^)(NSError *error))failureBlock{
    
    NSMutableDictionary *paramDict = nil;
    if (params!=nil)
        paramDict = [params mutableCopy];
    else
        paramDict = [[NSMutableDictionary alloc] init];
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [manager GET:path parameters:paramDict progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary* jsonFromData = (NSDictionary*)responseObject;
        [self success:successBlock andResponse:jsonFromData];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"[HTTPClient Error]: %@", error.localizedDescription);
        [self failure:failureBlock andError:error];
        
    }];
}

+(void)getFlickrData:(NSString *)url success:(void (^)(NSDictionary* responseObject))success failure:(void (^)(NSError *error))failure{

    return [self makeGetRequest:nil andPath:url andSuccess:success andFailure:failure];
}


@end
