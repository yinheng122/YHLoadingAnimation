# YHLoadingAnimation
## 使用方便简单，一行代码嵌入加载动画

    ···Objective-C
 // 旋转加载动画
 ReplicatorHudView *hudView = [[ReplicatorHudView alloc] initWithCGRect:CGRectMake(200, 200, 50, 50) color:[UIColor colorWithRed:255/256.f green:57/256.f blue:55/256.f alpha:1]];
 // 音乐播放中动画
 ReplicatorMusicAnimationView *musicAnimationView = [[ReplicatorMusicAnimationView alloc] initWithCGRect:CGRectMake(100, 100, 30, 40) color:[UIColor redColor]];
 // 文字显示加载动画 （两种类型：闪光类型和重绘字类型。默认为闪光类型）
 WordLoadingView *wordLoadingView = [[WordLoadingView alloc] initWithFrame:CGRectMake(10, 300, 350, 50)];
 // 打开注释为重绘字类型
 // wordLoadingShineView.type = RewriteWordType;
 // 渐变色旋转加载动画
 LoadingView *loadingView = [[LoadingView alloc] initWithFrame:CGRectMake(10, 150, 45, 45)];
    ···
