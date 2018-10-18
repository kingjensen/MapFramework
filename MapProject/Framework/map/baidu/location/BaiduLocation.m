//
//  BaiduLocation.m
//  JMapFramework
//
//  Created by ws on 2018/10/11.
//  Copyright © 2018年 ws. All rights reserved.
//

#import "BaiduLocation.h"
#import <BMKLocationkit/BMKLocationComponent.h>
#import <CoreLocation/CoreLocation.h>
#import "BaiduLocationReGeocode.h"

@interface BaiduLocation()

@property (strong, nonatomic) BMKLocation * bmkLocation;

@end

@implementation BaiduLocation

- (instancetype)initWithLocation:(BMKLocation *)location {
    self = [super init];
    if(self){
        _bmkLocation = location;
    }
    return self;
}

- (CLLocation *)getLocation {
    return _bmkLocation.location;
}


- (id<ILocationReGeocode>)getRgcData {
    id<ILocationReGeocode> geocode = [[BaiduLocationReGeocode alloc] initWithLocationReCeocode:_bmkLocation.rgcData];
    return geocode;
}

- (LocationProvider)getProvider {
    if (_bmkLocation.provider == BMKLocationProviderIOS) {
        return LocationProviderIOS;
    }else {
        return LocationProviderOther;
    }
}

- (NSString * _Nullable)getLocationID {
    return _bmkLocation.locationID;
}

- (id)getObject {
    return _bmkLocation;
}
@end
