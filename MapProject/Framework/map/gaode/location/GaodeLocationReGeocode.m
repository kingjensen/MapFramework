//
//  GaodeLocationReGeocode.m
//  JMapFramework
//
//  Created by ws on 2018/10/12.
//  Copyright © 2018年 ws. All rights reserved.
//

#import "GaodeLocationReGeocode.h"

@interface GaodeLocationReGeocode()

@property (strong, nonatomic)AMapLocationReGeocode * reGeocode;

@end

@implementation GaodeLocationReGeocode

- (instancetype)initWithLocationReGeocode:(AMapLocationReGeocode *)reGeocode {
    self = [super init];
    if (self) {
        _reGeocode = reGeocode;
    }
    return self;
}

#pragma mark -

- (NSString *)getAdCode {
    return _reGeocode.adcode;
}

- (NSString *)getCity {
    return _reGeocode.city;
}

- (NSString *)getCityCode {
    return _reGeocode.citycode;
}

- (NSString *)getCountry {
    return _reGeocode.country;
}

- (NSString *)getCountryCode {
    return nil;
}

- (NSString *)getDistrict {
    return  _reGeocode.district;
}

- (NSString *)getLocationDescribe {
    return _reGeocode.formattedAddress;
}

- (NSString *)getProvince {
    return _reGeocode.province;
}

- (NSString *)getStreet {
    return _reGeocode.street;
}

- (NSString *)getStreetNumber {
    return _reGeocode.number;
}

@end


