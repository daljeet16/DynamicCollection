//
//  DCHomeCollectionViewCell.h
//  DynamicCollection
//
//  Created by DaljeetSingh on 16/04/17.
//  Copyright © 2017 mli. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DCHomeCollectionViewCell : UICollectionViewCell

@property (weak,nonatomic) IBOutlet UIImageView *leftImageView;
@property (weak,nonatomic) IBOutlet UIImageView *rightImageView;
@property (weak,nonatomic) IBOutlet UIButton *leftButton;
@property (weak,nonatomic) IBOutlet UIButton *rightButton;

@property (weak,nonatomic) IBOutlet UILabel *titleLabel;
@property (weak,nonatomic) IBOutlet UILabel *itemIdLabel;

@end
