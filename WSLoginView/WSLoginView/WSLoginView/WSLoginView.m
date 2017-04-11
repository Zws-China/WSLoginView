//
//  WSLoginView.m
//  WSLoginView
//
//  Created by iMac on 16/12/23.
//  Copyright © 2016年 zws. All rights reserved.
//

#import "WSLoginView.h"

typedef NS_ENUM(NSInteger, WSLoginShowType) {
    WSLoginShowType_NONE,
    WSLoginShowType_USER,
    WSLoginShowType_PASS
};
@interface WSLoginView ()<UITextFieldDelegate>


@end


@implementation WSLoginView {
    WSLoginShowType showType;

    UIVisualEffectView *smallView;

    UIImageView* imgLeftHand;
    UIImageView* imgRightHand;
    
    UIImageView* imgLeftHandGone;
    UIImageView* imgRightHandGone;

}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
        [self creatVisulBg];
        
        
        
        
        [self creatSubViews];
        
    }
    
    return self;
}

- (void)creatVisulBg {
    
    UIImageView *imageview = [[UIImageView alloc] initWithFrame:self.bounds];
    
    imageview.image = [UIImage imageNamed:@"bg.jpeg"];
    imageview.contentMode = UIViewContentModeScaleToFill;
    imageview.userInteractionEnabled = YES;
    [self addSubview:imageview];
    
    UIVisualEffectView *effectview = [[UIVisualEffectView alloc] initWithEffect:[UIBlurEffect effectWithStyle:UIBlurEffectStyleLight]];
    effectview.frame = CGRectMake(0, 0, imageview.frame.size.width, imageview.frame.size.height);
    [imageview addSubview:effectview];
    
}

- (void)creatSubViews {
    
    _hideEyesType = AllEyesHide;


    //猫头
    UIImageView* imgLogin = [[UIImageView alloc] initWithFrame:CGRectMake(self.frame.size.width / 2 - 211 / 2, 150-99, 211, 108)];
    imgLogin.image = [UIImage imageNamed:@"owl-login"];
    imgLogin.layer.masksToBounds = YES;
    [self addSubview:imgLogin];
    
    //捂眼的左右爪
    imgLeftHand = [[UIImageView alloc] initWithFrame:CGRectMake(1, 90, 40, 65)];
    imgLeftHand.image = [UIImage imageNamed:@"owl-login-arm-left"];
    [imgLogin addSubview:imgLeftHand];
    
    imgRightHand = [[UIImageView alloc] initWithFrame:CGRectMake(imgLogin.frame.size.width / 2 + 60, 90, 40, 65)];
    imgRightHand.image = [UIImage imageNamed:@"owl-login-arm-right"];
    [imgLogin addSubview:imgRightHand];
    
    //展开的左右爪
    imgLeftHandGone = [[UIImageView alloc] initWithFrame:CGRectMake(self.frame.size.width / 2 - 100, 150-22, 40, 40)];
    imgLeftHandGone.image = [UIImage imageNamed:@"icon_hand"];
    [self addSubview:imgLeftHandGone];
    
    
    imgRightHandGone = [[UIImageView alloc] initWithFrame:CGRectMake(self.frame.size.width / 2 + 62,  150-22, 40, 40)];
    imgRightHandGone.image = [UIImage imageNamed:@"icon_hand"];
    [self addSubview:imgRightHandGone];
    
    
    smallView = [[UIVisualEffectView alloc] initWithEffect:[UIBlurEffect effectWithStyle:UIBlurEffectStyleLight]];
    smallView.frame = CGRectMake(20, 150, self.frame.size.width-40, self.frame.size.width-40);
    smallView.layer.cornerRadius = 5;
    smallView.layer.masksToBounds = YES;
    [self addSubview:smallView];
    
    
    self.titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 15, smallView.frame.size.width-20, 20)];
    self.titleLabel.textColor = [UIColor whiteColor];
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.titleLabel.font = [UIFont systemFontOfSize:20];
    [smallView addSubview:self.titleLabel];
    
    self.textField1 = [[UITextField alloc]initWithFrame:CGRectMake(20, CGRectGetMaxY(self.titleLabel.frame)+15, smallView.frame.size.width-40, 40)];
    self.textField1.delegate = self;
    self.textField1.layer.cornerRadius = 5;
    self.textField1.layer.borderWidth = .5;
    self.textField1.clearButtonMode = UITextFieldViewModeWhileEditing;
    self.textField1.layer.borderColor = [UIColor grayColor].CGColor;
    self.textField1.placeholder = @"请输入账号";
    self.textField1.leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetHeight(self.textField1.frame), CGRectGetHeight(self.textField1.frame))];
    self.textField1.leftViewMode = UITextFieldViewModeAlways;
    UIImageView* imgUser = [[UIImageView alloc] initWithFrame:CGRectMake(9, 9, 22, 22)];
    imgUser.image = [UIImage imageNamed:@"iconfont-user"];
    [self.textField1.leftView addSubview:imgUser];
    [smallView addSubview:self.textField1];
    
    self.textField2 = [[UITextField alloc]initWithFrame:CGRectMake(CGRectGetMinX(self.textField1.frame), CGRectGetMaxY(self.textField1.frame)+10, CGRectGetWidth(self.textField1.frame), CGRectGetHeight(self.textField1.frame))];
    self.textField2.delegate = self;
    self.textField2.layer.cornerRadius = 5;
    self.textField2.layer.borderWidth = .5;
    self.textField2.clearButtonMode = UITextFieldViewModeWhileEditing;
    self.textField2.layer.borderColor = [UIColor grayColor].CGColor;
    self.textField2.placeholder = @"请输入密码";
    self.textField2.secureTextEntry = YES;
    self.textField2.leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetHeight(self.textField2.frame), CGRectGetHeight(self.textField2.frame))];
    self.textField2.leftViewMode = UITextFieldViewModeAlways;
    UIImageView* imgPwd = [[UIImageView alloc] initWithFrame:CGRectMake(6, 6, 28, 28)];
    imgPwd.image = [UIImage imageNamed:@"iconfont-password"];
    [self.textField2.leftView addSubview:imgPwd];
    [smallView addSubview:self.textField2];
    
    
    self.loginBtn = [[UIButton alloc]initWithFrame:CGRectMake(10, CGRectGetMaxY(self.textField2.frame)+10, smallView.frame.size.width-20, 40)];
    [self.loginBtn setTitle:@"登录" forState:UIControlStateNormal];
    self.loginBtn.layer.cornerRadius = 5;
    [self.loginBtn setBackgroundColor:[UIColor colorWithRed:83/255.0 green:149/255.0 blue:232/255.0 alpha:1]];
    [self.loginBtn addTarget:self action:@selector(LoginAction:) forControlEvents:UIControlEventTouchUpInside];
    [smallView addSubview:self.loginBtn];
    
    
    smallView.frame = CGRectMake(20, 150, self.frame.size.width-40, CGRectGetMaxY(self.loginBtn.frame)+15);

}


- (void)LoginAction:(UIButton *)sender{
    [self.textField1 resignFirstResponder];
    [self.textField2 resignFirstResponder];
    
    if (_clickBlock) {
        _clickBlock(self.textField1.text, self.textField2.text);
    }
}
- (void)setClickBlock:(ClicksAlertBlock)clickBlock{
    _clickBlock = [clickBlock copy];
}


- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    [self.textField1 resignFirstResponder];
    [self.textField2 resignFirstResponder];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self.window resignFirstResponder];
}

-(void)setHideEyesType:(HideEyesType)hideEyesType {
    _hideEyesType = hideEyesType;
}

//猫咪动画
- (void)textFieldDidBeginEditing:(UITextField *)textField {
    if ([textField isEqual:self.textField1]) {
        if (showType != WSLoginShowType_PASS)
        {
            showType = WSLoginShowType_USER;
            return;
        }
        showType = WSLoginShowType_USER;
        [UIView animateWithDuration:0.5 animations:^{
            
            imgLeftHand.frame = CGRectMake(imgLeftHand.frame.origin.x - 60, imgLeftHand.frame.origin.y + 30, imgLeftHand.frame.size.width, imgLeftHand.frame.size.height);
            imgRightHand.frame = CGRectMake(imgRightHand.frame.origin.x + 48, imgRightHand.frame.origin.y + 30, imgRightHand.frame.size.width, imgRightHand.frame.size.height);
            
            
            imgLeftHandGone.frame = CGRectMake(imgLeftHandGone.frame.origin.x - 70, imgLeftHandGone.frame.origin.y, 40, 40);
            
            imgRightHandGone.frame = CGRectMake(imgRightHandGone.frame.origin.x + 30, imgRightHandGone.frame.origin.y, 40, 40);
            
            
        } completion:^(BOOL b) {
        }];
        
    }
    else if ([textField isEqual:self.textField2]) {
        if (showType == WSLoginShowType_PASS)
        {
            showType = WSLoginShowType_PASS;
            return;
        }
        showType = WSLoginShowType_PASS;
        
        if (_hideEyesType == AllEyesHide) { //全部遮住
            [UIView animateWithDuration:0.5 animations:^{
                imgLeftHand.frame = CGRectMake(imgLeftHand.frame.origin.x + 60, imgLeftHand.frame.origin.y - 30, imgLeftHand.frame.size.width, imgLeftHand.frame.size.height);
                imgRightHand.frame = CGRectMake(imgRightHand.frame.origin.x - 48, imgRightHand.frame.origin.y - 30, imgRightHand.frame.size.width, imgRightHand.frame.size.height);
                
                
                imgLeftHandGone.frame = CGRectMake(imgLeftHandGone.frame.origin.x + 70, imgLeftHandGone.frame.origin.y, 0, 0);
                
                imgRightHandGone.frame = CGRectMake(imgRightHandGone.frame.origin.x - 30, imgRightHandGone.frame.origin.y, 0, 0);
                
            } completion:^(BOOL b) {
            }];

        }
        else if (_hideEyesType == LeftEyeHide) { //遮住左眼
            [UIView animateWithDuration:0.5 animations:^{
                imgLeftHand.frame = CGRectMake(imgLeftHand.frame.origin.x + 60, imgLeftHand.frame.origin.y - 30, imgLeftHand.frame.size.width, imgLeftHand.frame.size.height);
                imgRightHand.frame = CGRectMake(imgRightHand.frame.origin.x - 48, imgRightHand.frame.origin.y - 30, imgRightHand.frame.size.width, imgRightHand.frame.size.height);
                
                
                imgLeftHandGone.frame = CGRectMake(imgLeftHandGone.frame.origin.x + 70, imgLeftHandGone.frame.origin.y, 0, 0);
                
                imgRightHandGone.frame = CGRectMake(imgRightHandGone.frame.origin.x - 30, imgRightHandGone.frame.origin.y, 0, 0);
                
            } completion:^(BOOL b) {
                
                [UIView animateWithDuration:1.5 animations:^{
                    imgRightHand.transform = CGAffineTransformMakeTranslation(10, 0);
                }];
                
            }];
            
        }
        else if (_hideEyesType == RightEyeHide) { //遮住右眼
            [UIView animateWithDuration:0.5 animations:^{
                imgLeftHand.frame = CGRectMake(imgLeftHand.frame.origin.x + 60, imgLeftHand.frame.origin.y - 30, imgLeftHand.frame.size.width, imgLeftHand.frame.size.height);
                imgRightHand.frame = CGRectMake(imgRightHand.frame.origin.x - 48, imgRightHand.frame.origin.y - 30, imgRightHand.frame.size.width, imgRightHand.frame.size.height);
                
                
                imgLeftHandGone.frame = CGRectMake(imgLeftHandGone.frame.origin.x + 70, imgLeftHandGone.frame.origin.y, 0, 0);
                
                imgRightHandGone.frame = CGRectMake(imgRightHandGone.frame.origin.x - 30, imgRightHandGone.frame.origin.y, 0, 0);
                
            } completion:^(BOOL b) {
                [UIView animateWithDuration:1.5 animations:^{
                    imgLeftHand.transform = CGAffineTransformMakeTranslation(-13, 0);
                }];
            }];
            
        }
        else if (_hideEyesType == NOEyesHide) { //两个都漏一半眼睛
            [UIView animateWithDuration:0.5 animations:^{
                imgLeftHand.frame = CGRectMake(imgLeftHand.frame.origin.x + 60, imgLeftHand.frame.origin.y - 30, imgLeftHand.frame.size.width, imgLeftHand.frame.size.height);
                imgRightHand.frame = CGRectMake(imgRightHand.frame.origin.x - 48, imgRightHand.frame.origin.y - 30, imgRightHand.frame.size.width, imgRightHand.frame.size.height);
                
                
                imgLeftHandGone.frame = CGRectMake(imgLeftHandGone.frame.origin.x + 70, imgLeftHandGone.frame.origin.y, 0, 0);
                
                imgRightHandGone.frame = CGRectMake(imgRightHandGone.frame.origin.x - 30, imgRightHandGone.frame.origin.y, 0, 0);
                
            } completion:^(BOOL b) {
                [UIView animateWithDuration:1.5 animations:^{
                    imgLeftHand.transform = CGAffineTransformMakeTranslation(-13, 0);
                    imgRightHand.transform = CGAffineTransformMakeTranslation(10, 0);
                }];
            }];
            
        }
    }
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    
    if ([textField isEqual:self.textField2]) {
        if (showType == WSLoginShowType_PASS)
        {
            showType = WSLoginShowType_USER;
            [UIView animateWithDuration:0.5 animations:^{
                imgLeftHand.transform = CGAffineTransformIdentity;
                imgLeftHand.frame = CGRectMake(imgLeftHand.frame.origin.x - 60, imgLeftHand.frame.origin.y + 30, imgLeftHand.frame.size.width, imgLeftHand.frame.size.height);
                imgRightHand.transform = CGAffineTransformIdentity;
                imgRightHand.frame = CGRectMake(imgRightHand.frame.origin.x + 48, imgRightHand.frame.origin.y + 30, imgRightHand.frame.size.width, imgRightHand.frame.size.height);
                
                
                imgLeftHandGone.frame = CGRectMake(imgLeftHandGone.frame.origin.x - 70, imgLeftHandGone.frame.origin.y, 40, 40);
                
                imgRightHandGone.frame = CGRectMake(imgRightHandGone.frame.origin.x + 30, imgRightHandGone.frame.origin.y, 40, 40);
                
                
            } completion:^(BOOL b) {
            }];
            
        }
    }
    
}



@end
