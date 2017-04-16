//
//  DCDataLayer.h
//  DynamicCollection
//
//  Created by DaljeetSingh on 15/04/17.
//  Copyright © 2017 mli. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DCDataLayer : NSObject

+(void)getFlickrData:(NSString *)url success:(void (^)(NSDictionary* responseObject))success  failure:(void (^)(NSError *error))failure;

@end
