//
//  DFShop.h
//  Aurora
//
//  Created by David on 14-4-11.
//  Copyright (c) 2014年 david. All rights reserved.
//

#import <Foundation/Foundation.h>

#define kShopShopIdKey                  @"ShopId"
#define kShopShopNameKey            @"ShopName"
#define kShopTypeKey                @"ShopType"
//#define kShopShopImageKey           @"ShopImage"
#define kShopWorkTimeKey            @"WorkTime"
#define kShopAddressKey             @"Address"
#define kShopAvgConsumeKey          @"AvgConsume"
#define kShopHiDegreekey            @"HiDegree"
#define kShopDescKey                @"Desc"

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
