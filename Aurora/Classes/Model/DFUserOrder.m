//  Aurora
//
//  Created by David on 14-4-4.
//  Copyright (c) 2014年 david. All rights reserved.
//

#import "DFUserOrder.h"
#import "JSONKit.h"

@implementation DFUserOrder

- (id)copyWithZone:(NSZone *)zone{
    DFUserOrder * copy = [[DFUserOrder allocWithZone:zone]init];
    copy.number = self.number;
    copy.identification = self.identification;
    copy.orderStatus = self.orderStatus;
    [copy setSeatType:[self.seatType copyWithZone:zone]];
    [copy setUser:[self.user copyWithZone:zone]];
    [copy setOrderId:[self.orderId copyWithZone:zone]];
    [copy setStartTime:[self.startTime copyWithZone:zone]];
    [copy setEndTime:[self.endTime copyWithZone:zone]];
    [copy setOrderTime:[self.orderTime copyWithZone:zone]];
    [copy setRemarks:[self.remarks copyWithZone:zone]];
    [copy setAddition:[self.addition copyWithZone:zone]];
    [copy setShopId:[self.shopId copyWithZone:zone]];
    [copy setShopName:[self.shopName copyWithZone:zone]];
    copy.deposit = self.deposit;
    copy.miniCharge = self.miniCharge;
    return copy;
}

- (void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeInt:self.number forKey:kUserOrderNumberKey];
    [aCoder encodeInt:self.identification forKey:kUserOrderIdentificationKey];
    
    [aCoder encodeInt:self.orderStatus forKey:kUserOrderOrderStatusKey];
    [aCoder encodeObject:self.seatType forKey:kUserOrderSeatTypeKey];
    [aCoder encodeObject:self.user forKey:KUserOrderUserKey];
    [aCoder encodeObject:self.orderId forKey:kUserOrderOrderIdKey];
    
    [aCoder encodeObject:self.startTime forKey:kUserOrderStartTimeKey];
    [aCoder encodeObject:self.endTime forKey:kUserOrderEndTimeKey];
    [aCoder encodeObject:self.orderTime forKey:kUserOrderOrderTimeKey];
    [aCoder encodeObject:self.remarks forKey:kUserOrderRemarksKey];
    [aCoder encodeObject:self.addition forKey:kUserOrderAdditonKey];
    [aCoder encodeObject:self.shopId forKey:kUserOrderShopIdKey];
    [aCoder encodeObject:self.shopName forKey:kUserOrderShopNameKey];
    [aCoder encodeInt:self.deposit forKey:kUserOrderDepositKey];
    [aCoder encodeInt:self.miniCharge forKey:kUserOrderMiniChargeKey];
    
}

- (id)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super init]) {
        _number = [aDecoder decodeIntForKey:kUserOrderNumberKey];
        _identification = [aDecoder decodeIntForKey:kUserOrderIdentificationKey];
        _orderStatus = [aDecoder decodeIntForKey:kUserOrderOrderStatusKey];
        _seatType = [aDecoder decodeObjectForKey:kUserOrderSeatTypeKey];
        _user = [aDecoder decodeObjectForKey:KUserOrderUserKey];
        _orderId = [aDecoder decodeObjectForKey:kUserOrderOrderIdKey];
        _startTime = [aDecoder decodeObjectForKey:kUserOrderStartTimeKey];
        _endTime = [aDecoder decodeObjectForKey:kUserOrderEndTimeKey];
        _orderTime = [aDecoder decodeObjectForKey:kUserOrderOrderTimeKey];
        _remarks = [aDecoder decodeObjectForKey:kUserOrderRemarksKey];
        _addition = [aDecoder decodeObjectForKey:kUserOrderAdditonKey];
        _shopId = [aDecoder decodeObjectForKey:kUserOrderShopIdKey];
        _shopName = [aDecoder decodeObjectForKey:kUserOrderShopNameKey];
        _deposit = [aDecoder decodeIntForKey:kUserOrderDepositKey];
        _miniCharge = [aDecoder decodeIntForKey:kUserOrderMiniChargeKey];
    }
    return self;
}

//- (NSString *)toJson{
//    NSDictionary* params = @{@"shop":_shopId, @"person_number":[NSString stringWithFormat:@"%d", _number], @"start_time":[self stringFromDate:_startTime], @"end_time":[self stringFromDate:_endTime], @"seat_type":_seatType};
//    NSString *string = [params JSONString];
//    return string;
//}

- (NSString *)stringFromDate:(NSDate *)date{
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    
    NSString *destDateString = [dateFormatter stringFromDate:date];
    
    return destDateString;
    
}

@end
