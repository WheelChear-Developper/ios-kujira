//
//  Shop_ViewController.h
//  inui
//
//  Created by SMARTTECNO. on 2014/01/15.
//  Copyright (c) 2014年 akafune. INC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SASlideMenuViewController.h"
#import <MapKit/MapKit.h>

@interface Shop_ViewController : UITableViewController <UIWebViewDelegate>
{
    __weak IBOutlet UIButton *btn_tel;
}

@property (nonatomic,strong) SASlideMenuViewController* menuController;
- (IBAction)btn_tel:(id)sender;
@property (weak, nonatomic) IBOutlet MKMapView *map_view;
- (IBAction)btn_set1:(id)sender;
- (IBAction)btn_set2:(id)sender;
- (IBAction)btn_set3:(id)sender;
- (IBAction)btn_set4:(id)sender;
- (IBAction)btn_set5:(id)sender;
- (IBAction)btn_set6:(id)sender;
- (IBAction)btn_set7:(id)sender;
- (IBAction)btn_set8:(id)sender;
- (IBAction)btn_set9:(id)sender;
- (IBAction)btn_set10:(id)sender;

@end
