//
//  GaodeLocationReGeocode.h
//  JMapFramework
//
//  Created by ws on 2018/10/12.
//  Copyright © 2018年 ws. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ILocationReGeocode.h"
#import <AMapFoundationKit/AMapFoundationKit.h>
#import <AMapLocationKit/AMapLocationKit.h>

@interface GaodeLocationReGeocode : NSObject<ILocationReGeocode>

- (instancetype)initWithLocationReGeocode:(AMapLocationReGeocode *)reGeocode;

@end
