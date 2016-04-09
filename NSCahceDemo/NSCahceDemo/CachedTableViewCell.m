//
//  CachedTableViewCell.m
//  NSCahceDemo
//
//  Created by SongChunMin on 16/4/9.
//  Copyright © 2016年 SongChunMin. All rights reserved.
//

#import "CachedTableViewCell.h"

@implementation CachedTableViewCell


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    
}


-(void)downloadFile:(NSURL *)fileUrl forIndexPath:(NSIndexPath *)indexPath {
    
    [[self textLabel] setText:@"Downloading file..."];
    dispatch_queue_t dispatchQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    dispatch_async(dispatchQueue, ^ {
        
        NSData *fileData = [NSData dataWithContentsOfURL:fileUrl];
        NSString *cacheKey = [NSString stringWithFormat:@"Cache%ld%ld", (long)indexPath.row, (long)indexPath.section];
        
        [[CacheManager sharedInstance] setCache:fileData forKey:cacheKey];
        
        dispatch_async(dispatch_get_main_queue(), ^ {
            
            [[self textLabel] setText:@"Finished downloading file!"];
            
        });
        
    });
}

@end
