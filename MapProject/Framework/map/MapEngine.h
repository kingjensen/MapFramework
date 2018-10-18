//
//  MapEngine.h
//  JMapFramework
//
//  Created by ws on 2018/10/10.
//  Copyright © 2018年 ws. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IMapFactory.h"

@interface MapEngine : NSObject

+ (instancetype)sharedInstance;

- (void)initMap;

- (id<IMapFactory>)getMapFactory;

@end
