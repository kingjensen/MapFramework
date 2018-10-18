//
//  BaiduLocationReGeocode.h
//  JMapFramework
//
//  Created by ws on 2018/10/11.
//  Copyright © 2018年 ws. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ILocationReGeocode.h"
#import <BMKLocationkit/BMKLocationComponent.h>

@interface BaiduLocationReGeocode:NSObject<ILocationReGeocode>

- (instancetype)initWithLocationReCeocode:(BMKLocationReGeocode *)locationReCeocode;

@end

