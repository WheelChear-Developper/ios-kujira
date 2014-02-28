//
//  ExampleDynamicMenuViewController.h
//  Kujira
//
//  Created by SMARTTECNO. on 2014/01/28.
//  Copyright (c) 2014年 akafune, inc. All rights reserved.
//

#import "SASlideMenuViewController.h"
#import "SASlideMenuDataSource.h"
#import "SASlideMenuDelegate.h"

@interface ExampleDynamicMenuViewController :SASlideMenuViewController
{
//    UIAlertView *errAlert_exit;
}
-(void) tap:(id) sender;
@property (nonatomic,retain)NSMutableData *mData;
@end
