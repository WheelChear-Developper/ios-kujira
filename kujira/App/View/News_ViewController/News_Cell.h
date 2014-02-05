//
//  CustomCell.h
//  inui
//
//  Created by SMARTTECNO. on 2014/02/04.
//  Copyright (c) 2014年 akafune, inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VerticallyAlignedLabel.h"
#import "AsyncImageView.h"

@interface News_Cell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *lbl_hyoudai;
@property (weak, nonatomic) IBOutlet UILabel *lbl_date;
@property (weak, nonatomic) NSString *str_comment;
@property (weak, nonatomic) NSString *str_imageurl;
@end