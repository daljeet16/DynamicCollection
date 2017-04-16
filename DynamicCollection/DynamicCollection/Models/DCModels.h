//
//  DCModels.h
//  DynamicCollection
//
//  Created by DaljeetSingh on 15/04/17.
//  Copyright © 2017 mli. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DCModels : NSObject

@end

@interface DCFlickrModel : NSObject

@property (copy) NSString *item_id;
@property (copy) NSString *imageUrl;
@property (copy) NSString *title;
@property (nonatomic) BOOL selectedCheck;

-(void)initWitDict:(NSDictionary *)dict;

@end
