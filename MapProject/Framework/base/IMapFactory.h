//
//  IMapFactory.h
//  JMapFramework
//
//  Created by ws on 2018/10/10.
//  Copyright © 2018年 ws. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "IMapView.h"
#import "ILocationService.h"

@protocol IMapFactory <NSObject>

- (instancetype)initWithAppKey:(NSString*)appKey;
- (id<IMapView>)getMapViewWithFrame:(CGRect)rect;
- (id<ILocationService>)getLocationService;

@end
