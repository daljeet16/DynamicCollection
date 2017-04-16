//
//  DCLabel.m
//  DynamicCollection
//
//  Created by DaljeetSingh on 15/04/17.
//  Copyright © 2017 mli. All rights reserved.
//

#import "DCLabel.h"

@implementation DCLabel

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setDefaultStyling];
    }
    return self;
}

-(void)awakeFromNib
{
    [super awakeFromNib];
    [self setDefaultStyling];
}

-(void)setDefaultStyling{
    UIFont *font = self.font;
    float size = self.font.pointSize;
    self.font = [font fontWithSize:floor(SCALE*size)];
}


@end
