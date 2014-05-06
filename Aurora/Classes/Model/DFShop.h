//
//  DFShop.h
//  Aurora
//
//  Created by David on 14-4-11.
//  Copyright (c) 2014年 david. All rights reserved.
//

#import <Foundation/Foundation.h>

#define kShopShopIdKey                  @"shopId"
#define kShopShopNameKey            @"shopName"
#define kShopTypeKey                @"shopType"
//#define kShopShopImageKey           @"shopImage"
#define kShopWorkTimeKey            @"workTime"
#define kShopAddressKey             @"address"
#define kShopAvgConsumeKey          @"avgConsume"
#define kShopHiDegreekey            @"hiDegree"
#define kShopDescKey                @"desc"

@interface DFShop : NSObject<NSCoding, NSCopying>

@property (nonatomic, copy) NSString * shopId;
@property (nonatomic, copy) NSString * shopName;
@property (nonatomic, copy) NSString * shopType;
//@property (nonatomic, copy) NSString * shopImage;
@property (nonatomic, copy) NSString * workTime;
@property (nonatomic, copy) NSString * address;
@property (nonatomic, copy) NSString * avgConsume;
@property (nonatomic, copy) NSString * desc;
@property int hiDegree;


@end
