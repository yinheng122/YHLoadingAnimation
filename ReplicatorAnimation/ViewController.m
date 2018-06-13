//
//  ViewController.m
//  ReplicatorAnimation
//
//  Created by yinheng on 2018/6/8.
//  Copyright © 2018年 daqsoft. All rights reserved.
//

#import "ViewController.h"
#import "ReplicatorMusicAnimationView.h"
#import "ReplicatorHudView.h"
#import "LoadingView.h"
#import "WordLoadingView.h"
#define UIScreenWidth [UIScreen mainScreen].bounds.size.width
#define UIScreenHeight [UIScreen mainScreen].bounds.size.height
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    ReplicatorMusicAnimationView *musicAnimationView = [[ReplicatorMusicAnimationView alloc] initWithCGRect:CGRectMake(100, 100, 30, 40) color:[UIColor redColor]];
    musicAnimationView.durTime = 1;
    musicAnimationView.needGradient = YES;
    [self.view addSubview:musicAnimationView];
    
    ReplicatorHudView *hudView = [[ReplicatorHudView alloc] initWithCGRect:CGRectMake(200, 200, 50, 50) color:[UIColor colorWithRed:255/256.f green:57/256.f blue:55/256.f alpha:1]];
    hudView.durTime = 1;
    hudView.needGradient = YES;
    [self.view addSubview:hudView];
    
    LoadingView *loadingView = [[LoadingView alloc] initWithFrame:CGRectMake(10, 150, 45, 45)];
    [self.view addSubview:loadingView];
    
    WordLoadingView *wordLoadingView = [[WordLoadingView alloc] initWithFrame:CGRectMake(10, 300, 350, 50)];
    wordLoadingView.wordColor = [UIColor greenColor];
    wordLoadingView.type = RewriteWordType;
    wordLoadingView.textWord = @"loading";
    [self.view addSubview:wordLoadingView];
    
    WordLoadingView *wordLoadingShineView = [[WordLoadingView alloc] initWithFrame:CGRectMake(10, 350, 350, 50)];
    wordLoadingShineView.type = ShineWordType;
    wordLoadingShineView.wordColor = [UIColor orangeColor];
    wordLoadingShineView.fontSize = 30;
    [self.view addSubview:wordLoadingShineView];
    
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(250, 300, 80, 80)];
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    animation.duration = 3.0;
    animation.fromValue = @(0);
    animation.toValue = @(1);
    animation.repeatCount = HUGE;
    animation.removedOnCompletion = NO;
    CAShapeLayer *layer = [self createShapeLayer:[UIColor clearColor]];
    layer.path = path.CGPath;
    layer.lineWidth = 5.0;
    // 圆的起始位置，默认为0
    layer.strokeStart = 0;
    // 圆的结束位置，默认为1，如果值为0.75，则显示3/4的圆
    layer.strokeEnd = 1;
    [layer addAnimation:animation forKey:@"strokeEndAnimation"];
    //create a replicator layer and add it to our view
//    CAReplicatorLayer *replicator = [CAReplicatorLayer layer];
//    replicator.frame = CGRectMake(0, 0, UIScreenWidth, UIScreenHeight);
//    [self.view.layer addSublayer:replicator];
//    self.view.backgroundColor = [UIColor lightGrayColor];
//
//    //configure the replicator
//    replicator.instanceCount = 4;
//
//    //apply a transform for each instance
//    CATransform3D transform = CATransform3DIdentity;
//
//    transform = CATransform3DRotate(transform, M_PI / 10.0, 0, 0, 1);
//
//    replicator.instanceTransform = transform;
//
//    //apply a color shift for each instance
//    replicator.instanceBlueOffset = -0.1;
//    replicator.instanceGreenOffset = -0.1;
//    replicator.instanceDelay = 3;
    //create a sublayer and place it inside the replicator
//    CALayer *layer = [CALayer layer];
//    layer.frame = CGRectMake(0.0f, 0.0f, 100.0f, 100.0f);
//    layer.backgroundColor = [UIColor whiteColor].CGColor;
//    [replicator addSublayer:layer];
    
    
    
    
    
    // Do any additional setup after loading the view, typically from a nib.
}
- (CAShapeLayer *)createShapeLayer:(UIColor *)color
{
    CAShapeLayer *layer = [CAShapeLayer layer];
    //    layer.frame = CGRectMake(0, 0, 50, 50);
    //设置背景色
    //    layer.backgroundColor = [UIColor cyanColor].CGColor;
    //设置描边色
    layer.strokeColor = [UIColor redColor].CGColor;
    //设置填充色
    layer.fillColor = color.CGColor;
    [self.view.layer addSublayer:layer];
    
    return layer;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
