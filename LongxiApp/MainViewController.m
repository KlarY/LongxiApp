//
//  MainViewController.m
//  LongxiApp
//
//  Created by Klar on 15/10/14.
//  Copyright © 2015年 truno. All rights reserved.
//

#import "MainViewController.h"
#import "ShopListViewController.h"
#import "HYBLoopScrollView.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"首页";
    self.view.backgroundColor = [UIColor colorWithRed:(245.0/255.0) green:(245.0/255.0) blue:(245.0/255.0) alpha:(255.0/255.0)];
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:(70.0/255.0) green:(70.0/255.0) blue:(70.0/255.0) alpha:(255.0/255.0)];
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];
    self.navigationController.navigationBar.translucent = NO;
    
    
    UIButton *leftBtn =  [UIButton buttonWithType:UIButtonTypeCustom];
    leftBtn.frame = CGRectMake(0,0,20,20);
    [leftBtn setBackgroundImage:[UIImage imageNamed:@"个人信息.png"] forState:UIControlStateNormal];
    [leftBtn addTarget:self action:@selector(leftBtnClicked) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *rightBtn =  [UIButton buttonWithType:UIButtonTypeCustom];
    rightBtn.frame = CGRectMake(0,0,24,20);
    [rightBtn setBackgroundImage:[UIImage imageNamed:@"私信.png"] forState:UIControlStateNormal];
    [rightBtn addTarget:self action:@selector(rightBtnClicked) forControlEvents:UIControlEventTouchUpInside];
    
    
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithCustomView:leftBtn];
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithCustomView:rightBtn];
    self.navigationItem.rightBarButtonItem = rightItem;
    self.navigationItem.leftBarButtonItem = leftItem;
    
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
    
    
    UIButton* FoodBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 200, self.view.bounds.size.width/2, (self.view.bounds.size.height-264)/3)];
    [FoodBtn addTarget:self action:@selector(foodBtnClicked) forControlEvents:UIControlEventTouchUpInside];
    FoodBtn.backgroundColor = [UIColor whiteColor];
    [FoodBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    
    
    CGRect imageRect = CGRectMake((FoodBtn.frame.size.width-55)/2, (FoodBtn.frame.size.height-75)/2, 55, 55);
    CGRect labelRect = CGRectMake((FoodBtn.frame.size.width-75)/2, (FoodBtn.frame.size.height-75)/2+60, 75, 20);
    
    UIImageView *foodImageView = [[UIImageView alloc] initWithFrame:imageRect];
    foodImageView.image = [UIImage imageNamed:@"美食"];
    foodImageView.contentMode = UIViewContentModeScaleAspectFit;
    [FoodBtn addSubview:foodImageView];
    UILabel *foodLabel = [[UILabel alloc] initWithFrame:labelRect];
    foodLabel.text = @"美食探索";
    [foodLabel setTextAlignment:NSTextAlignmentCenter];
    [FoodBtn addSubview:foodLabel];
    
    [self.view addSubview:FoodBtn];
    
    
    UIButton* fcBtn = [[UIButton alloc] initWithFrame:CGRectMake(self.view.bounds.size.width/2, 200, self.view.bounds.size.width/2, (self.view.bounds.size.height-264)/3)];
    [fcBtn addTarget:self action:@selector(fcBtnClicked) forControlEvents:UIControlEventTouchUpInside];
    fcBtn.backgroundColor = [UIColor whiteColor];
    [fcBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    UIImageView *fcImageView = [[UIImageView alloc] initWithFrame:imageRect];
    fcImageView.image = [UIImage imageNamed:@"房产"];
    fcImageView.contentMode = UIViewContentModeScaleAspectFit;
    [fcBtn addSubview:fcImageView];
    UILabel *fcLabel = [[UILabel alloc] initWithFrame:labelRect];
    fcLabel.text = @"房产信息";
    [fcLabel setTextAlignment:NSTextAlignmentCenter];
    [fcBtn addSubview:fcLabel];
    
    [self.view addSubview:fcBtn];
    
    
    UIButton* jcBtn = [[UIButton alloc] initWithFrame:CGRectMake(0,FoodBtn.frame.origin.y+FoodBtn.frame.size.height, self.view.bounds.size.width/2, (self.view.bounds.size.height-264)/3)];
    [jcBtn addTarget:self action:@selector(jcBtnClicked) forControlEvents:UIControlEventTouchUpInside];
    jcBtn.backgroundColor = [UIColor whiteColor];
    [jcBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    UIImageView *jcImageView = [[UIImageView alloc] initWithFrame:imageRect];
    jcImageView.image = [UIImage imageNamed:@"建材"];
    jcImageView.contentMode = UIViewContentModeScaleAspectFit;
    [jcBtn addSubview:jcImageView];
    UILabel *jcLabel = [[UILabel alloc] initWithFrame:labelRect];
    jcLabel.text = @"建材市场";
    [jcLabel setTextAlignment:NSTextAlignmentCenter];
    [jcBtn addSubview:jcLabel];
    
    [self.view addSubview:jcBtn];
    
    
    UIButton* wyBtn = [[UIButton alloc] initWithFrame:CGRectMake(self.view.bounds.size.width/2, FoodBtn.frame.origin.y+FoodBtn.frame.size.height, self.view.bounds.size.width/2, (self.view.bounds.size.height-264)/3)];
    [wyBtn addTarget:self action:@selector(wyBtnClicked) forControlEvents:UIControlEventTouchUpInside];
    wyBtn.backgroundColor = [UIColor whiteColor];
    [wyBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    UIImageView *wyImageView = [[UIImageView alloc] initWithFrame:imageRect];
    wyImageView.image = [UIImage imageNamed:@"缴费"];
    wyImageView.contentMode = UIViewContentModeScaleAspectFit;
    [wyBtn addSubview:wyImageView];
    UILabel *wyLabel = [[UILabel alloc] initWithFrame:labelRect];
    wyLabel.text = @"生活缴费";
    [wyLabel setTextAlignment:NSTextAlignmentCenter];
    [wyBtn addSubview:wyLabel];
    
    [self.view addSubview:wyBtn];
    
    
    UIButton* xcBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, jcBtn.frame.origin.y+jcBtn.frame.size.height, self.view.bounds.size.width/2, (self.view.bounds.size.height-264)/3)];
    [xcBtn addTarget:self action:@selector(xcBtnClicked) forControlEvents:UIControlEventTouchUpInside];
    xcBtn.backgroundColor = [UIColor whiteColor];
    [xcBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    UIImageView *xcImageView = [[UIImageView alloc] initWithFrame:imageRect];
    xcImageView.image = [UIImage imageNamed:@"洗车"];
    xcImageView.contentMode = UIViewContentModeScaleAspectFit;
    [xcBtn addSubview:xcImageView];
    UILabel *xcLabel = [[UILabel alloc] initWithFrame:labelRect];
    xcLabel.text = @"洗车预约";
    [xcLabel setTextAlignment:NSTextAlignmentCenter];
    [xcBtn addSubview:xcLabel];
    
    [self.view addSubview:xcBtn];
    
    
    UIButton* bgBtn = [[UIButton alloc] initWithFrame:CGRectMake(self.view.bounds.size.width/2, jcBtn.frame.origin.y+jcBtn.frame.size.height, self.view.bounds.size.width/2, (self.view.bounds.size.height-264)/3)];
    [bgBtn addTarget:self action:@selector(bgBtnClicked) forControlEvents:UIControlEventTouchUpInside];
    bgBtn.backgroundColor = [UIColor whiteColor];
    [bgBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    UIImageView *bgImageView = [[UIImageView alloc] initWithFrame:imageRect];
    bgImageView.image = [UIImage imageNamed:@"宾馆"];
    bgImageView.contentMode = UIViewContentModeScaleAspectFit;
    [bgBtn addSubview:bgImageView];
    UILabel *bgLabel = [[UILabel alloc] initWithFrame:labelRect];
    bgLabel.text = @"广丰宾馆";
    [bgLabel setTextAlignment:NSTextAlignmentCenter];
    [bgBtn addSubview:bgLabel];
    
    [self.view addSubview:bgBtn];
    
    
    UIColor* sepColor = [UIColor colorWithRed:(230.0/255.0) green:(230.0/255.0) blue:(230.0/255.0) alpha:(255.0/255.0)];
    
    UIView *sep0 = [[UIView alloc] initWithFrame:CGRectMake(0,FoodBtn.frame.origin.y, self.view.bounds.size.width, 1)];
    sep0.backgroundColor = sepColor;
    [self.view addSubview:sep0];
    
    UIView *sep1 = [[UIView alloc] initWithFrame:CGRectMake(0,FoodBtn.frame.origin.y+FoodBtn.frame.size.height, self.view.bounds.size.width, 1)];
    sep1.backgroundColor = sepColor;
    [self.view addSubview:sep1];
    
    UIView *sep2 = [[UIView alloc] initWithFrame:CGRectMake(0,jcBtn.frame.origin.y+jcBtn.frame.size.height, self.view.bounds.size.width, 1)];
    sep2.backgroundColor = sepColor;
    [self.view addSubview:sep2];
    
    UIView *sep3 = [[UIView alloc] initWithFrame:CGRectMake(self.view.bounds.size.width/2,FoodBtn.frame.origin.y, 1, (self.view.bounds.size.height-264) )];
    sep3.backgroundColor = sepColor;
    [self.view addSubview:sep3];
    
    
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
-(void)foodBtnClicked{
    ShopListViewController* vc = [[ShopListViewController alloc] initWithUrl:@"test"];
    [self.navigationController pushViewController:vc animated:YES];
}

-(void)fcBtnClicked{

}

-(void)jcBtnClicked{

}

-(void)wyBtnClicked{

}

-(void)xcBtnClicked{

}

-(void)bgBtnClicked{

}

-(void)leftBtnClicked{

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
