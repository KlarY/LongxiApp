//
//  SignUpViewController.m
//  LongxiApp
//
//  Created by Klar on 15/10/13.
//  Copyright © 2015年 truno. All rights reserved.
//

#import "SignUpViewController.h"
#import "LoginViewController.h"
#import "AppDelegate.h"

@interface SignUpViewController ()<UITextFieldDelegate>{
    
}

@end

@implementation SignUpViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
    
    
    UILabel* logo = [[UILabel alloc] initWithFrame:CGRectMake((viewWidth-200)/2, viewHeight/5-50, 200, 30)];
    logo.textAlignment = NSTextAlignmentCenter;
    logo.text = @"LOGO";
    logo.textColor = [UIColor whiteColor];
    logo.font = [UIFont systemFontOfSize: 40];
    [self.view addSubview:logo];
    
    
    UITextField* telField = [[UITextField alloc] initWithFrame:CGRectMake(25, logo.frame.origin.y+logo.frame.size.height+viewHeight/10, viewWidth-50, 50)];
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
    
    UIButton* getYzm = [[UIButton alloc] initWithFrame:CGRectMake(telField.frame.size.width-100, 0, 100, telField.frame.size.height)];
    [getYzm addTarget:self action:@selector(getYzmBtnClicked) forControlEvents:UIControlEventTouchUpInside];
    getYzm.backgroundColor = [UIColor colorWithRed:(200.0/255.0) green:(200.0/255.0) blue:(200.0/255.0) alpha:(255.0/255.0)];
    [getYzm setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [getYzm setTitle:@"获取验证码" forState:UIControlStateNormal];
    getYzm.titleLabel.font = [UIFont systemFontOfSize: 15];
    [telField addSubview:getYzm];
    
    
    [self.view addSubview:telField];
    
    
    UIView* sep1 = [[UIView alloc] initWithFrame:CGRectMake(25, telField.frame.origin.y+telField.frame.size.height, viewWidth-50, 0.5)];
    sep1.backgroundColor = [UIColor colorWithRed:(226.0/255.0) green:(226.0/255.0) blue:(226.0/255.0) alpha:(255.0/255.0)];
    [self.view addSubview:sep1];
    
    
    UITextField* yzm = [[UITextField alloc] initWithFrame:CGRectMake(25, sep1.frame.origin.y+sep1.frame.size.height, viewWidth-50, 50)];
    yzm.delegate = self;
    yzm.tag = 38;
    UIView * yzmLeftPaddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
    yzm.layer.borderWidth = 0;
    yzm.keyboardType = UIKeyboardTypeAlphabet;
    yzm.leftView = yzmLeftPaddingView;
    yzm.leftViewMode = UITextFieldViewModeAlways;
    yzm.backgroundColor = [UIColor whiteColor];
    yzm.placeholder = @"验证码";
    
//    UIButton* getYzm = [[UIButton alloc] initWithFrame:CGRectMake(yzm.frame.size.width-100, 0, 100, yzm.frame.size.height)];
//    getYzm.backgroundColor = [UIColor colorWithRed:(51.0/255.0) green:(177.0/255.0) blue:(158.0/255.0) alpha:(255.0/255.0)];
//    [getYzm setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//    [getYzm setTitle:@"获取验证码" forState:UIControlStateNormal];
//    getYzm.titleLabel.font = [UIFont systemFontOfSize: 15];
//    [yzm addSubview:getYzm];
    
    [self.view addSubview:yzm];
    
    UIView* sep2 = [[UIView alloc] initWithFrame:CGRectMake(25, yzm.frame.origin.y+yzm.frame.size.height, viewWidth-50, 0.5)];
    sep2.backgroundColor = [UIColor colorWithRed:(226.0/255.0) green:(226.0/255.0) blue:(226.0/255.0) alpha:(255.0/255.0)];
    [self.view addSubview:sep2];
    
    UITextField* name = [[UITextField alloc] initWithFrame:CGRectMake(25, sep2.frame.origin.y+sep2.frame.size.height, viewWidth-50, 50)];
    name.delegate = self;
    name.tag = 39;
    UIView * nameLeftPaddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
    name.layer.borderWidth = 0;
    name.leftView = nameLeftPaddingView;
    name.leftViewMode = UITextFieldViewModeAlways;
    name.backgroundColor = [UIColor whiteColor];
    name.placeholder = @"姓名";
    [self.view addSubview:name];
    
    UIView* sep3 = [[UIView alloc] initWithFrame:CGRectMake(25, name.frame.origin.y+name.frame.size.height, viewWidth-50, 0.5)];
    sep3.backgroundColor = [UIColor colorWithRed:(226.0/255.0) green:(226.0/255.0) blue:(226.0/255.0) alpha:(255.0/255.0)];
    [self.view addSubview:sep3];
    
    UITextField* passField = [[UITextField alloc] initWithFrame:CGRectMake(25, sep3.frame.origin.y+sep3.frame.size.height, viewWidth-50, 50)];
    passField.delegate = self;
    passField.tag = 40;
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
    [btn addTarget:self action:@selector(signupBtnClicked) forControlEvents:UIControlEventTouchUpInside];
    btn.layer.cornerRadius = 2;
    btn.layer.masksToBounds = YES;
    btn.backgroundColor = [UIColor colorWithRed:(51.0/255.0) green:(177.0/255.0) blue:(158.0/255.0) alpha:(255.0/255.0)];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btn setTitle:@"注册" forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize: 20];
    [self.view addSubview:btn];
    
    
    UILabel* signUp = [[UILabel alloc] initWithFrame:CGRectMake((viewWidth-200)/2, viewHeight*5.2/6, 200, 20)];
    signUp.textAlignment = NSTextAlignmentCenter;
    signUp.text = @"已有帐号？";
    signUp.textColor = [UIColor whiteColor];
    signUp.font = [UIFont systemFontOfSize: 17];
    UITapGestureRecognizer* signupTapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onSignupClicked:)];
    signUp.userInteractionEnabled = YES;
    signupTapGesture.numberOfTapsRequired = 1;
    signupTapGesture.numberOfTapsRequired = 1;
    [signUp addGestureRecognizer:signupTapGesture];
    [self.view addSubview:signUp];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)onSignupClicked:(UITapGestureRecognizer*)sender{
    NSLog(@"DiuDiuDiu!");
//    LoginViewController* login = [[LoginViewController alloc] init];
    [(AppDelegate*)[[UIApplication sharedApplication] delegate] goLogin];
}

-(void)onforgetPassClicked:(UITapGestureRecognizer*)sender{
    NSLog(@"BiuBiuBiu!");
}

-(void) dismissKeyboard:(id)sender
{
    [self.view endEditing:YES];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if (textField.tag != 40){
        UITextField* next = (UITextField*)[self.view viewWithTag:textField.tag+1];
        [textField resignFirstResponder];
        [next becomeFirstResponder];
        return NO;
    }else{
        [textField resignFirstResponder];
        return YES;
    }
}


-(void)getYzmBtnClicked{
    NSLog(@"Get!");
}

-(void)signupBtnClicked{
    [(AppDelegate*)[[UIApplication sharedApplication] delegate] getStart];
    NSLog(@"Sign Up!");
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
