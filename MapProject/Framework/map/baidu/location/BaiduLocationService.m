//
//  BaiduLocationService.m
//  JMapFramework
//
//  Created by ws on 2018/10/11.
//  Copyright © 2018年 ws. All rights reserved.
//

#import "BaiduLocationService.h"
#import <BMKLocationkit/BMKLocationComponent.h>
#import "BaiduLocation.h"
#import "ILocationServiceDelegate.h"

@interface BaiduLocationService()<BMKLocationAuthDelegate,BMKLocationManagerDelegate>

@property (assign, nonatomic) id<ILocationServiceDelegate> delegate;
@property(strong, nonatomic)BMKLocationManager * locationManager;

@end

@implementation BaiduLocationService

- (instancetype)initWithAppKey:(NSString *)appKey {
    self = [super init];
    if (self) {
         [[BMKLocationAuth sharedInstance] checkPermisionWithKey:appKey authDelegate:self];
    }
    return self;
}

- (void)setLocationServiceDelegate:(id<ILocationServiceDelegate>)delegate {
     _delegate = delegate;
    if (_delegate) {
        self.locationManager.delegate = self;
    }else {
        self.locationManager.delegate = nil;
    }
}

- (void)onCheckPermissionState:(BMKLocationAuthErrorCode)iError {
    if (iError == 0) {
        NSLog(@"鉴权成功");
    }else {
        NSLog(@"鉴权失败");
    }
}

- (BMKLocationManager *)locationManager {
    if (!_locationManager) {
        //初始化实例
        _locationManager = [[BMKLocationManager alloc] init];
        //设置返回位置的坐标系类型
      //  _locationManager.coordinateType = BMKLocationCoordinateTypeBMK09LL;
        //设置距离过滤参数
        _locationManager.distanceFilter = kCLDistanceFilterNone;
        //设置预期精度参数
        _locationManager.desiredAccuracy = kCLLocationAccuracyBest;
        //设置应用位置类型
        _locationManager.activityType = CLActivityTypeAutomotiveNavigation;
        //设置是否自动停止位置更新
        _locationManager.pausesLocationUpdatesAutomatically = NO;
        //设置是否允许后台定位
       // _locationManager.allowsBackgroundLocationUpdates = YES;
        //设置位置获取超时时间
        _locationManager.locationTimeout = 10;
        //设置获取地址信息超时时间
        _locationManager.reGeocodeTimeout = 10;
    }
    return _locationManager;
}

- (void)startUpdatingLocation {
   // [self.locationManager setLocatingWithReGeocode:YES];
    [self.locationManager startUpdatingLocation];
}

#pragma mark - BMKLocationManagerDelegate

/**
 *  @brief 当定位发生错误时，会调用代理的此方法。
 *  @param manager 定位 BMKLocationManager 类。
 *  @param error 返回的错误，参考 CLError 。
 */
- (void)BMKLocationManager:(BMKLocationManager * _Nonnull)manager didFailWithError:(NSError * _Nullable)error {
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(locationManagerDidFailWithError:)]) {
        [self.delegate locationManagerDidFailWithError:error];
    }
}


/**
 *  @brief 连续定位回调函数。
 *  @param manager 定位 BMKLocationManager 类。
 *  @param location 定位结果，参考BMKLocation。
 *  @param error 错误信息。
 */
- (void)BMKLocationManager:(BMKLocationManager * _Nonnull)manager didUpdateLocation:(BMKLocation * _Nullable)location orError:(NSError * _Nullable)error {
    
    id<ILocation> baiduLocation = [[BaiduLocation alloc] initWithLocation:location];
    if (self.delegate && [self.delegate respondsToSelector:@selector(locationManagerDidUpdateLocation:orError:)]) {
        [self.delegate locationManagerDidUpdateLocation:baiduLocation orError:error];
    }
}

/**
 *  @brief 定位权限状态改变时回调函数
 *  @param manager 定位 BMKLocationManager 类。
 *  @param status 定位权限状态。
 */
- (void)BMKLocationManager:(BMKLocationManager * _Nonnull)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status {
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(locationManagerDidChangeAuthorizationStatus:)]) {
        [self.delegate locationManagerDidChangeAuthorizationStatus:status];
    }
}


/**
 * @brief 该方法为BMKLocationManager提示需要设备校正回调方法。
 * @param manager 提供该定位结果的BMKLocationManager类的实例。
 */
- (BOOL)BMKLocationManagerShouldDisplayHeadingCalibration:(BMKLocationManager * _Nonnull)manager {
    return YES;
}

/**
 * @brief 该方法为BMKLocationManager提供设备朝向的回调方法。
 * @param manager 提供该定位结果的BMKLocationManager类的实例
 * @param heading 设备的朝向结果
 */
- (void)BMKLocationManager:(BMKLocationManager * _Nonnull)manager
          didUpdateHeading:(CLHeading * _Nullable)heading {
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(locationManagerDidUpdateHeading:)]) {
        [self.delegate locationManagerDidUpdateHeading:heading];
    }
}

/**
 * @brief 该方法为BMKLocationManager所在App系统网络状态改变的回调事件。
 * @param manager 提供该定位结果的BMKLocationManager类的实例
 * @param state 当前网络状态
 * @param error 错误信息
 */
- (void)BMKLocationManager:(BMKLocationManager * _Nonnull)manager
     didUpdateNetworkState:(BMKLocationNetworkState)state orError:(NSError * _Nullable)error {
    
    LocationNetworkState locaitonState;
    
    switch (state) {
        case BMKLocationNetworkStateUnknown:
            locaitonState = LocationNetworkStateUnknown;
            break;
        case BMKLocationNetworkStateWifi:
            locaitonState = LocationNetworkStateWifi;
            break;
        case BMKLocationNetworkStateWifiHotSpot:
            locaitonState = LocationNetworkStateWifiHotSpot;
            break;
        case BMKLocationNetworkStateMobile2G:
            locaitonState = LocationNetworkStateMobile2G;
            break;
        case BMKLocationNetworkStateMobile3G:
            locaitonState = LocationNetworkStateMobile3G;
            break;
        case BMKLocationNetworkStateMobile4G:
            locaitonState = LocationNetworkStateMobile4G;
            break;

        default:
            break;
    }
    if (self.delegate && [self.delegate respondsToSelector:@selector(locationManagerDidUpdateNetworkState:orError:)]) {
        [self.delegate locationManagerDidUpdateNetworkState:locaitonState orError:error];
    }
}

@end
