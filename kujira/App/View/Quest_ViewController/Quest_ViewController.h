//
//  Quest_ViewController.h
//  inui
//
//  Created by SMARTTECNO. on 2014/01/25.
//  Copyright (c) 2014年 akafune, inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>
#import <MessageUI/MFMailComposeViewController.h>
#include <sys/utsname.h>

@interface Quest_ViewController : UITableViewController <MFMailComposeViewControllerDelegate>
{
    IBOutlet UITextField *txt_word;

    IBOutlet UILabel *lbl_device;
    IBOutlet UILabel *lbl_OS;
    IBOutlet UILabel *lbl_name;
    IBOutlet UILabel *lbl_ver;
}
@end
