//
//  ViewController.m
//  WSLoginView
//
//  Created by iMac on 16/12/26.
//  Copyright © 2016年 zws. All rights reserved.
//

#import "ViewController.h"
#import "WSLoginView.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    WSLoginView *wsLoginV = [[WSLoginView alloc]initWithFrame:self.view.bounds];
    wsLoginV.titleLabel.text = @"我是一只猫头鹰";
    wsLoginV.titleLabel.textColor = [UIColor grayColor];
    wsLoginV.hideEyesType = AllEyesHide;
    [self.view addSubview:wsLoginV];
    
    [wsLoginV setClickBlock:^(NSString *textField1Text, NSString *textField2Text) {
        
        NSLog(@"点击了登录按钮textField1 = %@   textField2 = %@",textField1Text,textField2Text);
        UIAlertView *alertV = [[UIAlertView alloc]initWithTitle:@"登录按钮事件" message:[NSString stringWithFormat:@"账号：%@\n密码：%@",textField1Text,textField2Text] delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alertV show];
    }];
    
    
}



@end
