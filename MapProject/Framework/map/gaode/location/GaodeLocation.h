//
//  GaodeLocation.h
//  JMapFramework
//
//  Created by ws on 2018/10/12.
//  Copyright © 2018年 ws. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ILocation.h"
#import <AMapFoundationKit/AMapFoundationKit.h>
#import <AMapLocationKit/AMapLocationKit.h>

@interface GaodeLocation : NSObject<ILocation>

- (instancetype)initWithLocation:(CLLocation *)location reGeocode:(AMapLocationReGeocode *)reGeocode;

@end
