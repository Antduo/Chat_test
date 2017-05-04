//
//  CAChatMessageCell.m
//  Chat
//
//  Created by Saltedfish on 2017/5/2.
//  Copyright © 2017年 物联利浪. All rights reserved.
//

#import "CAChatMessageCell.h"

@implementation CAChatMessageCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    [self layoutIfNeeded];
    
    self.headerImgView.layer.cornerRadius = self.headerImgView.frame.size.width*0.5;
    self.headerImgView.layer.masksToBounds = YES;
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
