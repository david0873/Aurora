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
#define kUserOrderOrderTimeKey          @"OrderTime"
#define kUserOrderRemarksKey            @"Remarks"
#define kUserOrderAdditonKey            @"Addition"
#define kUserOrderReplyKey              @"Reply"

#define kUserOrderShopIdKey             @"ShopId"
#define kUserOrderDepositKey            @"Deposit"
#define kUserOrderMiniChargeKey         @"MiniCharge"

#define OrderInDeal     0
#define OrderNotPayed   1
#define OrderSuccess    2
#define OrderFail       -1

@interface DFUserOrder : NSObject<NSCopying, NSCoding>

@property int number;
@property int identification;
@property int orderStatus;
@property (nonatomic, copy) NSString * seatType;
@property (nonatomic, retain) DFUser * user;
@property (nonatomic, copy) NSString * orderId;
@property (nonatomic, copy) NSDate * startTime;
@property (nonatomic, copy) NSDate * endTime;
@property (nonatomic, copy) NSDate * orderTime;
@property (nonatomic, copy) NSString * remarks;
@property (nonatomic, copy) NSString * addition;
@property (nonatomic, copy) NSString * shopId;
@property (nonatomic, copy) NSString * shopName;
@property (nonatomic, copy) NSString * reply;
@property int deposit;
@property int miniCharge;

//出价，选择非手动输入
@property (nonatomic, copy) NSString * price;

//- (NSString *)toJson;


@end
