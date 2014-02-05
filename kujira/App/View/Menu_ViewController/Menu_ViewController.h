//
//  Menu_ViewController.h
//  inui
//
//  Created by SMARTTECNO. on 2014/02/01.
//  Copyright (c) 2014年 akafune, inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SASlideMenuViewController.h"

@interface Menu_ViewController : UIViewController <UIScrollViewDelegate>
{
    // ウェーブ用インスタンス
    IBOutlet UIWebView *Web_View;
}
@property (nonatomic,strong) SASlideMenuViewController* menuController;
@end
