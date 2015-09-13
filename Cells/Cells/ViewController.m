//
//  ViewController.m
//  Cells
//
//  Created by brother on 15/8/11.
//  Copyright (c) 2015年 brother. All rights reserved.
//

#import "ViewController.h"
#import "BYTableViewCell.h"

static NSString *CellTabelIdentifier = @"CellTabelIdentifier";

@interface ViewController ()

@property (copy, nonatomic) NSArray *computers;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.computers = @[@{@"Name":@"MacBook Air",@"Color":@"Sliver"},
                       @{@"Name":@"MacBook Pro",@"Color":@"Sliver"},
                       @{@"Name":@"MacBook",@"Color":@"Sliver"},
                       @{@"Name":@"iMac",@"Color":@"Sliver"},
                       @{@"Name":@"Mac Pro",@"Color":@"Black"},];
    
    UITableView *tabelView = (id)[self.view viewWithTag:1]; //寻找表视图
//    [tabelView registerClass:[BYTableViewCell class] forCellReuseIdentifier:CellTabelIdentifier]; //注册自定义表单元类
    
    tabelView.rowHeight = 65;
    UINib *nib = [UINib nibWithNibName:@"BYTableViewCell" bundle:nil];
    [tabelView registerNib:nib forCellReuseIdentifier:CellTabelIdentifier];
    
    UIEdgeInsets contentInset = tabelView.contentInset;
    contentInset.top = 40;
    [tabelView setContentInset:contentInset];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.computers count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    BYTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellTabelIdentifier forIndexPath:indexPath];
    NSDictionary *rowData = self.computers[indexPath.row];
    
    cell.name = rowData[@"Name"];
    cell.color = rowData[@"Color"];
    
    return cell;
}

@end
