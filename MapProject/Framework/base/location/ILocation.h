//
//  ILocation.h
//  JMapFramework
//
//  Created by ws on 2018/10/11.
//  Copyright © 2018年 ws. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ILocationReGeocode.h"
#import <CoreLocation/CoreLocation.h>


typedef NS_ENUM(int, LocationProvider) {
    LocationProviderIOS = 0,           //!<位置来源于iOS本身定位
    LocationProviderOther          //!<位置来源于其他定位服务
};

@protocol ILocation <NSObject>

- (CLLocation *)getLocation;

- (id<ILocationReGeocode>)getRgcData;

- (LocationProvider)getProvider;

- (NSString *)getLocationID;

- (id)getObject;

@end
