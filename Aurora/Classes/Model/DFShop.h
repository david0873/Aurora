//
//  DFShop.h
//  Aurora
//
//  Created by David on 14-4-11.
//  Copyright (c) 2014年 david. All rights reserved.
//

#import <Foundation/Foundation.h>

#define kShopShopIdKey              @"_id"
#define kShopShopNameKey            @"name"
#define kShopTypeKey                @"shop_type"
#define kShopShopImageKey           @"ShopImage"
#define kShopWorkTimeKey            @"work_start_time"
#define kShopAddressKey             @"address"
#define kShopAvgConsumeKey          @"avg_consume"
#define kShopHiDegreekey            @"hi_degree"
#define kShopDescKey                @"Desc"

@interface DFShop : NSObject<NSCoding, NSCopying>

@property (nonatomic, copy) NSString * shopId;
@property (nonatomic, copy) NSString * shopName;
@property (nonatomic, copy) NSString * shopType;
@property (nonatomic, copy) NSString * shopImage;
@property (nonatomic, copy) NSString * workTime;
@property (nonatomic, copy) NSString * address;
@property (nonatomic, copy) NSString * avgConsume;
@property (nonatomic, copy) NSString * desc;
@property int hiDegree;

- (instancetype)initWithAttributes:(NSDictionary *)attributes;


@end
