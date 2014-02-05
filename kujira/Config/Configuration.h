//
//  Configuration.h
//  inui
//
//  Created by SMARTTECNO. on 2014/01/03.
//  Copyright (c) 2014年 akafune. INC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Configuration : NSObject

#pragma mark - Synchronize
+ (void)synchronize;

#pragma mark - FIRST_START
+ (BOOL)firstStart;
+ (void)setFirstStart:(BOOL)value;

#pragma mark - StartoScreen
+ (NSInteger)startScreen;
+ (void)setStartScreen:(NSInteger)value;

#pragma mark - Topic_ID
+ (NSInteger)topic_ID;
+ (void)setTopic_ID:(NSInteger)value;

#pragma mark - PushNotifications
+ (BOOL)pushNotifications;
+ (void)setPushNotifications:(BOOL)value;

#pragma mark - WebURL
+ (NSString*)webURL;
+ (void)setWebURL:(NSString*)value;

@end
