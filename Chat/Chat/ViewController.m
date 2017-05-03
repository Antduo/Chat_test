//
//  ViewController.m
//  Chat
//
//  Created by 魏滨涛 on 2017/5/2.
//  Copyright © 2017年 物联利浪. All rights reserved.
//

#import "ViewController.h"
#import "CAChatMessageCell.h"
#import "CAChatMyMessageCell.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic,strong) NSMutableArray *messageListArray;
@property (weak, nonatomic) IBOutlet UITextField *messageTF;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _messageListArray = [[NSMutableArray alloc]initWithArray:@[@"在哪里举办活动?",@"地点:重庆市南岸区天府街一号广场",@"是九点集合不?",@"是的,礼拜六早上九点集合",@"活动举办到什么时候结束",@"预计大概晚上8点钟结束",@"好的,知道了,谢谢"]];
    
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    [self.tableView registerNib:[UINib nibWithNibName:@"CAChatMessageCell" bundle:nil] forCellReuseIdentifier:@"CAChatMessageCell"];
    [self.tableView registerNib:[UINib nibWithNibName:@"CAChatMyMessageCell" bundle:nil] forCellReuseIdentifier:@"CAChatMyMessageCell"];
    
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 44;
    

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.05 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:_messageListArray.count-1 inSection:0];
        [self.tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionBottom animated:YES];
    });

}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _messageListArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row%2 == 0) {
        CAChatMessageCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CAChatMessageCell"];
        
        cell.messageLab.text = _messageListArray[indexPath.row];
        
        
        return cell;
    }
    

    CAChatMyMessageCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CAChatMyMessageCell"];
    cell.messageLab.text = _messageListArray[indexPath.row];
    return cell;
}

- (IBAction)sendMessage:(UIButton *)sender {
    
    [_messageListArray addObject:self.messageTF.text];
    
    [self.tableView reloadData];
    
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:_messageListArray.count-1 inSection:0];
    [self.tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionBottom animated:NO];
    
    
}


@end
