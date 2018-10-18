//
//  IMapView.h
//  JMapFramework
//
//  Created by ws on 2018/10/10.
//  Copyright © 2018年 ws. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol IMapView <NSObject>

- (instancetype)initWithFrame:(CGRect)frame;

- (id)getMapView;

@end
