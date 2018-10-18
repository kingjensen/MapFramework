//
//  GaodeLocationService.m
//  JMapFramework
//
//  Created by ws on 2018/10/11.
//  Copyright © 2018年 ws. All rights reserved.
//

#import "GaodeLocationService.h"
#import <AMapFoundationKit/AMapFoundationKit.h>
#import <AMapLocationKit/AMapLocationKit.h>
#import "ILocationService.h"

@interface GaodeLocationService()<AMapLocationManagerDelegate>

@property (assign, nonatomic) id<ILocationServiceDelegate> delegate;
@property(strong, nonatomic)AMapLocationManager * locationManager;

@end

@implementation GaodeLocationService


- (instancetype)initWithAppKey:(NSString *)appKey {
    self = [super init];
    if (self) {
       [AMapServices sharedServices].apiKey = appKey;
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

- (AMapLocationManager *)locationManager {
    if (!_locationManager) {
        //初始化实例
        _locationManager = [[AMapLocationManager alloc] init];
        _locationManager.distanceFilter = 200;
        _locationManager.delegate = self;
    }
    return _locationManager;
}

- (void)startUpdatingLocation {
    [self.locationManager setLocatingWithReGeocode:YES];
    [self.locationManager startUpdatingLocation];
}

#pragma mark - AMapLocationManagerDelegate

- (void)amapLocationManager:(AMapLocationManager *)manager didUpdateLocation:(CLLocation *)location reGeocode:(AMapLocationReGeocode *)reGeocode
{
    NSLog(@"高德定位---location:{lat:%f; lon:%f; accuracy:%f}", location.coordinate.latitude, location.coordinate.longitude, location.horizontalAccuracy);
   
    if (self.delegate && [self.delegate respondsToSelector:@selector(amapLocationManager:didUpdateLocation:)]) {
        
    }
}

- (void)amapLocationManager:(AMapLocationManager *)manager didFailWithError:(NSError *)error {
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(amapLocationManager:didFailWithError:)]) {
        [self.delegate locationManagerDidFailWithError:error];
    }
}

/**
 *  @brief 定位权限状态改变时回调函数
 *  @param manager 定位 AMapLocationManager 类。
 *  @param status 定位权限状态。
 */
- (void)amapLocationManager:(AMapLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status {
    NSLog(@"权限");
}

/**
 *  @brief 是否显示设备朝向校准
 *  @param manager 定位 AMapLocationManager 类。
 *  @return 是否显示设备朝向校准
 */
- (BOOL)amapLocationManagerShouldDisplayHeadingCalibration:(AMapLocationManager *)manager {
    return YES;
}

/**
 *  @brief 设备方向改变时回调函数
 *  @param manager 定位 AMapLocationManager 类。
 *  @param newHeading 设备朝向。
 */
- (void)amapLocationManager:(AMapLocationManager *)manager didUpdateHeading:(CLHeading *)newHeading {
  
}



@end
