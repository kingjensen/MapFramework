//
//  BaiduLocation.h
//  JMapFramework
//
//  Created by ws on 2018/10/11.
//  Copyright © 2018年 ws. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ILocation.h"
#import <BMKLocationkit/BMKLocationComponent.h>

@interface BaiduLocation : NSObject<ILocation>

- (instancetype)initWithLocation:(BMKLocation *)location;

@end
