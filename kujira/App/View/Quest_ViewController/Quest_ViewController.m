//
//  Quest_ViewController.m
//  inui
//
//  Created by SMARTTECNO. on 2014/01/25.
//  Copyright (c) 2014年 akafune, inc. All rights reserved.
//

#import "Quest_ViewController.h"

@interface Quest_ViewController ()
@end

@implementation Quest_ViewController

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
    
    // iOS6/7でのレイアウト互換設定
    if (floor(NSFoundationVersionNumber) > NSFoundationVersionNumber_iOS_6_1){
        self.edgesForExtendedLayout = UIRectEdgeNone;
        self.extendedLayoutIncludesOpaqueBars = NO;
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    
    //BackColor
    self.tableView.backgroundColor = [SetColor setBackGroundColor];

    // 戻るボタン設定
    UIButton *Left_Button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 50, 44)];
    [Left_Button.titleLabel setFont:[UIFont boldSystemFontOfSize:18]];
    [Left_Button setTitle:NSLocalizedString(@"Button_Back",@"") forState:UIControlStateNormal];
    [Left_Button setTitleColor:[SetColor setButtonCharColor] forState:UIControlStateNormal];
    [Left_Button addTarget:self action:@selector(btn_Return:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem* Left_buttonItem = [[UIBarButtonItem alloc] initWithCustomView:Left_Button];
    self.navigationItem.leftBarButtonItem = Left_buttonItem;
    // メールボタン設定
    UIButton *Right_Button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 50, 44)];
    [Right_Button.titleLabel setFont:[UIFont boldSystemFontOfSize:18]];
    [Right_Button setTitle:NSLocalizedString(@"Button_Post",@"") forState:UIControlStateNormal];
    [Right_Button setTitleColor:[SetColor setButtonCharColor] forState:UIControlStateNormal];
    [Right_Button addTarget:self action:@selector(btn_Mail:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem* Right_buttonItem = [[UIBarButtonItem alloc] initWithCustomView:Right_Button];
    self.navigationItem.rightBarButtonItem = Right_buttonItem;
    
    // 背景をキリックしたら、キーボードを隠す
    UITapGestureRecognizer *gestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(closeSoftKeyboard)];
    [self.view addGestureRecognizer:gestureRecognizer];
    
    //Device
    struct utsname u;
    uname(&u);
    lbl_device.text = [NSString stringWithUTF8String:u.machine];
    //iOS
    UIDevice *dev = [UIDevice currentDevice];
    lbl_OS.text = dev.systemVersion;
    //AppName
    lbl_name.text = [[[NSBundle mainBundle] localizedInfoDictionary] objectForKey:@"CFBundleDisplayName"];
    //AppVersion
    lbl_ver.text = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)dealloc {
    lbl_device = nil;
    lbl_OS = nil;
    lbl_name = nil;
    lbl_ver = nil;
    txt_word = nil;
}

//設定画面の再設定
-(void)viewWillAppear:(BOOL)animated
{
    //ナビゲーションのバック画像設定
    // iOS6/7でのレイアウト互換設定
    if (floor(NSFoundationVersionNumber) > NSFoundationVersionNumber_iOS_6_1)
    {
        // iOS7移行の設定
        //ナビゲーションのバック画像設定
        UIImage *image = [UIImage imageNamed:@"navibar_320x44.png"];
        [[UINavigationBar appearance] setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
        
    }else{
        // iOS7以下の設定
        //ナビゲーションのバック画像設定
        UIImage *image = [UIImage imageNamed:@"navibar_320x44.png"];
        [[UINavigationBar appearance] setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
    }
}

- (void)viewDidUnload
{

    [super viewDidUnload];
}

// キーボードを隠す処理
- (void)closeSoftKeyboard
{
    [self.view endEditing: YES];
}

- (void)btn_Return:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)btn_Mail:(id)sender
{
    //キーボードを隠す
    [txt_word resignFirstResponder];
    Class mail = (NSClassFromString(@"MFMailComposeViewController"));
	if (mail != nil){
		//メールの設定がされているかどうかチェック
		if ([mail canSendMail]){
            //ナビゲーションのバック画像設定
            UIImage *image = [UIImage imageNamed:@""];
            [[UINavigationBar appearance] setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
            
			[self showComposerSheet];
		} else {
			[self setAlert:@"メールが起動出来ません！":@"メールの設定をしてからこの機能は使用下さい。"];
		}
	}
}

#pragma mark アラート表示
-(void) setAlert:(NSString *) aTitle :(NSString *) aDescription
{
	UIAlertView *alert = [[UIAlertView alloc] initWithTitle:aTitle message:aDescription delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
	[alert show];
}

-(void) showComposerSheet
{
	MFMailComposeViewController *mailController = [[MFMailComposeViewController alloc] init];
	mailController.mailComposeDelegate = self;
	
    NSArray *toRecipients = [NSArray arrayWithObject:NSLocalizedString(@"Quest_MailAdress",@"")];
    [mailController setToRecipients:toRecipients];
    
	[mailController setSubject:[NSString stringWithFormat:NSLocalizedString(@"お問い合わせ",@"")]];
	
    struct utsname u;
    uname(&u);
    // UIDeviceクラスのインスタンスを取得する
    UIDevice *dev = [UIDevice currentDevice];
    
    NSString* str_text = txt_word.text;
    if(str_text == nil){
        str_text = @"";
    }
    
	//メールの本文を設定
	NSString *emailBody = [NSString stringWithFormat:@"%@\n\nＤｅｖｉｃｅ　　　　　：%@\nｉＯＳ　　　　　　　　：%@\nＡｐｐＮａｍｅ　　　　：%@\nＡｐｐＶｅｒｓｉｏｎ　：%@",
                           str_text,
                           [NSString stringWithUTF8String:u.machine],
                           dev.systemVersion,
                           [[[NSBundle mainBundle] localizedInfoDictionary] objectForKey:@"CFBundleDisplayName"],
                           [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"]];
	[mailController setMessageBody:emailBody isHTML:NO];
	
    [self presentViewController:mailController animated:YES completion:nil];
}

- (void)mailComposeController:(MFMailComposeViewController*)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError*)error
{
	switch (result){
		case MFMailComposeResultCancelled:
			//キャンセルした場合
			break;
		case MFMailComposeResultSaved:
			//保存した場合
			break;
		case MFMailComposeResultSent:
			//送信した場合
			break;
		case MFMailComposeResultFailed:
			[self setAlert:@"メール送信失敗！":@"メールの送信に失敗しました。ネットワークの設定などを確認して下さい"];
			break;
		default:
			break;
	}
	[self dismissViewControllerAnimated:YES completion:nil];
}

@end
