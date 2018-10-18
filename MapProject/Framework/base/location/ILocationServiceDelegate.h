//
//  ILocationServiceDelegate.h
//  JMapFramework
//
//  Created by ws on 2018/10/11.
//  Copyright © 2018年 ws. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ILocation.h"

typedef NS_ENUM(int, LocationNetworkState) {
    LocationNetworkStateUnknown = 0,    ///<网络状态未知
    LocationNetworkStateWifi,           ///<网络状态wifi
    LocationNetworkStateWifiHotSpot,          ///<网络状态连接WIFI移动热点
    LocationNetworkStateMobile2G,          ///<网络状态移动2G
    LocationNetworkStateMobile3G,          ///<网络状态移动3G
    LocationNetworkStateMobile4G        ///<网络状态移动4G
};

@protocol ILocationServiceDelegate <NSObject>

@optional
/**
 *  @brief 当定位发生错误时，会调用代理的此方法。
 *  @param error 返回的错误，参考 CLError 。
 */
- (void)locationManagerDidFailWithError:(NSError * _Nullable)error;


/**
 *  @brief 连续定位回调函数。
 *  @param location 定位结果，参考BMKLocation。
 *  @param error 错误信息。
 */
- (void)locationManagerDidUpdateLocation:(id<ILocation>  _Nonnull)location orError:(NSError * _Nullable)error;

/**
 *  @brief 定位权限状态改变时回调函数
 *  @param status 定位权限状态。
 */
- (void)locationManagerDidChangeAuthorizationStatus:(CLAuthorizationStatus)status;


/**
 * @brief 该方法为BMKLocationManager提示需要设备校正回调方法。
 */
- (BOOL)locationManagerShouldDisplayHeadingCalibration;

/**
 * @brief 该方法为BMKLocationManager提供设备朝向的回调方法。
 * @param heading 设备的朝向结果
 */
- (void)locationManagerDidUpdateHeading:(CLHeading * _Nullable)heading;

/**
 * @brief 该方法为BMKLocationManager所在App系统网络状态改变的回调事件。
 * @param state 当前网络状态
 * @param error 错误信息
 */
- (void)locationManagerDidUpdateNetworkState:(LocationNetworkState)state orError:(NSError * _Nullable)error;

@end
