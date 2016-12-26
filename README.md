# WSLoginView
登录窗口,登录动画,登录页面

[GitHub: https://github.com/Zws-China/WSLoginView](https://github.com/Zws-China/WSLoginView)  

# PhotoShoot
![image](https://github.com/Zws-China/.../blob/master/WSLoginView.gif)

# How To Use

```ruby

将工程下WSLoginView文件夹导入您的工程项目。

#import "WSLoginView.h"

WSLoginView *wsLoginV = [[WSLoginView alloc]initWithFrame:self.view.bounds];
wsLoginV.titleLabel.text = @"我是一只猫头鹰";
wsLoginV.titleLabel.textColor = [UIColor grayColor];
[self.view addSubview:wsLoginV];

[wsLoginV setClickBlock:^(NSString *textField1Text, NSString *textField2Text) {

    NSLog(@"点击了登录按钮textField1 = %@   textField2 = %@",textField1Text,textField2Text);
    UIAlertView *alertV = [[UIAlertView alloc]initWithTitle:@"登录按钮事件" message:[NSString stringWithFormat:@"账号：%@\n密码：%@",textField1Text,textField2Text] delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
    [alertV show];

}];


```