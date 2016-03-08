//
//  ViewController.m
//  DRCornerViewDemo
//
//  Created by apple on 16/3/7.
//  Copyright © 2016年 kun. All rights reserved.
//

#import "ViewController.h"
#import "LargeSumOfCornerCell.h"


@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>



@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 50;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 120;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    LargeSumOfCornerCell *cell = [tableView dequeueReusableCellWithIdentifier:@"LargeSumOfCornerCellID"];
    
    return cell;
}
//在这里填充数据
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    LargeSumOfCornerCell *lCell = (LargeSumOfCornerCell *)cell;
    
    [lCell show];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
