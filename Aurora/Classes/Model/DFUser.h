//
//  DFUser.h
//  Aurora
//
//  Created by David on 14-4-8.
//  Copyright (c) 2014年 david. All rights reserved.
//

#import <Foundation/Foundation.h>

#define kUserUserNameKey        @"UserName"
#define kUserNibNameKey         @"NibName"
#define kUserPasswordKey        @"Password"

@interface DFUser : NSObject<NSCopying, NSCoding>

@property (nonatomic, copy) NSString * userName;
@property (nonatomic, copy) NSString * nibName;
@property (nonatomic, copy) NSString * password;

@end
