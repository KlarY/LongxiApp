//
//  MainViewController.m
//  LongxiApp
//
//  Created by Klar on 15/10/14.
//  Copyright © 2015年 truno. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"龙溪App";
    self.view.backgroundColor = [UIColor colorWithRed:(245.0/255.0) green:(245.0/255.0) blue:(245.0/255.0) alpha:(255.0/255.0)];
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:(70.0/255.0) green:(70.0/255.0) blue:(70.0/255.0) alpha:(255.0/255.0)];
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];
    self.navigationController.navigationBar.translucent = NO;
    UIBarButtonItem *shareItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemBookmarks target:self action:nil];
    UIBarButtonItem *cameraItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCompose target:self action:nil];
    self.navigationItem.rightBarButtonItem = shareItem;
    self.navigationItem.leftBarButtonItem = cameraItem;
    
    // Do any additional setup after loading the view.
    
    
    SGFocusImageItem *item1 = [[SGFocusImageItem alloc] initWithTitle:@"" image:[UIImage imageNamed:@"app.png"] tag:0];
    SGFocusImageItem *item2 = [[SGFocusImageItem alloc] initWithTitle:@"" image:[UIImage imageNamed:@"crawler_raw.jpg"] tag:1];
    SGFocusImageItem *item3 = [[SGFocusImageItem alloc] initWithTitle:@"" image:[UIImage imageNamed:@"gqwm.jpg"] tag:2];
    SGFocusImageItem *item4 = [[SGFocusImageItem alloc] initWithTitle:@"" image:[UIImage imageNamed:@"qgfx_raw.jpg"] tag:4];
    SGFocusImageFrame *imageFrame = [[SGFocusImageFrame alloc] initWithFrame:CGRectMake(0, 10, self.view.bounds.size.width, 190.0)
                                                                    delegate:self
                                                             focusImageItems:item1, item2, item3, item4, nil];
    [self.view addSubview:imageFrame];
    
    
    UIButton* FoodBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 200, self.view.bounds.size.width/2, (self.view.bounds.size.height-264)/3)];
    [FoodBtn setTitle:@"美食" forState:UIControlStateNormal];
    FoodBtn.layer.borderColor = [UIColor colorWithRed:(200.0/255.0) green:(200.0/255.0) blue:(200.0/255.0) alpha:(255.0/255.0)].CGColor;
    FoodBtn.layer.borderWidth = 0.5;
    FoodBtn.backgroundColor = [UIColor whiteColor];
    [FoodBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.view addSubview:FoodBtn];
    
    
    UIButton* fcBtn = [[UIButton alloc] initWithFrame:CGRectMake(self.view.bounds.size.width/2, 200, self.view.bounds.size.width/2, (self.view.bounds.size.height-264)/3)];
    [fcBtn setTitle:@"房产" forState:UIControlStateNormal];
    fcBtn.layer.borderColor = [UIColor colorWithRed:(200.0/255.0) green:(200.0/255.0) blue:(200.0/255.0) alpha:(255.0/255.0)].CGColor;
    fcBtn.layer.borderWidth = 0.5;
    fcBtn.backgroundColor = [UIColor whiteColor];
    [fcBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.view addSubview:fcBtn];
    
    
    UIButton* jcBtn = [[UIButton alloc] initWithFrame:CGRectMake(0,FoodBtn.frame.origin.y+FoodBtn.frame.size.height, self.view.bounds.size.width/2, (self.view.bounds.size.height-264)/3)];
    [jcBtn setTitle:@"建材" forState:UIControlStateNormal];
    jcBtn.layer.borderColor = [UIColor colorWithRed:(200.0/255.0) green:(200.0/255.0) blue:(200.0/255.0) alpha:(255.0/255.0)].CGColor;
    jcBtn.layer.borderWidth = 0.5;
    jcBtn.backgroundColor = [UIColor whiteColor];
    [jcBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.view addSubview:jcBtn];
    
    
    UIButton* wyBtn = [[UIButton alloc] initWithFrame:CGRectMake(self.view.bounds.size.width/2, FoodBtn.frame.origin.y+FoodBtn.frame.size.height, self.view.bounds.size.width/2, (self.view.bounds.size.height-264)/3)];
    [wyBtn setTitle:@"物业" forState:UIControlStateNormal];
    wyBtn.layer.borderColor = [UIColor colorWithRed:(200.0/255.0) green:(200.0/255.0) blue:(200.0/255.0) alpha:(255.0/255.0)].CGColor;
    wyBtn.layer.borderWidth = 0.5;
    wyBtn.backgroundColor = [UIColor whiteColor];
    [wyBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.view addSubview:wyBtn];
    
    
    UIButton* xcBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, jcBtn.frame.origin.y+jcBtn.frame.size.height, self.view.bounds.size.width/2, (self.view.bounds.size.height-264)/3)];
    [xcBtn setTitle:@"洗车" forState:UIControlStateNormal];
    xcBtn.layer.borderColor = [UIColor colorWithRed:(200.0/255.0) green:(200.0/255.0) blue:(200.0/255.0) alpha:(255.0/255.0)].CGColor;
    xcBtn.layer.borderWidth = 0.5;
    xcBtn.backgroundColor = [UIColor whiteColor];
    [xcBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.view addSubview:xcBtn];
    
    
    UIButton* bgBtn = [[UIButton alloc] initWithFrame:CGRectMake(self.view.bounds.size.width/2, jcBtn.frame.origin.y+jcBtn.frame.size.height, self.view.bounds.size.width/2, (self.view.bounds.size.height-264)/3)];
    [bgBtn setTitle:@"宾馆" forState:UIControlStateNormal];
    bgBtn.layer.borderColor = [UIColor colorWithRed:(200.0/255.0) green:(200.0/255.0) blue:(200.0/255.0) alpha:(255.0/255.0)].CGColor;
    bgBtn.layer.borderWidth = 0.5;
    bgBtn.backgroundColor = [UIColor whiteColor];
    [bgBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.view addSubview:bgBtn];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}


- (void)foucusImageFrame:(SGFocusImageFrame *)imageFrame didSelectItem:(SGFocusImageItem *)item
{
    NSLog(@"%@ tapped", item.title);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
