# YHLoadingAnimation
## 使用方便简单，一行代码嵌入加载动画

```objc
// 旋转加载动画
ReplicatorHudView *hudView = [[ReplicatorHudView alloc] initWithCGRect:CGRectMake(200, 200, 50, 50) color:[UIColor          colorWithRed:255/256.f green:57/256.f blue:55/256.f alpha:1]];
```
![(ReplicatorHudAnimation)](http://bmob-cdn-15727.b0.upaiyun.com/2018/06/14/ee95bc1140aa4dc18054edfe38c5a529.gif)
```objc
// 音乐播放中动画
ReplicatorMusicAnimationView *musicAnimationView = [[ReplicatorMusicAnimationView alloc] initWithCGRect:CGRectMake(100, 100, 30, 40) color:[UIColor redColor]];
```
![(musicLoadingAnimation)](http://bmob-cdn-15727.b0.upaiyun.com/2018/06/14/5b6e22aa40ea6be680e67ee176b8d370.gif)
```objc
// 文字显示加载动画 （两种类型：闪光类型和重绘字类型。默认为闪光类型）
WordLoadingView *wordLoadingView = [[WordLoadingView alloc] initWithFrame:CGRectMake(10, 300, 350, 50)];
// 打开注释为重绘字类型
// wordLoadingShineView.type = RewriteWordType;
```
![(wordLoadingAnimation)](http://bmob-cdn-15727.b0.upaiyun.com/2018/06/14/72e4a24d4042280c80c31b4c1f0b03bc.gif)
```objc
// 渐变色旋转加载动画
LoadingView *loadingView = [[LoadingView alloc] initWithFrame:CGRectMake(10, 150, 45, 45)];
```
![(LoadingAnimation)](http://bmob-cdn-15727.b0.upaiyun.com/2018/06/14/cf9d94ff40b16389804ae1767b992877.gif)

## 安装方式
### 使用cocoapods
`pod 'YHLoadingAnimation'`

### 手动安装
拖动YHLoadingAnimation文件到工程中


