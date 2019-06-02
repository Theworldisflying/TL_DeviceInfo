//
//  TL_DeviceInfo.m
//  TL_DeviceInfo
//
//  Created by miu_wen on 2019/6/2.
//  Copyright © 2019 miu_wen. All rights reserved.
//

#import "TL_DeviceInfo.h"
#import <UIKit/UIKit.h>
//获取idfa
#import <AdSupport/ASIdentifierManager.h>
//获取mac
#include <sys/sysctl.h>
#include <sys/socket.h>
#include <net/if.h>
#include <net/if_dl.h>

@implementation TL_DeviceInfo
+(NSString *)tl_getDeviceIDFA{
    //iOS10之后更新之后一旦开启了 设置->隐私->广告->限制广告跟踪之后  获取到的idfa将会是一串00000。且每次开启在关闭之后 相应的idfa也会重新生成，相当于还原了一次广告标识符。
    if ([[ASIdentifierManager sharedManager] isAdvertisingTrackingEnabled]) {
        ASIdentifierManager *asIM = [[ASIdentifierManager alloc] init];
        NSString *idfaStr = [asIM.advertisingIdentifier UUIDString];
        return idfaStr;
    }
    return nil;
}
+(NSString *)tl_getDeviceIDFV{
    NSString* idfvStr      = [[UIDevice currentDevice] identifierForVendor].UUIDString;
    return idfvStr;
}
+(NSString*)tl_getDeviceMAC{
    int mib[6];
    size_t len;
    char *buf;
    unsigned char *ptr;
    struct if_msghdr *ifm;
    struct sockaddr_dl *sdl;
    
    mib[0] = CTL_NET;
    mib[1] = AF_ROUTE;
    mib[2] = 0;
    mib[3] = AF_LINK;
    mib[4] = NET_RT_IFLIST;
    
    if ((mib[5] = if_nametoindex("en0")) == 0) {
        printf("Error: if_nametoindex error\n");
        return NULL;
    }
    
    if (sysctl(mib, 6, NULL, &len, NULL, 0) < 0) {
        printf("Error: sysctl, take 1\n");
        return NULL;
    }
    
    if ((buf = malloc(len)) == NULL) {
        printf("Could not allocate memory. error!\n");
        return NULL;
    }
    
    if (sysctl(mib, 6, buf, &len, NULL, 0) < 0) {
        printf("Error: sysctl, take 2");
        free(buf);
        return NULL;
    }
    
    ifm = (struct if_msghdr *)buf;
    sdl = (struct sockaddr_dl *)(ifm + 1);
    ptr = (unsigned char *)LLADDR(sdl);
    NSString *macStr = [NSString stringWithFormat:@"%02X:%02X:%02X:%02X:%02X:%02X",*ptr, *(ptr+1), *(ptr+2), *(ptr+3), *(ptr+4), *(ptr+5)];
    free(buf);
    return macStr;
}
+(NSString*)tl_getDeviceUUID{
    
    CFUUIDRef uuid = CFUUIDCreate(NULL);
    assert(uuid != NULL);
    CFStringRef uuidStr = CFUUIDCreateString(NULL, uuid);
    return (__bridge NSString *)(uuidStr);
}
//获取设备信息
//获取设备所有者的名称
+(NSString*)tl_getDeviceName{
    return [UIDevice currentDevice].name;
}
//获取设备的型号
+(NSString*)tl_getDeviceModel{
    return [UIDevice currentDevice].model;
}
//获取本地化版本
+(NSString*)tl_getDeviceLocalizedModel{
    return [UIDevice currentDevice].localizedModel;
}
//获取当前运行的系统
+(NSString*)tl_getDeviceSystemName{
    return [UIDevice currentDevice].systemName;
}
//获取当前系统的版本
+(NSString*)tl_getDeviceSystemVersion{
    return [UIDevice currentDevice].systemVersion;
}
@end
