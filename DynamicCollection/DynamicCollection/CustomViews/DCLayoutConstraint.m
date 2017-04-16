//
//  DCLayoutConstraint.m
//  DynamicCollection
//
//  Created by DaljeetSingh on 15/04/17.
//  Copyright © 2017 mli. All rights reserved.
//

#import "DCLayoutConstraint.h"

@implementation DCLayoutConstraint

+ (NSArray *)constraintsWithVisualFormat:(NSString *)format options:(NSLayoutFormatOptions)opts metrics:(NSDictionary *)metrics views:(NSDictionary *)views{
    //TODO
    return  [super constraintsWithVisualFormat:format options:opts metrics:metrics views:views];
}

+(instancetype)constraintWithItem:(id)view1 attribute:(NSLayoutAttribute)attr1 relatedBy:(NSLayoutRelation)relation toItem:(id)view2 attribute:(NSLayoutAttribute)attr2 multiplier:(CGFloat)multiplier constant:(CGFloat)c{
    return [super constraintWithItem:view1 attribute:attr1 relatedBy:relation toItem:view2 attribute:attr2 multiplier:multiplier constant:(SCALE*c)];
}

-(void)setConstant:(CGFloat)constant{
    [super setConstant:(SCALE*constant)];
}

- (void)awakeFromNib{
    self.constant = self.constant;
    [super awakeFromNib];
}



@end
