//
//  CacheManager.m
//  NSCahceDemo
//
//  Created by SongChunMin on 16/4/9.
//  Copyright © 2016年 SongChunMin. All rights reserved.
//

#import "CacheManager.h"

static CacheManager *sharedInstance = nil;

@implementation CacheManager

+(instancetype)sharedInstance {
    
    if (sharedInstance == nil) {
        
        sharedInstance = [[self alloc] init];
    }
    
    return sharedInstance;
}

+(void)destroySharedInstance {
    sharedInstance = nil;
}

-(id)init {
    
    self = [super init];
    
    if (self) {
        
        self.cache = [[NSCache alloc] init] ;
    }
    
    return self;
}

-(void)setCache:(id)obj forKey:(NSString *)key {
    NSAssert(obj != nil, @"值不能为空。");
    NSAssert(key != nil, @"值不能为空。");
    [_cache setObject:obj forKey:key];
    
}


-(id)getCacheForKey:(NSString *)key {
    
    return [_cache objectForKey:key];
    
}


-(void)dealloc {
    
}


@end
