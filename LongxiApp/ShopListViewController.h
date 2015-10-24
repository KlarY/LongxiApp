//
//  ShopListViewController.h
//  LongxiApp
//
//  Created by Klar on 15/10/17.
//  Copyright © 2015年 truno. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SGFocusImageFrame.h"
#import "SGFocusImageItem.h"

@interface ShopListViewController : UIViewController <SGFocusImageFrameDelegate>


-(ShopListViewController*)initWithUrl:(NSString*)url;
@end
