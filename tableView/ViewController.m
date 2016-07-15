//
//  ViewController.m
//  tableView
//
//  Created by lvAsia on 16/7/15.
//  Copyright © 2016年 answe lv. All rights reserved.
//

#import "ViewController.h"
#import "NOTVCell.h"
#import "AddTVCell.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource,DeviceTableViewCellDelegate>
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)NSArray *array;
@property NSInteger currentEditCellIndex;
@property(nonatomic,strong)NOTVCell *cell;
@end

@implementation ViewController
- (NSArray *)array{
    
    if (!_array) {
        self.array = [[NSMutableArray alloc] init];
        self.array = @[@{@"title":@"人生若只如初见",@"icon":@"唐"},@{@"title":@"何事秋风悲画扇",@"icon":@"宋"},@{@"title":@"世上无难事",@"icon":@"汉"},@{@"title":@"人只要肯攀登",@"icon":@"元"},@{@"title":@"花木兰",@"icon":@"古"},@{@"title":@"关羽",@"icon":@"三国"},@{@"title":@"Skt",@"icon":@"韩"},@{@"title":@"NBA",@"icon":@"Finale"}];
    }
    
    
    return _array;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.delegate = self;
    self.tableView.dataSource  = self;
    
    [self.tableView registerNib:[UINib nibWithNibName:@"NOTVCell" bundle:nil] forCellReuseIdentifier:@"cell"];
    [self.tableView registerNib:[UINib nibWithNibName:@"AddTVCell" bundle:nil] forCellReuseIdentifier:@"AddCell"];
    
    [self.view addSubview:self.tableView];
    
    self.currentEditCellIndex = -1;
    
    
}
#pragma mark - 数据源
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return self.array.count+1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    if (self.currentEditCellIndex == indexPath.row) {
        return 200;
       
    }else{
        return 66;
       
    }

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    
    
    if (indexPath.row < self.array.count) {
        NOTVCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
        NSDictionary *dic = self.array[indexPath.row];
        cell.rowIndex = indexPath.row;
        cell.titleLeftLa.text = dic[@"title"];
        cell.titleRightLa.text = dic[@"icon"];
        cell.delegate = self;
        
        if (self.currentEditCellIndex == indexPath.row) {
           
            cell.titleDownLa.hidden = NO;
            
        }else{
             cell.titleDownLa.hidden = YES;
        }
        
        return cell;
    }else{
        AddTVCell *cell = [tableView dequeueReusableCellWithIdentifier:@"AddCell"];
        return cell;
    }


}
#pragma mark - 代理

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.row < self.array.count) {
        if (self.currentEditCellIndex == indexPath.row){
            NSLog(@"点击cell表格");
            self.currentEditCellIndex = 10000;
            [self.tableView reloadData];
        }
    }else{
        NSLog(@"点击增加cell表格");
    }
}

#pragma mark - DeviceTableViewCellDelegate
#pragma mark Cell左划手势触发编辑模式
- (void)deviceTableViewCellDidEnterEditModeAtRow:(NSInteger)rowIndex
{
    if (self.currentEditCellIndex != rowIndex) {
        self.currentEditCellIndex = rowIndex;
        [self.tableView reloadData];
        [self.tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:rowIndex inSection:0] atScrollPosition:UITableViewScrollPositionTop animated:YES];
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
