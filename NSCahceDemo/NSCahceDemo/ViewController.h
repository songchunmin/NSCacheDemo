//
//  ViewController.h
//  NSCahceDemo
//
//  Created by SongChunMin on 16/4/9.
//  Copyright © 2016年 SongChunMin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CacheManager.h"
#import "CachedTableViewCell.h"

@interface ViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong)UITableView *tableView;

@end

