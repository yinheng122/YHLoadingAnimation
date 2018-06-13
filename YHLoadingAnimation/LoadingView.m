//
//  loadingView.m
//  ReplicatorAnimation
//
//  Created by yinheng on 2018/6/11.
//  Copyright © 2018年 daqsoft. All rights reserved.
//

#import "LoadingView.h"

@implementation LoadingView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self buildCircle];
    }
    return self;
}

- (void)buildCircle{
    self.backgroundColor=[UIColor clearColor];
    UIView *circleView=[[UIView alloc]init];
    circleView.frame=CGRectMake(0, 0,self.frame.size.width,self.frame.size.height);
    circleView.backgroundColor=[UIColor clearColor];
    [self addSubview: circleView];
    
    CAGradientLayer * gradientLayer = [CAGradientLayer layer];
    gradientLayer.colors = @[(__bridge id)[UIColor colorWithRed:255/256.f green:57/256.f blue:55/256.f alpha:1].CGColor,(__bridge id)[UIColor colorWithRed:40/256.f green:203/256.f blue:255/256.f alpha:1].CGColor];
    gradientLayer.locations = @[@0.2,@1.0];
    gradientLayer.startPoint = CGPointMake(0, 0);
    gradientLayer.endPoint = CGPointMake(1.0, 0);
    gradientLayer.frame =CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    [circleView.layer insertSublayer:gradientLayer atIndex:0];
    
    CAShapeLayer *layer = [[CAShapeLayer alloc]init];
    CGMutablePathRef pathRef = CGPathCreateMutable();
    CGPathAddRelativeArc(pathRef, nil,self.frame.size.width/2.0,self.frame.size.height/2.0,self.frame.size.width<self.frame.size.height?self.frame.size.width/2.0-5:self.frame.size.height/2.0-5,0, 2*M_PI);
    layer.path = pathRef;
    layer.lineWidth = 5;
    layer.fillColor = [UIColor clearColor].CGColor;
    layer.strokeColor = [UIColor blackColor].CGColor;
    CGPathRelease(pathRef);
    circleView.layer.mask = layer;
    
    CABasicAnimation *animation=[CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    // 设定动画选项
    animation.duration = 1;
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeForwards;
    animation.repeatCount =HUGE_VALF;
    // 设定旋转角度
    // 起始角度
    animation.fromValue = [NSNumber numberWithFloat:0.0];
    // 终止角度
    animation.toValue = [NSNumber numberWithFloat:2 * M_PI];
    [circleView.layer addAnimation:animation forKey:@"rotate-layer"];
}
@end
