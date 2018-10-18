//
//  GaodeMapFactory.m
//  JMapFramework
//
//  Created by ws on 2018/10/10.
//  Copyright © 2018年 ws. All rights reserved.
//

#import "GaodeMapFactory.h"
#import "IMapView.h"
#import <AMapFoundationKit/AMapFoundationKit.h>
#import "GaodeMapView.h"
#import "ILocationService.h"
#import "GaodeLocationService.h"

@interface GaodeMapFactory()

@property (strong, nonatomic) NSString * appKey;

@end

@implementation GaodeMapFactory

- (instancetype)initWithAppKey:(NSString*)appKey {
    if (self = [super init]) {
        _appKey = appKey;
        [AMapServices sharedServices].apiKey = appKey;
    }
    return self;
}

- (id<IMapView>)getMapViewWithFrame:(CGRect)rect {
    return [[GaodeMapView alloc] initWithFrame:rect];
}

- (id<ILocationService>)getLocationService {
    return [[GaodeLocationService alloc] initWithAppKey:_appKey];
}

@end
