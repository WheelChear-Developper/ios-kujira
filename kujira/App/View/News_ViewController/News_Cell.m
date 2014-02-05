//
//  CustomCell.m
//  inui
//
//  Created by SMARTTECNO. on 2014/02/04.
//  Copyright (c) 2014年 akafune, inc. All rights reserved.
//

#import "News_Cell.h"
#import "UILabel+EstimatedHeight.h"

@implementation News_Cell
{
    VerticallyAlignedLabel *Comment;
    AsyncImageView *ai;
}

@synthesize str_comment, str_imageurl;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    
    // ラベルの高さ取得
    CGFloat flt_height = [UILabel xx_estimatedHeight:[UIFont fontWithName:@"HiraKakuProN-W3" size:13]
                                                text:self.str_comment size:CGSizeMake(255, MAXFLOAT)];
    flt_height += 15 * 2;
    
    // コメント（１９文字X６行）
    if(self.str_comment.length >0){
        [Comment removeFromSuperview];
        Comment = [[VerticallyAlignedLabel alloc] init];
        Comment.frame = CGRectMake(35, 55  , 255, flt_height);
        Comment.verticalAlignment = VerticalAlignmentTop;
        Comment.numberOfLines = 6;
        [Comment setFont:[UIFont fontWithName:@"HiraKakuProN-W3" size:13]];
        Comment.textColor = [UIColor darkGrayColor];
        Comment.text = self.str_comment;
        [self addSubview:Comment];
    }
    
    //画像の非同期セット
    [ai removeFromSuperview];
    if([str_imageurl isEqual:@"<null>"]){
    }else if([str_imageurl isEqual:[NSNull null]]){
    }else{
        ai = [[AsyncImageView alloc] initWithFrame:CGRectMake(30, 55 + flt_height, 260, 200)];
        [ai loadImage:str_imageurl];
        [self addSubview:ai];
    }
}

@end
