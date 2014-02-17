//
//  Setting_ViewController.h
//  inui
//
//  Created by SMARTTECNO. on 2014/01/13.
//  Copyright (c) 2014年 akafune, Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SASlideMenuViewController.h"
#import <Social/Social.h>
#import <Twitter/Twitter.h>

@interface Setting_ViewController : UITableViewController
{
    IBOutlet UISwitch *Sw_PushNotificationSet;
    __weak IBOutlet UILabel *lbl_userID;
    __weak IBOutlet UITextField *txt_userName;
}
@property (nonatomic,strong) SASlideMenuViewController* menuController;
- (IBAction)Sw_PushNotificationSet:(id)sender;
@property (nonatomic,retain)NSMutableData *mData;
@end
