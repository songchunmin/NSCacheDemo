//
//  ViewController.m
//  NSCahceDemo
//
//  Created by SongChunMin on 16/4/9.
//  Copyright © 2016年 SongChunMin. All rights reserved.
//

#import "ViewController.h"

#define kSampleDataUrl @"https://codeload.github.com/songchunmin/NSCacheDemo/zip/master"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //create tableview
    self.tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [self.view addSubview:_tableView];
}


#pragma mark - UITableViewDataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 50;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellIdentifier = @"caChecell";
    CachedTableViewCell *cell = (CachedTableViewCell *)[self.tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil) {
        
        cell = [[CachedTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    [[cell textLabel] setText:@""];
    NSString *cacheKey = [NSString stringWithFormat:@"Cache%ld%ld", (long)indexPath.row, (long)indexPath.section];
    NSData *cachedObject = [[CacheManager sharedInstance] getCacheForKey:cacheKey];
    
    if (cachedObject != nil) {
        
        [[cell textLabel] setText:@"Got object from cache!"];
    }
    
    else {
        
        [cell downloadFile:[NSURL URLWithString:kSampleDataUrl]
              forIndexPath:indexPath];
    }
    
    return cell;
}


#pragma mark - UITableViewDelegate
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
}




@end
