//
//  BaiduMapFactory.m
//  JMapFramework
//
//  Created by ws on 2018/10/10.
//  Copyright © 2018年 ws. All rights reserved.
//

#import "BaiduMapFactory.h"
#import "BaiduMapView.h"
#import <UIKit/UIKit.h>
#import <BaiduMapAPI_Base/BMKBaseComponent.h>//引入base相关所有的头文件
#import "BaiduLocationService.h"

@interface BaiduMapFactory()<BMKGeneralDelegate>

@property (nonatomic, strong) BMKMapManager *mapManager; //主引擎类
@property (nonatomic) NSString * appKey;

@end

@implementation BaiduMapFactory

- (instancetype)initWithAppKey:(NSString*)appKey {
    if (self = [super init]) {
        _appKey = appKey;
        _mapManager = [[BMKMapManager alloc] init];
        BOOL result = [_mapManager start:appKey generalDelegate:self];
        if (!result) {
            NSLog(@"启动引擎失败");
        }
    }
    return self;
}

- (id<IMapView>)getMapViewWithFrame:(CGRect)rect {
    return [[BaiduMapView alloc] initWithFrame:rect];
}

- (id<ILocationService>)getLocationService {
    return [[BaiduLocationService alloc] initWithAppKey:_appKey];
}

#pragma mark - BMKGeneralDelegate

- (void)onGetNetworkState:(int)iError{
    if (0 == iError) {
        NSLog(@"联网成功");
    }
    else{
        NSLog(@"onGetNetworkState %d",iError);
    }
}

- (void)onGetPermissionState:(int)iError{
    if (0 == iError) {
        NSLog(@"授权成功");
    }
    else {
        NSLog(@"onGetPermissionState %d",iError);
    }
}

@end
