//
//  DCButton.m
//  DynamicCollection
//
//  Created by DaljeetSingh on 15/04/17.
//  Copyright © 2017 mli. All rights reserved.
//

#import "DCButton.h"

@implementation DCButton

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
    UIFont *font = self.titleLabel.font;
    float size = self.titleLabel.font.pointSize;
    self.titleLabel.font = [font fontWithSize:floor(SCALE*size)];
}



@end
