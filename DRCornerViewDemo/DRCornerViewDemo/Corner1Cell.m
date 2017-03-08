//
//  Corner1Cell.m
//  DRCornerViewDemo
//
//  Created by DRTerry on 2017/3/8.
//  Copyright © 2017年 kun. All rights reserved.
//

#import "Corner1Cell.h"
#import "UIView+DRCorner.h"

@interface Corner1Cell ()

@property (weak, nonatomic) IBOutlet UIView *bgView;
@property (weak, nonatomic) IBOutlet UIImageView *iconImage;
@property (weak, nonatomic) IBOutlet UILabel *infoLabel;

@property (nonatomic, assign) BOOL topCorner;
@property (nonatomic, assign) BOOL bottomCorner;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *horizontalSpace;

@end

@implementation Corner1Cell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)layoutSubviews {
    [super layoutSubviews];
    CGFloat selfHeight = CGRectGetHeight(self.bounds);
    CGFloat selfWidth = CGRectGetWidth(self.bounds);
    if (self.topCorner) {
        [self.bgView dr_topCornerWithRadius:5.0 backgroundColor:self.backgroundColor corenrRect:CGRectMake(0, 0, selfWidth - 2 * _horizontalSpace.constant, selfHeight)];
    }
    if (self.bottomCorner) {
        [self.bgView dr_bottomCornerWithRadius:5.0 backgroundColor:self.backgroundColor corenrRect:CGRectMake(0, 0, selfWidth - 2 * _horizontalSpace.constant, selfHeight)];
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

- (void)cornerTop {
    self.topCorner = YES;
}

- (void)cornerBottom {
    self.bottomCorner = YES;
}

- (void)clearCurrentCorner {
    self.topCorner = NO;
    self.bottomCorner = NO;
    [self.bgView removeDRCorner];
}

- (void)updateUIWithInfo:(NSString *)infoDict {

}


@end
