# DRCornerViewExtension
我所理解的设置圆角的方式，无离屏渲染，无mask 使用 CAShaperLayer 实现 轻量级应用
Extension 来实现 欢迎star  


*使用 maskToBounds 和 cornerRadius 或者 mask 时 造成的离屏渲染（如下图）*

![maskToBounds.png](https://ooo.0o0.ooo/2016/03/07/56dd3a7c15eb7.png)

*使用 UIView+Corner 时的UIImageView*

![imageCorner.jpg](https://ooo.0o0.ooo/2016/03/07/56dd3a04bdf1a.jpg)

*使用 UIView+Corner 时的UILabel*

![labelCorner.png](https://ooo.0o0.ooo/2016/03/07/56dd3b70742d2.png)


*核心代码*

```
- (void)dr_roundingCorner:(DRRoundCorner)roundCorner radius:(CGFloat)radius backgroundColor:(UIColor *)bgColor borderColor:(UIColor *)borderColor {
    [self removeDRCorner];
    CGFloat width = CGRectGetWidth(self.bounds);
    CGFloat height = CGRectGetHeight(self.bounds);
    UIBezierPath * path= [UIBezierPath bezierPathWithRect:CGRectMake(0, 0, width, height)];
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.name = DRCornerLayerName;
    UIRectCorner sysCorner = (UIRectCorner)roundCorner;
    UIBezierPath *cornerPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:sysCorner cornerRadii:CGSizeMake(radius, radius)];
    [path  appendPath:cornerPath];
    //[path setUsesEvenOddFillRule:YES];
    shapeLayer.path = path.CGPath;
    shapeLayer.fillRule = kCAFillRuleEvenOdd;
    shapeLayer.fillColor = bgColor.CGColor;
    if (borderColor) {
        //CGPathApply
        CGFloat cornerPathLength = lengthOfCGPath(roundCorner,radius,self.bounds.size);
        CGFloat totolPathLength = 2*(CGRectGetHeight(self.bounds)+CGRectGetWidth(self.bounds))+cornerPathLength;
        shapeLayer.strokeStart = (totolPathLength-cornerPathLength)/totolPathLength;
        shapeLayer.strokeEnd = 1.0;
        shapeLayer.strokeColor = borderColor.CGColor;
    }
    if ([self isKindOfClass:[UILabel class]]) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self.layer addSublayer:shapeLayer];
        });
        return;
    }
    [self.layer addSublayer:shapeLayer];
}

```

*本方法会有图层混合的问题 下面附上 该demo 的真机测试图 机器是 5c*

![图层混合.png](https://ooo.0o0.ooo/2016/03/07/56dd780deb8b6.png)

##补充

*已经补充方法，并修正代码，再也不怕多次添加圆角引起的性能问题了，现在你在外部也能获取到是否已经为视图添加圆角了并可以移除掉已有圆角(虽然个人感觉没有必要，但还是提供了接口) 2016-03-08*

*增加了描边功能，效果图如下*

![增加描边.png](https://ooo.0o0.ooo/2016/03/08/56ded2ae99ad8.png)


**个人原创请star支持，拜谢**
