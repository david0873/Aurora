//
//  DFComment.h
//  Aurora
//
//  Created by yubiao on 14-5-9.
//  Copyright (c) 2014年 david. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DFUser.h"

#define kCommentCommentIdKey        @"CommentId"
#define kCommentUserKey             @"User"
#define kCommentShopIdKey           @"ShopId"
#define kCommentHiDegreeKey         @"HiDegree"
#define kCommentContentKey          @"Content"

@interface DFComment : NSObject<NSCopying, NSCoding>

@property (nonatomic, copy) NSString * commentId;
@property (nonatomic, retain) DFUser * user;
@property (nonatomic, copy) NSString * shopId;
@property int hiDegree;
@property (nonatomic, copy) NSString * content;

@end
