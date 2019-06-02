//
//  TL_DeviceInfo.h
//  TL_DeviceInfo
//
//  Created by miu_wen on 2019/6/2.
//  Copyright © 2019 miu_wen. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TL_DeviceInfo : NSObject
/*
 *获取IDFA
 */
+(NSString *)tl_getDeviceIDFA;
/*
 *获取IDFV
 */
+(NSString *)tl_getDeviceIDFV;
/*
 *获取mac地址
 */
+(NSString*)tl_getDeviceMAC;
/*
 *获取UUID
 */
+(NSString*)tl_getDeviceUUID;
//获取设备所有者的名称
+(NSString*)tl_getDeviceName;
//获取设备的型号
+(NSString*)tl_getDeviceModel;
//获取本地化版本
+(NSString*)tl_getDeviceLocalizedModel;
//获取当前运行的系统
+(NSString*)tl_getDeviceSystemName;
//获取当前系统的版本
+(NSString*)tl_getDeviceSystemVersion;
@end

NS_ASSUME_NONNULL_END
