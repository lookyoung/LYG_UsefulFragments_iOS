//
//  ViewController.m
//  LYG_UsefulFragments_iOS
//
//  Created by liuyang on 17/4/21.
//  Copyright © 2017年 com.me. All rights reserved.
//

#import "ViewController.h"
#import "model.h"
#import "hitTestViewController.h"
#import "InputFieldViewController.h"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>
/** tableView */
@property (nonatomic, strong) UITableView *tableView;

/** 数据源数组(存放所有分组) */
@property (nonatomic, strong) NSMutableArray *dataArray;
/** 数据源字典(单个存放每一个对象) */
@property (nonatomic,strong) NSMutableDictionary *dataDic;
@end

@implementation ViewController

static NSString *cellReuseId = @"cellID";

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellReuseId];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    
    // 调用自定义解析方法
    [self readPlist];
}


- (void)readPlist {
    
    //获取plist文件路径
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"usefulFrag" ofType:@"plist"];
    //因为plist文件的最外层数据是用字典存放的,所以将数据放到字典中
    NSDictionary *dict= [NSDictionary dictionaryWithContentsOfFile:plistPath];
    //初始化数组和字典(不初始化, 会造成数据无法显示)
    self.dataArray = [NSMutableArray array];
    self.dataDic = [NSMutableDictionary dictionary];
    //开始遍历plist文件
    for (NSArray *key in dict) {
        //获取字典中的每个分组(数组)
        [self.dataArray addObject:key];
        
        //初始化一个临时数组, 用来存放每次遍历出来的具体对象(暂时存放, 下面会将数据整组存放到字典中)
        NSMutableArray *array = [NSMutableArray array];
        
        //遍历每个分组中的对象
        for (NSDictionary *dic in dict[key]) {
            
            //将遍历到的对象通过model类特有的方法, 赋值给model类对象
            Model *model = [Model new];
            
            //setValuesForKeysWithDictionary 是model类特有的方法
            [model setValuesForKeysWithDictionary:dic];
            
            //将每次遍历出来的model类对象, 放到临时数组中
            [array addObject:model];
            
        }
        //将临时数组中的整组对象放到全局的字典中(可以根据Key值添加)
        [self.dataDic setObject:array forKey:key];
        
    }
    //因为我们获取到的字典数据是无序的, 这里使用排序选择器对数据进行排序
    [self.dataArray sortUsingSelector:@selector(compare:)];
    
}

#pragma mark - UITableViewDelegate

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    //找到对应分组
    NSString *key = self.dataArray[section];
    //找到对应分组中的人数(此时所有的对象都存放在我们的全局字典中)
    NSArray *array = self.dataDic[key];
    
    return array.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    //根据不同的分组不同的row获取不同的数据对象
    NSString *key = self.dataArray[indexPath.section];
    Model *model = self.dataDic[key][indexPath.row];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellReuseId forIndexPath:indexPath];

    cell.textLabel.text = model.profile;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    switch (indexPath.row) {
        case 0:
        {
            hitTestViewController *hitTestVC = [[hitTestViewController alloc] init];
//            [self presentViewController:hitTestVC animated:YES completion:nil];
            [self.navigationController pushViewController:hitTestVC animated:YES];
        }
            
            break;
        case 1:
        {
            InputFieldViewController *inputVC = [[InputFieldViewController alloc] init];
            [self.navigationController pushViewController:inputVC animated:YES];
        }
            break;
        default:
            break;
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
