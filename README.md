# WSLoginView
登录窗口,登录动画,登录页面

[GitHub: https://github.com/Zws-China/WSLoginView](https://github.com/Zws-China/WSLoginView)  


# How To Use

```ruby

将工程下WSLoginView文件夹导入您的工程项目。

#import "WSLoginView.h"

WSLoginView *wsLoginV = [[WSLoginView alloc]initWithFrame:self.view.bounds];
wsLoginV.titleLabel.text = @"我是一只猫头鹰";
wsLoginV.titleLabel.textColor = [UIColor grayColor];
wsLoginV.hideEyesType = AllEyesHide;//遮挡眼睛类型
[self.view addSubview:wsLoginV];

[wsLoginV setClickBlock:^(NSString *textField1Text, NSString *textField2Text) {

NSLog(@"点击了登录按钮textField1 = %@   textField2 = %@",textField1Text,textField2Text);
UIAlertView *alertV = [[UIAlertView alloc]initWithTitle:@"登录按钮事件" message:[NSString stringWithFormat:@"账号：%@\n密码：%@",textField1Text,textField2Text] delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
[alertV show];
}];

```


## 遮挡眼睛的样式
```ruby
typedef enum {
AllEyesHide,    //全部遮住
LeftEyeHide,    //遮住左眼
RightEyeHide,   //遮住右眼
NOEyesHide     //两个都漏一半眼睛
}HideEyesType;

```
<br><br>
#### （AllEyesHide）全部遮住<br>
![all](http://img.blog.csdn.net/20170427151953858?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQvcXFfMjY1OTgwNzc=/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/SouthEast)
<br>
#### （LeftEyeHide）遮住左眼<br>
![Left](http://img.blog.csdn.net/20170427152225619?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQvcXFfMjY1OTgwNzc=/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/SouthEast)
<br>
#### （RightEyeHide）遮住右眼<br>
![遮住右眼](http://img.blog.csdn.net/20170411102634498?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQvcXFfMjY1OTgwNzc=/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/SouthEast)
<br>
#### （NOEyesHide）两只眼睛都漏一半<br>
![NO](http://img.blog.csdn.net/20170427152035241?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQvcXFfMjY1OTgwNzc=/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/SouthEast)
<br>
#### github下载地址：[https://github.com/Zws-China/WSLoginView](https://github.com/Zws-China/WSLoginView)<br>
如果觉得对你还有些用，给一颗star吧。你的支持是我继续的动力。<br>


