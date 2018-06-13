//
//  wordLoadingView.m
//  ReplicatorAnimation
//
//  Created by yinheng on 2018/6/12.
//  Copyright © 2018年 daqsoft. All rights reserved.
//

#import "WordLoadingView.h"
#import <CoreText/CoreText.h>
@interface WordLoadingView ()

/**
 * 文本框
 */
@property (strong, nonatomic) UILabel *loadingLabel;

/**
 * 渐变色图层
 */
@property (strong, nonatomic) CAGradientLayer *gradientLayer;

/**
 * 文字重绘图层
 */
@property (strong, nonatomic) CAShapeLayer *rewriteShapeLayer;

@end

@implementation WordLoadingView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        _textWord = @"加载中";
        _wordColor = [UIColor redColor];
        _fontSize = 15;
    }
    return self;
}

- (void)setType:(WordLoadingType)type{
    _type = type;
    // 判断需要加什么类型
    if (type == 0) {
        [self addSubview:self.loadingLabel];
        [self addAnimationForShine];
    }else{
        [self.layer addSublayer:self.rewriteShapeLayer];
        [self addAnimationForRewrite];
    }
    
}

- (void)setTextWord:(NSString *)textWord{
    _textWord = textWord;
    if (self.type == 0) {
        self.loadingLabel.text = textWord;
    }else{
        [self addAnimationForRewrite];
    }
}

- (void)setWordColor:(UIColor *)wordColor{
    _wordColor = wordColor;
    self.loadingLabel.textColor = wordColor;
    self.rewriteShapeLayer.strokeColor = wordColor.CGColor;
}

- (void)setFontSize:(CGFloat)fontSize{
    _fontSize = fontSize;
    self.loadingLabel.font = [UIFont systemFontOfSize:fontSize];
    [self addAnimationForRewrite];
}

-(UILabel *)loadingLabel{
    if (!_loadingLabel) {
        _loadingLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
        _loadingLabel.text = _textWord;
        _loadingLabel.textColor = _wordColor;
        _loadingLabel.font = [UIFont systemFontOfSize:_fontSize];
        _loadingLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _loadingLabel;
}

- (CAGradientLayer *)gradientLayer{
    if (!_gradientLayer) {
        self.gradientLayer = [[CAGradientLayer alloc] init];
        self.gradientLayer.frame = self.loadingLabel.bounds;
        self.gradientLayer.colors = @[(__bridge id)[[UIColor whiteColor] colorWithAlphaComponent:0.3].CGColor,
                                      (__bridge id)[UIColor whiteColor].CGColor,
                                      (__bridge id)[[UIColor whiteColor] colorWithAlphaComponent:0.3].CGColor];;
        // 设置渐变方向起点
        self.gradientLayer.startPoint = CGPointMake(0, 0);
        // 设置渐变方向终点
        self.gradientLayer.endPoint = CGPointMake(1, 0);
        self.gradientLayer.locations = @[@(0.0),@(0.1),@(0.3)];
    }
    return _gradientLayer;
}

- (CAShapeLayer *)rewriteShapeLayer{
    if (!_rewriteShapeLayer) {
        self.rewriteShapeLayer = [CAShapeLayer layer];
        self.rewriteShapeLayer.frame = self.bounds;
        self.rewriteShapeLayer.geometryFlipped = YES;
        self.rewriteShapeLayer.fillColor = [UIColor clearColor].CGColor;
        self.rewriteShapeLayer.lineWidth = 1.0;
        self.rewriteShapeLayer.lineJoin = kCALineJoinRound;
    }
    return _rewriteShapeLayer;
}

- (void)addAnimationForShine{
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"locations"];
    animation.duration = 2;
    animation.toValue = @[@(0.9),@(1.0),@(1.0)];
    animation.removedOnCompletion = NO;
    animation.repeatCount = HUGE;
    animation.fillMode = kCAFillModeForwards;
    [self.gradientLayer addAnimation:animation forKey:@"shine"];
    self.loadingLabel.layer.mask = self.gradientLayer;
}

- (void)addAnimationForRewrite{
    UIBezierPath *path = [self bezierPathWithText:_textWord attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:_fontSize]}];    //文字、大小
    self.rewriteShapeLayer.bounds = CGPathGetBoundingBox(path.CGPath);
    self.rewriteShapeLayer.path = path.CGPath;
    // 字体颜色
    self.rewriteShapeLayer.strokeColor = self.wordColor.CGColor;
    [self.rewriteShapeLayer removeAllAnimations];
    
    CABasicAnimation *pathAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    // 动画时间
    pathAnimation.duration = 3.0;
    pathAnimation.fromValue = @(0.1);
    pathAnimation.toValue = @(1.0);
    pathAnimation.repeatCount = HUGE;
    pathAnimation.removedOnCompletion = NO;
    // Layer 加动画
    [self.rewriteShapeLayer addAnimation:pathAnimation forKey:@"rewrite"];

}

- (UIBezierPath *)bezierPathWithText:(NSString *)text attributes:(NSDictionary *)attrs; {
    NSAssert(text!= nil && attrs != nil, @"参数不能为空");
    NSAttributedString *attrString = [[NSAttributedString alloc] initWithString:text
                                                                     attributes:attrs];
    CGMutablePathRef paths = CGPathCreateMutable();
    CTLineRef line = CTLineCreateWithAttributedString((CFAttributedStringRef)attrString);
    CFArrayRef runArray = CTLineGetGlyphRuns(line);
    
    for (CFIndex runIndex = 0; runIndex < CFArrayGetCount(runArray); runIndex++)
    {
        CTRunRef run = (CTRunRef)CFArrayGetValueAtIndex(runArray, runIndex);
        CTFontRef runFont = CFDictionaryGetValue(CTRunGetAttributes(run), kCTFontAttributeName);
        
        for (CFIndex runGlyphIndex = 0; runGlyphIndex < CTRunGetGlyphCount(run); runGlyphIndex++)
        {
            CFRange thisGlyphRange = CFRangeMake(runGlyphIndex, 1);
            CGGlyph glyph;
            CGPoint position;
            CTRunGetGlyphs(run, thisGlyphRange, &glyph);
            CTRunGetPositions(run, thisGlyphRange, &position);
            {
                CGPathRef path = CTFontCreatePathForGlyph(runFont, glyph, NULL);
                CGAffineTransform t = CGAffineTransformMakeTranslation(position.x, position.y);
                CGPathAddPath(paths, &t,path);
                CGPathRelease(path);
            }
        }
    }
    CFRelease(line);
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointZero];
    [path appendPath:[UIBezierPath bezierPathWithCGPath:paths]];
    CGPathRelease(paths);
    return path;
}

@end
