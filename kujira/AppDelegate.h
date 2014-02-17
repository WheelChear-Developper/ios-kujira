//
//  AppDelegate.h
//  Kujira
//
//  Created by SMARTTECNO. on 2014/02/05.
//  Copyright (c) 2014年 akafune, inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>
{
    // ナビゲーションコントローラー制御用
    UINavigationController *naviController;
    UIAlertView *errAlert_exit;
    
    NSURLConnection *connection1;
    NSURLConnection *connection2;
}
@property (strong, nonatomic) UIWindow *window;
@property (nonatomic,retain)NSMutableData *mData;
@end