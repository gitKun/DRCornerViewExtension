//
//  TestCornerViewController.m
//  DRCornerViewDemo
//
//  Created by DRTerry on 2017/3/8.
//  Copyright © 2017年 kun. All rights reserved.
//

#import "TestCornerViewController.h"
#import "Corner1Cell.h"

@interface TestCornerViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) NSMutableArray *dataArray;

@end

@implementation TestCornerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"自定义的圆角";
    self.automaticallyAdjustsScrollViewInsets = NO;
}


- (NSMutableArray *)dataArray {
    if (!_dataArray) {
        self.dataArray = [[NSMutableArray alloc] init];
        NSInteger totla = arc4random()%4 + 2;
        for (NSInteger i = 0; i < totla; i++) {
            [_dataArray addObject:@"图标说明(名称)"];
        }
    }
    return _dataArray;
}

#pragma mark ---- UITableViewDataSource && UITableViewDelegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return  self.dataArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 45.0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    Corner1Cell *cell = [tableView dequeueReusableCellWithIdentifier:@"Corner1CellID"];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"Corner1Cell" owner:self options:nil] lastObject];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    Corner1Cell *tCell = (Corner1Cell *)cell;
    if (indexPath.row == 0) {
        [tCell cornerTop];
    }else if (indexPath.row == _dataArray.count -1) {
        [tCell cornerBottom];
    }else {
        [tCell clearCurrentCorner];
    }
    NSString *infoStr = _dataArray[indexPath.row];
    [tCell updateUIWithInfo:infoStr];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"Selected at index : %ld",(long)indexPath.row);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
