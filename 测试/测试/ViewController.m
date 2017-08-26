//
//  ViewController.m
//  测试
//
//  Created by zxs on 2017/8/25.
//  Copyright © 2017年 郑信善. All rights reserved.
//

#import "ViewController.h"
#import "DXTableViewCell.h"
#define screenW [UIScreen mainScreen].bounds.size.width
#define screenH [UIScreen mainScreen].bounds.size.height
@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong)UITableView *dxTableView;
@property (nonatomic,strong)UIView *dxHeadView;
@property (nonatomic,strong)UIImageView *dxImageView;
@end
static NSString *dxCell = @"cell";
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.dxTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, screenW, screenH) style:UITableViewStylePlain];
    
    //图片
    self.dxImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, screenW, 300)];
    self.dxImageView.image = [UIImage imageNamed:@"timg"];

    
    
    //类似父视图
    self.dxHeadView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, screenW, 300)];
    [self.dxHeadView addSubview:self.dxImageView];
    
    
    self.dxTableView.tableHeaderView = self.dxHeadView;
    
    [self.view addSubview:self.dxTableView];
    self.dxTableView.delegate = self;
    self.dxTableView.dataSource = self;
    
    [self.dxTableView registerClass:[DXTableViewCell class] forCellReuseIdentifier:dxCell];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return 10;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    return 100;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    
    DXTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:dxCell forIndexPath:indexPath];
    
    cell.backgroundColor = [UIColor redColor];
   
    return cell;
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    CGFloat yOffset = scrollView.contentOffset.y  ;
    if (yOffset < 0) {
        CGFloat totalOffset = 300 + ABS(yOffset);
        CGFloat f = totalOffset / 300;
        self.dxImageView.frame = CGRectMake(- (width * f - width) / 2, yOffset, width * f, totalOffset);
    }
    
  
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
