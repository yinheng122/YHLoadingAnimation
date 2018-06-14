//
//  wordLoadingView.h
//  ReplicatorAnimation
//
//  Created by yinheng on 2018/6/12.
//  Copyright © 2018年 daqsoft. All rights reserved.
//
/**
 * 文字加载动画
 * veriosn 1.0
 * xcode 9.2
 */
#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger, WordLoadingType){
    
    /**
     * 文字闪光动画
     */
    ShineWordType = 0,
    
    /**
     * 重新写文字动画
     */
    RewriteWordType = 1,
};
/**
 * 文字加载动画视图，设置大小即可使用，默认：字体大小15，颜色红色，动画类型为闪光类型
 */
@interface WordLoadingView : UIView

/**
 * 初始化方法
 */
- (instancetype)initWithFrame:(CGRect)frame;

/**
 * 需要加动画的文字，如果不写默认为加载中
 */
@property (strong, nonatomic) NSString *textWord;

/**
 * 动画类型
 */
@property (assign, nonatomic) WordLoadingType type;

/**
 * 文字颜色
 */
@property (strong, nonatomic) UIColor *wordColor;

/**
 * 字体大小
 */
@property (assign, nonatomic) CGFloat fontSize;
@end
