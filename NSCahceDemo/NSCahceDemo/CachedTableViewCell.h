//
//  CachedTableViewCell.h
//  NSCahceDemo
//
//  Created by SongChunMin on 16/4/9.
//  Copyright © 2016年 SongChunMin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CacheManager.h"

@interface CachedTableViewCell : UITableViewCell

-(void)downloadFile:(NSURL *)fileUrl forIndexPath:(NSIndexPath *)indexPath;
@end
