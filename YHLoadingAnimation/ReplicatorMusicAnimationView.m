//
//  ReplicatorMusicAnimationView.m
//  ReplicatorAnimation
//
//  Created by yinheng on 2018/6/8.
//  Copyright © 2018年 daqsoft. All rights reserved.
//

#import "ReplicatorMusicAnimationView.h"
@interface ReplicatorMusicAnimationView()

/**
 * 图层对象
 */
@property (strong, nonatomic) CALayer *ALayer;

/**
 * 重复图层
 */
@property (strong, nonatomic) CAReplicatorLayer *Rlayer;
@end
@implementation ReplicatorMusicAnimationView

-(instancetype)initWithCGRect:(CGRect)rect color:(UIColor *)color{
    self = [super init];
    if (self) {
        self.frame = rect;
        self.durTime = 0.7;
        [self buildReplicatorLayerColor:color];
    }
    return self;
}

- (void)buildReplicatorLayerColor:(UIColor *)color{
    self.Rlayer = [[CAReplicatorLayer alloc] init];
    self.Rlayer.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    //Rlayer.anchorPoint = CGPointMake(0, 0);
    self.Rlayer.backgroundColor = [UIColor clearColor].CGColor;
    self.Rlayer.instanceCount = 3;
    self.Rlayer.instanceTransform = CATransform3DMakeTranslation(self.frame.size.width/10 + self.frame.size.width/5, 0, 0);
    self.Rlayer.instanceDelay = 0.3;
    self.Rlayer.masksToBounds = YES;
    [self.layer addSublayer:self.Rlayer];
    [self.Rlayer addSublayer:[self buildAnimationLayerColor:color]];
}

- (CALayer *)buildAnimationLayerColor:(UIColor *)color{
    self.ALayer = [[CALayer alloc] init];
    //ALayer.anchorPoint = CGPointMake(0, 0);
    self.ALayer.frame = CGRectMake(self.frame.size.width/10, self.frame.size.height/5 * 4, self.frame.size.width/5, self.frame.size.height/5 * 4);
    self.ALayer.cornerRadius = 2;
    self.ALayer.backgroundColor = color.CGColor;
    [self addAnimationLayer:self.ALayer];
    return self.ALayer;
}



- (void)setDurTime:(CGFloat)durTime{
    [self.ALayer removeAnimationForKey:@"move"];
    _durTime = durTime;
    [self addAnimationLayer:self.ALayer];
}

- (void)setNeedGradient:(BOOL)needGradient{
    _needGradient = needGradient;
    if (self.needGradient) {
        [self addGradientAnimation:self.ALayer];
    }
}

- (void)addAnimationLayer:(CALayer *)layer{
    CABasicAnimation *anim = [CABasicAnimation animationWithKeyPath:@"position.y"];
    anim.duration = self.durTime;
    anim.toValue = [NSNumber numberWithDouble:self.frame.size.height/5 * 4];
    anim.autoreverses = true;
    anim.repeatCount = HUGE;
    anim.removedOnCompletion = NO;
    [layer addAnimation:anim forKey:@"move"];
}

- (void)addGradientAnimation:(CALayer *)layer{
    CABasicAnimation *anim1 = [CABasicAnimation animationWithKeyPath:@"backgroundColor"];
    anim1.duration = self.durTime * 2;
    anim1.fromValue = (id)layer.backgroundColor;
    anim1.toValue = (id)[UIColor colorWithRed:250/256.f green:250/256.f blue:250/256.f alpha:1].CGColor;
    anim1.removedOnCompletion = NO;
    anim1.repeatCount = HUGE;
    [layer addAnimation:anim1 forKey:@"color"];
}

@end
