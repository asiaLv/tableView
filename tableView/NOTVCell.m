//
//  NOTVCell.m
//  tableView
//
//  Created by lvAsia on 16/7/15.
//  Copyright © 2016年 answe lv. All rights reserved.
//

#import "NOTVCell.h"

@implementation NOTVCell

- (void)awakeFromNib {
    // Initialization code
    //    [self changeToEditMode:NO];
    UISwipeGestureRecognizer *swipeGes = [[UISwipeGestureRecognizer alloc] initWithTarget:self
                                                                                   action:@selector(swipeGesRecoginzed:)];
    swipeGes.direction = UISwipeGestureRecognizerDirectionLeft;
    [self addGestureRecognizer:swipeGes];
}
- (void)swipeGesRecoginzed:(UISwipeGestureRecognizer *)ges
{
    if (ges.state == UIGestureRecognizerStateEnded) {
        if (self.delegate && [self.delegate respondsToSelector:@selector(deviceTableViewCellDidEnterEditModeAtRow:)]) {
            [self.delegate deviceTableViewCellDidEnterEditModeAtRow:self.rowIndex];
        }
    }
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
