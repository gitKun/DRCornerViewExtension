# DRCornerViewExtension
我所理解的设置圆角的方式，无离屏渲染，无mask 使用 CAShaperLayer 实现
Extension 来实现 欢迎star  


*使用 maskToBounds 和 cornerRadius 或者 mask 时 造成的离屏渲染（如下图）*

![maskToBounds.png](https://ooo.0o0.ooo/2016/03/07/56dd3a7c15eb7.png)

*使用 UIView+Corner 时的UIImageView*

![imageCorner.jpg](https://ooo.0o0.ooo/2016/03/07/56dd3a04bdf1a.jpg)

*使用 UIView+Corner 时的UILabel*

![labelCorner.png](https://ooo.0o0.ooo/2016/03/07/56dd3b70742d2.png)


*核心代码*

```
- (void)dr_cornerWithRadius:(CGFloat)radius backgroundColor:(UIColor *)bgColor {
    CGFloat width = CGRectGetWidth(self.bounds);
    CGFloat height = CGRectGetHeight(self.bounds);
    UIBezierPath * path= [UIBezierPath bezierPathWithRect:CGRectMake(0, 0, width, height)];
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    if (radius == -1) {
        radius = MIN(width, height)/2;
    }
    
    [path  appendPath:[UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:UIRectCornerAllCorners cornerRadii:CGSizeMake(radius, radius)]];
    /*
     字面意思是“奇偶”。按该规则，要判断一个点是否在图形内，从该点作任意方向的一条射线，然后检测射线与图形路径的交点的数量。如果结果是奇数则认为点在内部，是偶数则认为点在外部
     */
    [path setUsesEvenOddFillRule:YES];
    shapeLayer.path = path.CGPath;
    shapeLayer.fillRule = kCAFillRuleEvenOdd;
    shapeLayer.fillColor = bgColor.CGColor;
    if ([self isKindOfClass:[UILabel class]]) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self.layer addSublayer:shapeLayer];
        });
        return;
    }
    [self.layer addSublayer:shapeLayer];
}

```


**个人原创请star支持，拜谢**
