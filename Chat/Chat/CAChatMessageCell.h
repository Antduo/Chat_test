//
//  CAChatMessageCell.h
//  Chat
//
//  Created by 魏滨涛 on 2017/5/2.
//  Copyright © 2017年 物联利浪. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CAChatMessageCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *headerImgView;
@property (weak, nonatomic) IBOutlet UILabel *nickNameLab;
@property (weak, nonatomic) IBOutlet UILabel *messageLab;

@end
