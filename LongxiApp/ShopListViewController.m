//
//  ShopListViewController.m
//  LongxiApp
//
//  Created by Klar on 15/10/17.
//  Copyright © 2015年 truno. All rights reserved.
//

#import "ShopListViewController.h"
#import "AFNetworking.h"
#import "HYBLoopScrollView.h"

@interface ShopListViewController ()
{
    NSString* requestUrl;
}
@end

@implementation ShopListViewController

- (ShopListViewController*)initWithUrl:(NSString*)url{
    self = [super init];
    requestUrl = url;
    return self;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.title=@"美食探索";
    self.view.backgroundColor = [UIColor colorWithRed:(245.0/255.0) green:(245.0/255.0) blue:(245.0/255.0) alpha:(255.0/255.0)];
    
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:(70.0/255.0) green:(70.0/255.0) blue:(70.0/255.0) alpha:(255.0/255.0)];
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];
    self.navigationController.navigationBar.translucent = NO;
    
    UIButton *rightBtn =  [UIButton buttonWithType:UIButtonTypeCustom];
    rightBtn.frame = CGRectMake(0,0,24,20);
    [rightBtn setBackgroundImage:[UIImage imageNamed:@"私信.png"] forState:UIControlStateNormal];
    [rightBtn addTarget:self action:@selector(rightBtnClicked) forControlEvents:UIControlEventTouchUpInside];
    
    
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithCustomView:rightBtn];
    self.navigationItem.rightBarButtonItem = rightItem;
    // Do any additional setup after loading the view.
    
    //    NSString *url = @"http://test.meirongzongjian.com/imageServer/user/3/42ccb9c75ccf5e910cd6f5aaf0cd1200.jpg";
    NSArray *images = @[[UIImage imageNamed:@"app.png"],
                        [UIImage imageNamed:@"crawler_raw.jpg"],
                        [UIImage imageNamed:@"gqwm.jpg"],
                        [UIImage imageNamed:@"qgfx_raw.jpg"]
                        ];
    HYBLoopScrollView *loop = [HYBLoopScrollView loopScrollViewWithFrame:CGRectMake(0, 10, self.view.bounds.size.width, 190.0) imageUrls:images];
    loop.didSelectItemBlock = ^(NSInteger atIndex, HYBLoadImageView *sender) {
        NSLog(@"clicked item at index: %ld", atIndex);
    };
    loop.alignment = kPageControlAlignCenter;
    [self.view addSubview:loop];
    
    
//    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
//    [manager GET:@"http://localhost:3000/posts" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
//        NSLog(@"JSON: %@", responseObject);
//    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//        NSLog(@"Error: %@", error);
//    }];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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

-(void)rightBtnClicked{

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
