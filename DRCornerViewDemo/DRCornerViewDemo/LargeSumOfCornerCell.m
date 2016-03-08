//
//  LargeSumOfCornerCell.m
//  DRCornerViewDemo
//
//  Created by apple on 16/3/7.
//  Copyright © 2016年 kun. All rights reserved.
//

#import "LargeSumOfCornerCell.h"
#import "UIView+Corner.h"

@interface LargeSumOfCornerCell ()

@property (strong, nonatomic) IBOutletCollection(UIImageView) NSArray *imagesCollection;

@property (strong, nonatomic) IBOutletCollection(UILabel) NSArray *labelsCollection;

@property (weak, nonatomic) IBOutlet UIButton *button;

@property (nonatomic, assign) BOOL drCornered;

@end

@implementation LargeSumOfCornerCell

- (void)awakeFromNib {
    
}

- (void)show {
    if (!_drCornered) {
        _drCornered = YES;
        for (UIImageView *imageView in self.imagesCollection) {
            [imageView dr_cornerWithRadius:CGRectGetHeight(imageView.bounds)/2 backgroundColor:self.contentView.backgroundColor];
        }
        for (UILabel *label in self.labelsCollection) {
            [label dr_cornerWithRadius:6.0 backgroundColor:self.contentView.backgroundColor];
        }
        [self.button dr_cornerWithRadius:10.0 backgroundColor:self.contentView.backgroundColor];
        [self.contentView dr_cornerWithRadius:10 backgroundColor:[UIColor whiteColor]];
    }
    
} 

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
