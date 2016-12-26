//
//  WSLoginView.h
//  WSLoginView
//
//  Created by iMac on 16/12/23.
//  Copyright © 2016年 zws. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WSLoginView : UIView


typedef void (^ClicksAlertBlock)(NSString *textField1Text, NSString *textField2Text);
@property (nonatomic, copy, readonly) ClicksAlertBlock clickBlock;

@property(nonatomic,strong)UITextField *textField1;

@property(nonatomic,strong)UITextField *textField2;

@property(nonatomic,strong)UIButton *loginBtn;

@property(nonatomic,strong)UILabel *titleLabel;


- (void)setClickBlock:(ClicksAlertBlock)clickBlock;

@end
