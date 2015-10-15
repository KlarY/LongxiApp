//
//  ViewController.m
//  LongxiApp
//
//  Created by Klar on 15/10/12.
//  Copyright © 2015年 truno. All rights reserved.
//

#import "LoginViewController.h"
#import "SignUpViewController.h"
#import "AppDelegate.h"

@interface LoginViewController ()<UITextFieldDelegate>

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    float viewWidth = self.view.frame.size.width;
    float viewHeight = self.view.frame.size.height;
    
    self.view.backgroundColor = [UIColor blackColor];
    
    
    
    UITapGestureRecognizer* tapBackground = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissKeyboard:)];
    [tapBackground setNumberOfTapsRequired:1];
    [self.view addGestureRecognizer:tapBackground];
    
    
    
    UIView* bgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, viewWidth, viewHeight)];
    bgView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg.jpg"]];
    bgView.alpha=0.5;
    [self.view addSubview:bgView];
    
    
    UILabel* logo = [[UILabel alloc] initWithFrame:CGRectMake((viewWidth-200)/2, viewHeight/5-50, 200, 40)];
    logo.textAlignment = NSTextAlignmentCenter;
    logo.text = @"LOGO";
    logo.textColor = [UIColor whiteColor];
    logo.font = [UIFont systemFontOfSize: 40];
    [self.view addSubview:logo];
    
    
    UITextField* telField = [[UITextField alloc] initWithFrame:CGRectMake(25, logo.frame.origin.y+logo.frame.size.height+viewHeight/8, viewWidth-50, 50)];
    telField.delegate = self;
    telField.tag = 37;
    UIBezierPath* telMaskPath = [UIBezierPath bezierPathWithRoundedRect:telField.bounds byRoundingCorners:UIRectCornerTopLeft|UIRectCornerTopRight cornerRadii:CGSizeMake(2.0f, 2.0f)];
    CAShapeLayer *telMaskLayer = [[CAShapeLayer alloc] init];
    UIView * telLeftPaddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
    telField.layer.borderWidth = 0;
    telField.keyboardType = UIKeyboardTypeNumberPad;
    telField.leftView = telLeftPaddingView;
    telField.leftViewMode = UITextFieldViewModeAlways;
    telMaskLayer.frame = telField.bounds;
    telMaskLayer.path = telMaskPath.CGPath;
    telField.layer.mask = telMaskLayer;
    telField.backgroundColor = [UIColor whiteColor];
    telField.placeholder = @"手机号";
    [self.view addSubview:telField];
    
    UIView* sep = [[UIView alloc] initWithFrame:CGRectMake(25, telField.frame.origin.y+telField.frame.size.height, viewWidth-50, 0.5)];
    sep.backgroundColor = [UIColor colorWithRed:(226.0/255.0) green:(226.0/255.0) blue:(226.0/255.0) alpha:(255.0/255.0)];
    [self.view addSubview:sep];
    
    
    
    UITextField* passField = [[UITextField alloc] initWithFrame:CGRectMake(25, sep.frame.origin.y+sep.frame.size.height, viewWidth-50, 50)];
    passField.delegate = self;
    passField.tag = 38;
    UIBezierPath* passMaskPath = [UIBezierPath bezierPathWithRoundedRect:passField.bounds byRoundingCorners:UIRectCornerBottomLeft|UIRectCornerBottomRight cornerRadii:CGSizeMake(2.0f, 2.0f)];
    CAShapeLayer *passMaskLayer = [[CAShapeLayer alloc] init];
    UIView * passLeftPaddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
    passField.layer.borderWidth = 0;
    passField.keyboardType = UIKeyboardTypeAlphabet;
    [passField setSecureTextEntry:YES];
    passField.leftView = passLeftPaddingView;
    passField.leftViewMode = UITextFieldViewModeAlways;
    passMaskLayer.frame = passField.bounds;
    passMaskLayer.path = passMaskPath.CGPath;
    passField.layer.mask = passMaskLayer;
    passField.backgroundColor = [UIColor whiteColor];
    passField.placeholder = @"密码";
    [self.view addSubview:passField];
    
    
    
    UIButton* btn = [[UIButton alloc] initWithFrame:CGRectMake(25, passField.frame.origin.y+passField.frame.size.height+25, viewWidth-50, 50)];
    [btn addTarget:self action:@selector(loginBtnClicked) forControlEvents:UIControlEventTouchUpInside];
    btn.layer.cornerRadius = 2;
    btn.layer.masksToBounds = YES;
    btn.backgroundColor = [UIColor colorWithRed:(51.0/255.0) green:(177.0/255.0) blue:(158.0/255.0) alpha:(255.0/255.0)];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btn setTitle:@"登录" forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize: 20];
    [self.view addSubview:btn];
    
    
    UILabel* signUp = [[UILabel alloc] initWithFrame:CGRectMake((viewWidth-200)/2, viewHeight*5/6, 200, 20)];
    signUp.textAlignment = NSTextAlignmentCenter;
    signUp.text = @"注册新帐号";
    signUp.textColor = [UIColor whiteColor];
    signUp.font = [UIFont systemFontOfSize: 17];
    UITapGestureRecognizer* signupTapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onSignupClicked:)];
    signUp.userInteractionEnabled = YES;
    signupTapGesture.numberOfTapsRequired = 1;
    signupTapGesture.numberOfTapsRequired = 1;
    [signUp addGestureRecognizer:signupTapGesture];
    [self.view addSubview:signUp];
    
    
    UILabel* forgetPass = [[UILabel alloc] initWithFrame:CGRectMake((viewWidth-200)/2, signUp.frame.origin.y+signUp.frame.size.height+30, 200, 20)];
    forgetPass.textAlignment = NSTextAlignmentCenter;
    forgetPass.text = @"忘记密码";
    forgetPass.textColor = [UIColor whiteColor];
    forgetPass.font = [UIFont systemFontOfSize: 13];
    UITapGestureRecognizer* forgetPassTapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onforgetPassClicked:)];
    forgetPass.userInteractionEnabled = YES;
    forgetPassTapGesture.numberOfTapsRequired = 1;
    forgetPassTapGesture.numberOfTapsRequired = 1;
    [forgetPass addGestureRecognizer:forgetPassTapGesture];
    [self.view addSubview:forgetPass];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)onSignupClicked:(UITapGestureRecognizer*)sender{
    NSLog(@"DiuDiuDiu!");
//    SignUpViewController* signUp = [[SignUpViewController alloc] init];
//    [UIApplication sharedApplication].keyWindow.rootViewController = signUp;
    
    [(AppDelegate*)[[UIApplication sharedApplication] delegate] goSignup];
}

-(void)onforgetPassClicked:(UITapGestureRecognizer*)sender{
    NSLog(@"BiuBiuBiu!");
}

-(void) dismissKeyboard:(id)sender
{
    [self.view endEditing:YES];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if (textField.tag == 37){
        UITextField* next = (UITextField*)[self.view viewWithTag:38];
        [textField resignFirstResponder];
        [next becomeFirstResponder];
        return NO;
    }else{
        [textField resignFirstResponder];
        return YES;
    }
}

-(void)loginBtnClicked{
//    [UIApplication sharedApplication].keyWindow = [[UINavigationController alloc] init];
//    [[UIApplication sharedApplication].navController pushViewController:rootView animated:YES];
//    [[UIApplication sharedApplication].keyWindow addSubview:[UIApplication sharedApplication].navController.view];
//    [[UIApplication sharedApplication].keyWindow makeKeyAndVisible];
    [(AppDelegate*)[[UIApplication sharedApplication] delegate] getStart];
    NSLog(@"Login!");
}
@end
