//
//  GaodeLocation.m
//  JMapFramework
//
//  Created by ws on 2018/10/12.
//  Copyright © 2018年 ws. All rights reserved.
//

#import "GaodeLocation.h"
#import "GaodeLocationReGeocode.h"

@interface GaodeLocation()

@property (strong,nonatomic) CLLocation * location;
@property (strong, nonatomic) AMapLocationReGeocode * locationReGeocode;

@end

@implementation GaodeLocation

- (instancetype)initWithLocation:(CLLocation *)location reGeocode:(AMapLocationReGeocode *)reGeocode {
    self = [super init];
    if (self) {
        _location = location;
        _locationReGeocode = reGeocode;
    }
    return self;
}

- (CLLocation *)getLocation {
    return _location;
}

- (NSString *)getLocationID {
    return nil;
}

- (id)getObject {
    return _location;
}

- (LocationProvider)getProvider {
    return LocationProviderIOS;
}

- (id<ILocationReGeocode>)getRgcData {
    id<ILocationReGeocode> geocode = [[GaodeLocationReGeocode alloc] initWithLocationReGeocode:_locationReGeocode];
    return geocode;
}

@end
