//
//  CacheManager.h
//  NSCahceDemo
//
//  Created by SongChunMin on 16/4/9.
//  Copyright © 2016年 SongChunMin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CacheManager : NSObject

@property (retain, nonatomic) NSCache *cache;

+(instancetype)sharedInstance;
+(void)destroySharedInstance;

-(void)setCache:(id)obj forKey:(NSString *)key;
-(id)getCacheForKey:(NSString *)key;

@end
