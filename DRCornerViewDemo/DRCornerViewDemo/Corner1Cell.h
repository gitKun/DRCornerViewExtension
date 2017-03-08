//
//  Corner1Cell.h
//  DRCornerViewDemo
//
//  Created by DRTerry on 2017/3/8.
//  Copyright © 2017年 kun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Corner1Cell : UITableViewCell

- (void)cornerTop;

- (void)cornerBottom;

- (void)clearCurrentCorner;

- (void)updateUIWithInfo:(NSString *)infoDict;

@end
