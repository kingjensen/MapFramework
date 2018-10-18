//
//  MapEngine.m
//  JMapFramework
//
//  Created by ws on 2018/10/10.
//  Copyright © 2018年 ws. All rights reserved.
//

#import "MapEngine.h"
#import "PlatformXmlParser.h"
#import "Platform.h"

@interface MapEngine()

@property (nonatomic) NSMutableArray* array;
@property (nonatomic) id<IMapFactory> factory;

@end

@implementation MapEngine

//单例模式
static MapEngine* instance = nil;

+(instancetype)sharedInstance{
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        instance = [[MapEngine alloc] init];
    });
    return instance;
}

//当我们调用alloc时候回调改方法(保证唯一性)
+(id)allocWithZone:(struct _NSZone *)zone{
    if(instance == nil){
        static dispatch_once_t once;
        dispatch_once(&once, ^{
            instance = [super allocWithZone:zone];
        });
    }
    return instance;
}

-(void)initMap{
    PlatformXmlParser* xmlParser = [[PlatformXmlParser alloc] init];
    _array = [xmlParser parser];
    _factory = [self getMapFactory];
}

//创建工厂
-(id<IMapFactory>)getMapFactory{
    //循环遍历你要创建的工厂
    if (_factory != nil) {
        return _factory;
    }
    @try {
        for (Platform* platform in _array) {
            if([platform.isOpen isEqualToString:@"YES"]){
                _factory = [[NSClassFromString(platform.factoryName) alloc] initWithAppKey:platform.appKey];
                return _factory;
            }
        }
    } @catch (NSException *exception) {
        //补救措施
        NSLog(@"创建工厂错误，请检查配置文件是否配置正确!");
    }
    return nil;
}


@end
