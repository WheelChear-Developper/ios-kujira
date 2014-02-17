//
//  ExampleDynamicMenuViewController.m
//  inui
//
//  Created by SMARTTECNO. on 2014/01/28.
//  Copyright (c) 2014年 akafune, inc. All rights reserved.
//

#import "ExampleDynamicMenuViewController.h"
#import "News_ViewController.h"
#import "Menu_ViewController.h"
#import "Shop_ViewController.h"
#import "Setting_ViewController.h"

@interface ExampleDynamicMenuViewController ()<SASlideMenuDataSource,SASlideMenuDelegate, UITableViewDataSource>
@property (nonatomic) CGFloat selectedHue;
@property (nonatomic) CGFloat selectedBrightness;
@end

@implementation ExampleDynamicMenuViewController

@synthesize selectedHue;
@synthesize selectedBrightness;

-(id) initWithCoder:(NSCoder *)aDecoder{
    if (self = [super initWithCoder:aDecoder])
    {
        self.selectedBrightness = 0.3;
        self.selectedHue = 0.0;
    }
    return self;
}

-(void)tap:(id)sender{
    
}

-(void) viewDidLoad
{
    [super viewDidLoad];
    
    // 初期起動フラグ設定
    [Configuration setFirstStart:NO];
    
    // iOS6/7でのレイアウト互換設定
    if (floor(NSFoundationVersionNumber) > NSFoundationVersionNumber_iOS_6_1){
        self.edgesForExtendedLayout = UIRectEdgeNone;
        self.extendedLayoutIncludesOpaqueBars = NO;
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    //BackColor
    self.tableView.backgroundColor = [SetColor setMenuBackGroundColor];
}
-(BOOL) shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation{
    return YES;
}

#pragma mark -
#pragma mark SASlideMenuDataSource

-(void) prepareForSwitchToContentViewController:(UINavigationController *)content
{
    UIViewController* controller = [content.viewControllers objectAtIndex:0];
    if ([controller isKindOfClass:[News_ViewController class]]) {
        News_ViewController* news_ViewController = (News_ViewController*) controller;
        news_ViewController.menuController = self;
    }else if ([controller isKindOfClass:[Menu_ViewController class]]) {
        Menu_ViewController* menu_ViewController = (Menu_ViewController*) controller;
        menu_ViewController.menuController = self;
    }else if ([controller isKindOfClass:[Shop_ViewController class]]) {
        Shop_ViewController* shop_ViewController = (Shop_ViewController*) controller;
        shop_ViewController.menuController = self;
    }else if ([controller isKindOfClass:[Setting_ViewController class]]) {
        Setting_ViewController* setting_ViewController = (Setting_ViewController*) controller;
        setting_ViewController.menuController = self;
    }
}

// It configure the menu button. The beahviour of the button should not be modified
-(void) configureMenuButton:(UIButton *)menuButton
{
    menuButton.frame = CGRectMake(0, 0, 40, 29);
    [menuButton setImage:[UIImage imageNamed:@"menuicon.png"] forState:UIControlStateNormal];
}

// This is the segue you want visibile when the controller is loaded the first time
-(NSIndexPath*) selectedIndexPath
{
    return [NSIndexPath indexPathForRow:0 inSection:0];
}

// It maps each indexPath to the segueId to be used. The segue is performed only the first time the controller needs to loaded, subsequent switch to the content controller will use the already loaded controller

-(NSString*) segueIdForIndexPath:(NSIndexPath *)indexPath
{
    NSString* result;
    switch (indexPath.section) {
        case 0:
            result = @"news";
            break;
        case 1:
            result = @"menu";
            [Configuration setWebURL:NSLocalizedString(@"Service_MenuUrl",@"")];
            break;
        case 2:
            result = @"shop";
            break;
        case 3:
            result = @"setting";
            break;
        default:
            result = @"";
            break;
    }
    return result;
}

-(Boolean) disableContentViewControllerCachingForIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

-(Boolean) hasRightMenuForIndexPath:(NSIndexPath *)indexPath
{
    // 右メニュー使用設定（する場合、ストーリーボードに設定しないとエラーになります。）
    return NO;
}

#pragma mark -
#pragma mark UITableViewDelegate
-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat brightness = 1-((double) indexPath.row)/5;
    NSInteger section = indexPath.section;
    CGFloat hue=0;
    if (section == 0) {
        hue = 0.0;
    }else if (section==1){
        hue = 0.33;
    }else if (section==2){
        hue = 0.66;
    }
    self.selectedHue = hue;
    self.selectedBrightness = brightness;
    [super tableView:tableView didSelectRowAtIndexPath:indexPath];
}
#pragma mark -
#pragma mark SASlideMenuDelegate

-(void) slideMenuWillSlideIn:(UINavigationController *)selectedContent
{
    NSLog(@"slideMenuWillSlideIn");
}
-(void) slideMenuDidSlideIn:(UINavigationController *)selectedContent
{
    NSLog(@"slideMenuDidSlideIn");
}
-(void) slideMenuWillSlideToSide:(UINavigationController *)selectedContent
{
    NSLog(@"slideMenuWillSlideToSide");
}
-(void) slideMenuDidSlideToSide:(UINavigationController *)selectedContent
{
    NSLog(@"slideMenuDidSlideToSide");
}
-(void) slideMenuWillSlideOut:(UINavigationController *)selectedContent
{
    NSLog(@"slideMenuWillSlideOut");
}
-(void) slideMenuDidSlideOut:(UINavigationController *)selectedContent
{
    NSLog(@"slideMenuDidSlideOut");
}
-(void) slideMenuWillSlideToLeft:(UINavigationController *)selectedContent
{
    NSLog(@"slideMenuWillSlideToLeft");
}
-(void) slideMenuDidSlideToLeft:(UINavigationController *)selectedContent
{
    NSLog(@"slideMenuDidSlideToLeft");
}

@end