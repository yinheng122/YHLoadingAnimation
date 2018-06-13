//
//  ReplicatorHudView.m
//  ReplicatorAnimation
//
//  Created by yinheng on 2018/6/11.
//  Copyright © 2018年 daqsoft. All rights reserved.
//

#import "ReplicatorHudView.h"

@interface ReplicatorHudView ()

/**
 * 图层对象
 */
@property (strong, nonatomic) CALayer *ALayer;

/**
 * 重复图层
 */
@property (strong, nonatomic) CAReplicatorLayer *Rlayer;
@end

@implementation ReplicatorHudView

-(instancetype)initWithCGRect:(CGRect)rect color:(UIColor *)color{
    self = [super init];
    if (self) {
        self.frame = rect;
        self.durTime = 1;
        [self buildReplicatorLayerColor:color];
    }
    return self;
}

- (void)buildReplicatorLayerColor:(UIColor *)color{
    self.Rlayer = [[CAReplicatorLayer alloc] init];
    self.Rlayer.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    //Rlayer.anchorPoint = CGPointMake(0, 0);
    self.Rlayer.backgroundColor = [UIColor clearColor].CGColor;
    self.Rlayer.instanceCount = 12;
    self.Rlayer.instanceTransform = CATransform3DMakeRotation((2 * M_PI)/12.f, 0, 0, 1);
    self.Rlayer.instanceDelay = _durTime/12;
    self.Rlayer.masksToBounds = YES;
    [self.layer addSublayer:self.Rlayer];
    [self.Rlayer addSublayer:[self buildAnimationLayerColor:color]];
}

- (void)setDurTime:(CGFloat)durTime{
    [self.ALayer removeAnimationForKey:@"move"];
    [self.ALayer removeAnimationForKey:@"color"];
    _durTime = durTime;
    [self addAnimationLayer:self.ALayer];
    self.Rlayer.instanceDelay = _durTime/12;
}

- (void)setNeedGradient:(BOOL)needGradient{
    _needGradient = needGradient;
    if (self.needGradient) {
        [self addGradientAnimation:self.ALayer];
    }
}

- (CALayer *)buildAnimationLayerColor:(UIColor *)color{
    self.ALayer = [[CALayer alloc] init];
    //ALayer.anchorPoint = CGPointMake(0, 0);
    self.ALayer.frame = CGRectMake(self.frame.size.width/2.f, 0, self.frame.size.width/8.f, self.frame.size.height/8.f);
    self.ALayer.cornerRadius = self.frame.size.width/16.f;
    self.ALayer.backgroundColor = color.CGColor;
    self.ALayer.transform = CATransform3DMakeScale(0.01, 0.01, 0.01);
    [self addAnimationLayer:self.ALayer];
    return self.ALayer;
}

- (void)addAnimationLayer:(CALayer *)layer{
    CABasicAnimation *anim = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    anim.duration = self.durTime;
    anim.fromValue = [NSNumber numberWithInteger:1];
    anim.toValue = [NSNumber numberWithDouble:0.1];
    anim.repeatCount = HUGE;
    anim.removedOnCompletion = NO;
    [layer addAnimation:anim forKey:@"move"];
}

- (void)addGradientAnimation:(CALayer *)layer{
    CABasicAnimation *anim1 = [CABasicAnimation animationWithKeyPath:@"backgroundColor"];
    anim1.duration = self.durTime;
    anim1.fromValue = (id)layer.backgroundColor;
    anim1.toValue = (id)[UIColor colorWithRed:250/256.f green:250/256.f blue:250/256.f alpha:1].CGColor;
    anim1.removedOnCompletion = NO;
    anim1.repeatCount = HUGE;
    [layer addAnimation:anim1 forKey:@"color"];
}
@end
