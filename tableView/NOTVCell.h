//
//  NOTVCell.h
//  tableView
//
//  Created by lvAsia on 16/7/15.
//  Copyright © 2016年 answe lv. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol DeviceTableViewCellDelegate <NSObject>
- (void)deviceTableViewCellDidEnterEditModeAtRow:(NSInteger)rowIndex;
@end
@interface NOTVCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *titleDownLa;
@property (weak, nonatomic) IBOutlet UILabel *titleLeftLa;

@property (weak, nonatomic) IBOutlet UILabel *titleRightLa;
@property NSInteger rowIndex;
@property (strong, nonatomic) id <DeviceTableViewCellDelegate> delegate;


@end
