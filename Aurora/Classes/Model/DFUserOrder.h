//
//  DFUserOrder.h
//  Aurora
//
//  Created by David on 14-4-4.
//  Copyright (c) 2014年 david. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DFUser.h"

#define kUserOrderNumberKey             @"Number"
#define kUserOrderIdentificationKey     @"Identification"
#define kUserOrderOrderStatusKey        @"OrderStatus"
#define kUserOrderSeatTypeKey           @"SeatType"
#define KUserOrderUserKey               @"User"
#define kUserOrderOrderIdKey            @"OrderId"
#define kUserOrderShopNameKey           @"ShopName"
#define kUserOrderStartTimeKey          @"StartTime"
#define kUserOrderEndTimeKey            @"EndTime"
#define kUserOrderRemarksKey            @"Remarks"
#define kUserOrderAdditonKey            @"Addition"

#define OrderSuccess    1;
#define OrderFail       -1;
#define OrderInDeal     0;

@interface DFUserOrder : NSObject<NSCopying, NSCoding>

@property int number;
@property int identification;
@property int orderStatus;
@property (nonatomic, copy) NSString * seatType;
@property (nonatomic, retain) DFUser * user;
@property (nonatomic, copy) NSString * orderId;
@property (nonatomic, copy) NSString * shopName;
@property (nonatomic, copy) NSDate * startTime;
@property (nonatomic, copy) NSDate * endTime;
@property (nonatomic, copy) NSString * remarks;
@property (nonatomic, copy) NSString * addition;

@end