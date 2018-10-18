//
//  BaiduLocationReGeocode.m
//  JMapFramework
//
//  Created by ws on 2018/10/11.
//  Copyright © 2018年 ws. All rights reserved.
//

#import "BaiduLocationReGeocode.h"

@interface BaiduLocationReGeocode()

@property (strong, nonatomic)BMKLocationReGeocode * locationReCeocode;

@end

@implementation BaiduLocationReGeocode

- (instancetype)initWithLocationReCeocode:(BMKLocationReGeocode *)locationReCeocode {
    self = [super init];
    if(self){
        _locationReCeocode = locationReCeocode;
    }
    return self;
}

- (NSString *)getAdCode {
   return  _locationReCeocode.adCode;
}

- (NSString *)getCity {
      return  _locationReCeocode.city;
}

- (NSString *)getCityCode {
      return  _locationReCeocode.cityCode;
}

- (NSString *)getCountry {
    return  _locationReCeocode.country;
}

- (NSString *)getCountryCode {
     return  _locationReCeocode.countryCode;
}

- (NSString *)getDistrict {
      return  _locationReCeocode.district;
}

- (NSString *)getLocationDescribe {
      return  _locationReCeocode.locationDescribe;
}

- (NSString *)getProvince {
      return  _locationReCeocode.province;
}

- (NSString *)getStreet {
      return  _locationReCeocode.street;
}

- (NSString *)getStreetNumber {
      return  _locationReCeocode.streetNumber;
}

@end
