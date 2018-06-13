//
//  ReplicatorMusicAnimationView.h
//  ReplicatorAnimation
//
//  Created by yinheng on 2018/6/8.
//  Copyright © 2018年 daqsoft. All rights reserved.
//
/**
 * 音乐播放效果
 * veriosn 1.0
 * xcode 9.2
 */
#import <UIKit/UIKit.h>

@interface ReplicatorMusicAnimationView : UIView

/**
 * 创建对象
 *
 * @param rect 设置尺寸大小
 * @param color 设置颜色
 *
 */

-(instancetype)initWithCGRect:(CGRect)rect color:(UIColor *)color;

/**
 * 动画的持续时间
 */
@property (assign, nonatomic) CGFloat durTime;

/**
 * 是否需要渐变
 */
@property (assign, nonatomic) BOOL needGradient;
@end
