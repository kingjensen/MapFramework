//
//  ILocationService.h
//  JMapFramework
//
//  Created by ws on 2018/10/11.
//  Copyright © 2018年 ws. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ILocationServiceDelegate.h"

@protocol ILocationService <NSObject>

- (instancetype)initWithAppKey:(NSString *)appKey;
- (void)setLocationServiceDelegate:(id<ILocationServiceDelegate>)delegate;
- (void)startUpdatingLocation;

@end
