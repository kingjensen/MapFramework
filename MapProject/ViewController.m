//
//  ViewController.m
//  MapProject
//
//  Created by ws on 2018/10/18.
//  Copyright © 2018年 ws. All rights reserved.
//

#import "ViewController.h"
#import "IMapFactory.h"
#import "MapEngine.h"
#import "IMapView.h"
#import "ILocationServiceDelegate.h"
#import "ILocationService.h"

@interface ViewController ()<ILocationServiceDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    id<IMapFactory> factory = [[MapEngine sharedInstance] getMapFactory];
    id<IMapView> mapView = [factory getMapViewWithFrame:CGRectMake(0, 0, 320, 568)];
    [self.view addSubview:[mapView getMapView]];
    
    id<ILocationService> locationService = [factory getLocationService];
    [locationService setLocationServiceDelegate:self];
    [locationService startUpdatingLocation];
}


#pragma mark - ILocationServiceDelegate

- (void)locationManagerDidChangeAuthorizationStatus:(CLAuthorizationStatus)status {
    
}

- (void)locationManagerDidFailWithError:(NSError * _Nullable)error {
    
}

- (void)locationManagerDidUpdateHeading:(CLHeading * _Nullable)heading {
    
}

- (void)locationManagerDidUpdateLocation:(id<ILocation> _Nonnull)location orError:(NSError * _Nullable)error {
    NSLog(@"定位地址:%ld-%ld",[location getLocation].coordinate.latitude,[location getLocation].coordinate.longitude);
}

- (void)locationManagerDidUpdateNetworkState:(LocationNetworkState)state orError:(NSError * _Nullable)error {
    
}

#pragma mark - Memory Manage

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
