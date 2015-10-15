//
//  AppDelegate.h
//  LongxiApp
//
//  Created by Klar on 15/10/12.
//  Copyright © 2015年 truno. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) UINavigationController *navController;

-(void)getStart;
-(void)goLogin;
-(void)goSignup;
@end

