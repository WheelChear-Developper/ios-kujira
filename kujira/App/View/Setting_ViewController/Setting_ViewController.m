//
//  Setting_ViewController.m
//  inui
//
//  Created by SMARTTECNO. on 2014/01/13.
//  Copyright (c) 2014年 akafune, Inc. All rights reserved.
//

#import "Setting_ViewController.h"

@interface Setting_ViewController ()
{
    // Social
    IBOutlet UIButton *LineButton;
    IBOutlet UIButton *FacebookButton;
    IBOutlet UIButton *TwitterButton;
}
@end

@implementation Setting_ViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // =========== iOSバージョンで、処理を分岐 ============
    // iOS Version
    NSString *iosVersion = [[[UIDevice currentDevice] systemVersion] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    if ([iosVersion floatValue] < 6.0) { // iOSのバージョンが6.0以上でないときは、ボタンを隠す
        // Twitter,Facebook連携はiOS6.0以降
        FacebookButton.hidden = YES;
        TwitterButton.hidden = YES;
    }
    // ===============================================
    
    // iOS6/7でのレイアウト互換設定
    if (floor(NSFoundationVersionNumber) > NSFoundationVersionNumber_iOS_6_1){
        self.edgesForExtendedLayout = UIRectEdgeNone;
        self.extendedLayoutIncludesOpaqueBars = NO;
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    
    //BackColor
    self.view.backgroundColor = [SetColor setBackGroundColor];
}

//設定画面の再設定
-(void)viewWillAppear:(BOOL)animated
{
    if([Configuration pushNotifications] == NO){
        [Sw_PushNotificationSet setOn:NO animated:NO];
    }else{
        [Sw_PushNotificationSet setOn:YES animated:NO];
    }
}

- (IBAction)Sw_PushNotificationSet:(id)sender
{
    if([Configuration pushNotifications] == NO){
        [Configuration setPushNotifications:YES];
        [Sw_PushNotificationSet setOn:YES animated:YES];
    }else{
        [Configuration setPushNotifications:NO];
        [Sw_PushNotificationSet setOn:NO animated:YES];
    }
}

// LINE
- (IBAction)postLine:(id)sender
{
    NSString *textString = NSLocalizedString(@"Twite_msg",@"");
    textString = [textString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSString *LINEUrlString = [NSString stringWithFormat:@"line://msg/text/%@",textString];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:LINEUrlString]];
}
// Facebook
- (IBAction)postFacebook:(id)sender
{
    SLComposeViewController *facebookPostVC = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
    NSString* postContent = [NSString stringWithFormat:NSLocalizedString(@"Twite_msg",@"")];
    [facebookPostVC setInitialText:postContent];
    [self presentViewController:facebookPostVC animated:YES completion:nil];
}
// Twitter
- (IBAction)postTwitter:(id)sender
{
    SLComposeViewController *twitterPostVC = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeTwitter];
    [twitterPostVC setInitialText:NSLocalizedString(@"Twite_msg",@"")];
    [self presentViewController:twitterPostVC animated:YES completion:nil];
}

@end
