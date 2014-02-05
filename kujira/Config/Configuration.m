//
//  Configuration.m
//  inui
//
//  Created by SMARTTECNO. on 2014/01/03.
//  Copyright (c) 2014年 akafune. INC. All rights reserved.
//

#import "Configuration.h"

@implementation Configuration

#pragma mark - Synchronize
+ (void)synchronize
{
    [[NSUserDefaults standardUserDefaults] synchronize];
}

#pragma mark - Setting
static NSString *CONFIGURATION_FIRST_START = @"Configuration.FirstStart";
+ (BOOL)firstStart
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults registerDefaults:@{CONFIGURATION_FIRST_START : @(YES)}];
    return [userDefaults boolForKey:CONFIGURATION_FIRST_START];
}
+ (void)setFirstStart:(BOOL)value
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setBool:value forKey:CONFIGURATION_FIRST_START];
}

#pragma mark - StartoScreen
static NSString *CONFIGURATION_STARTSCREEN = @"Configuration.StartoScreen";
+ (NSInteger)startScreen;
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults registerDefaults:@{CONFIGURATION_STARTSCREEN : @(0)}];
    return [userDefaults integerForKey:CONFIGURATION_STARTSCREEN];
}
+ (void)setStartScreen:(NSInteger)value
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setInteger:value forKey:CONFIGURATION_STARTSCREEN];
}

#pragma mark - Topic_ID
static NSString *CONFIGURATION_TOPIC_ID = @"Configuration.Topic_ID";
+ (NSInteger)topic_ID;
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults registerDefaults:@{CONFIGURATION_TOPIC_ID : @(0)}];
    return [userDefaults integerForKey:CONFIGURATION_TOPIC_ID];
}
+ (void)setTopic_ID:(NSInteger)value
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setInteger:value forKey:CONFIGURATION_TOPIC_ID];
}

#pragma mark - PushNotifications
static NSString *CONFIGURATION_PUSH_NOTIFICATIONS = @"Configuration.PushNotifications";
+ (BOOL)pushNotifications
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults registerDefaults:@{CONFIGURATION_PUSH_NOTIFICATIONS : @(YES)}];
    return [userDefaults boolForKey:CONFIGURATION_PUSH_NOTIFICATIONS];
}
+ (void)setPushNotifications:(BOOL)value
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setBool:value forKey:CONFIGURATION_PUSH_NOTIFICATIONS];
}

#pragma mark - WebURL
static NSString *CONFIGURATION_PUSH_WEBURL = @"Configuration.WebURL";
+ (NSString*)webURL
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults registerDefaults:@{CONFIGURATION_PUSH_WEBURL : @("")}];
    return [userDefaults stringForKey:CONFIGURATION_PUSH_WEBURL];
}
+ (void)setWebURL:(NSString*)value
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:value forKey:CONFIGURATION_PUSH_WEBURL];
}

@end
