//
//  Comments_ListDataModel.h
//  kujira
//
//  Created by SMARTTECNO. on 2014/02/17.
//  Copyright (c) 2014年 akafune, inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Comments_ListDataModel : NSObject

@property(nonatomic) long comments_id;
@property(nonatomic) long comments_time;
@property(nonatomic) long comments_newsId;
@property(nonatomic) long comments_iosUserId;
@property(nonatomic, copy) NSString *comments_retime;
@property(nonatomic, copy) NSString *comments_name;
@property(nonatomic, copy) NSString *comments_body;
@end
