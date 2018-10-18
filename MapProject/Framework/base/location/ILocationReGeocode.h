//
//  ILocationReGeocode.h
//  JMapFramework
//
//  Created by ws on 2018/10/11.
//  Copyright © 2018年 ws. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ILocationReGeocode <NSObject>

- (NSString *)getCountry;

///国家编码属性
- (NSString *)getCountryCode;

///省份名字属性
- (NSString *)getProvince;

///城市名字属性
- (NSString *)getCity;

///区名字属性
- (NSString *)getDistrict;

///街道名字属性
- (NSString *)getStreet;

///街道号码属性
- (NSString *)getStreetNumber;

///城市编码属性
- (NSString *)getCityCode;

///行政区划编码属性
- (NSString *)getAdCode;

///位置语义化结果的定位点在什么地方周围的描述信息
- (NSString *)getLocationDescribe;

@end
