//
//  DCModels.m
//  DynamicCollection
//
//  Created by DaljeetSingh on 15/04/17.
//  Copyright © 2017 mli. All rights reserved.
//

#import "DCModels.h"

@implementation DCModels

@end


@implementation DCFlickrModel

-(void)initWitDict:(NSDictionary *)dict{

     NSString *farm = @"";
     NSString *secret = @"";
     NSString *server = @"";
    
    if(![dict[@"farm"] isEqual:[NSNull null]]){
       farm = dict[@"farm"];
    }
    if(![dict[@"server"] isEqual:[NSNull null]]){
        server = dict[@"server"];
    }
    if(![dict[@"secret"] isEqual:[NSNull null]]){
        secret = dict[@"secret"];
    }
    
    if(![dict[@"id"] isEqual:[NSNull null]]){
        self.item_id = dict[@"id"];
    }
    else{
        self.item_id = @"";
    }
    
    if(![dict[@"title"] isEqual:[NSNull null]]){
        self.title = dict[@"title"];
    }
    else{
        self.title = @"";
    }
    self.imageUrl = [NSString stringWithFormat:@"http://farm%@.static.flickr.com/%@/%@_%@_m.jpg",farm,server,_item_id,secret];

    
}

@end
