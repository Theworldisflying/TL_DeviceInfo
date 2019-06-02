//
//  ViewController.m
//  TL_DeviceInfo
//
//  Created by miu_wen on 2019/5/28.
//  Copyright © 2019 miu_wen. All rights reserved.
//

#import "ViewController.h"
#import "TL_DeviceInfo.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"IDFA.....%@",[TL_DeviceInfo tl_getDeviceIDFA]);
    NSLog(@"IDFV.....%@",[TL_DeviceInfo tl_getDeviceIDFV]);
    NSLog(@"UUID.....%@",[TL_DeviceInfo tl_getDeviceUUID]);
    NSLog(@"设备所有者.....%@",[TL_DeviceInfo tl_getDeviceName]);
    NSLog(@"设备的型号......%@",[TL_DeviceInfo tl_getDeviceModel]);
    NSLog(@"本地化版本......%@",[TL_DeviceInfo tl_getDeviceLocalizedModel]);
    NSLog(@"当前运行的系统.....%@",[TL_DeviceInfo tl_getDeviceSystemName]);
    NSLog(@"当前系统的版本......%@",[TL_DeviceInfo tl_getDeviceSystemVersion]);
    // Do any additional setup after loading the view.
}

@end
