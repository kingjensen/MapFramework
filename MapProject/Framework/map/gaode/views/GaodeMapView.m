//
//  GaodeMapView.m
//  JMapFramework
//
//  Created by ws on 2018/10/10.
//  Copyright © 2018年 ws. All rights reserved.
//

#import "GaodeMapView.h"
#import <MAMapKit/MAMapKit.h>
#import <AMapFoundationKit/AMapFoundationKit.h>

@interface GaodeMapView()

@property (strong, nonatomic)MAMapView * mapView;

@end

@implementation GaodeMapView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super init];
    if (self) {
        _mapView = [[MAMapView alloc] initWithFrame:frame];
    }
    return self;
}

- (id)getMapView {
    return _mapView;
}

@end
