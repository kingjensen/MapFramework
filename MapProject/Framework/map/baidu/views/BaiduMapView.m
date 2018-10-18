//
//  BaiduMapView.m
//  JMapFramework
//
//  Created by ws on 2018/10/10.
//  Copyright © 2018年 ws. All rights reserved.
//

#import "BaiduMapView.h"
#import <BaiduMapAPI_Base/BMKBaseComponent.h>//引入base相关所有的头文件
#import <BaiduMapAPI_Map/BMKMapComponent.h>//引入地图功能所有的头文件


@interface BaiduMapView()

@property (nonatomic) BMKMapView* mapView;

@end

@implementation BaiduMapView
//构造方法需要指定MapView大小
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super init];
    if (self) {
         _mapView = [[BMKMapView alloc]initWithFrame:frame];
    }
    return self;
}

- (id)getMapView {
    return _mapView;
}

@end
