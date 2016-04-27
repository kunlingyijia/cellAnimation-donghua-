//
//  RootViewController.m
//  cellAnimation
//
//  Created by 席亚坤 on 16/4/27.
//  Copyright © 2016年 席亚坤. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController ()

///数据源
@property (nonatomic, strong) NSMutableArray *dataArray ;

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //初始化数据源
    self.dataArray = [NSMutableArray arrayWithCapacity:1];
    //for循环
    for (int i = 0 ; i< 100; i++) {
        NSString * str = @"  ***************坤灵宜家****************  ";
        [_dataArray addObject:str];
    }
    
    
    
    
    }

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _dataArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.textLabel.text = self.dataArray[indexPath.row];
    cell.backgroundColor = [UIColor yellowColor];
    return cell;
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    ///配置 CATransform3D 动画内容
    CATransform3D  transform ;
    transform.m34 = 1.0/-800;
    //定义 Cell的初始化状态
    cell.layer.transform = transform;
    //定义Cell 最终状态 并且提交动画
    [UIView beginAnimations:@"transform" context:NULL];
    [UIView setAnimationDuration:1];
    cell.layer.transform = CATransform3DIdentity;
    cell.frame = CGRectMake(0, cell.frame.origin.y, cell.frame.size.width, cell.frame.size.height);
    [UIView commitAnimations];
    
    
}
@end
