//
//  Singleton.m
//  ShoppingNineNine
//
//  Created by yishain chen on 2015/10/26.
//  Copyright © 2015年 yishain chen. All rights reserved.
//

#import "Singleton.h"

@implementation Singleton
+ (id)sharedInstance {
    static dispatch_once_t onceToken = 0;
    
    __strong static id _sharedObject = nil;
    
    dispatch_once(&onceToken, ^{
        _sharedObject = [[self alloc]init];
    });
    
    return _sharedObject;
}

- (id)init {
    self = [super init];
    
    if (self) {
       
    }
    return self;
}
@end