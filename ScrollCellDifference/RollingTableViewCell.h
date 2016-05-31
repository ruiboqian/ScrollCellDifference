//
//  RollingTableViewCell.h
//  ScrollCellDifference
//
//  Created by 钱锐博 on 16/5/31.
//  Copyright © 2016年 TurboRun. All rights reserved.
//

#import <UIKit/UIKit.h>

// IMAGE_HEIGHT is higher than cell`s height

#define IMAGE_HEIGHT 300

#define IMAGE_OFFSET_SPEED 45

@interface RollingTableViewCell : UITableViewCell

// image used in the cell which will be having the parallax effect

@property (nonatomic, strong, readwrite) UIImage *bgImage;

- (void)cellOnTableView:(UITableView *)tableView didScrollOnView:(UIView *)view;

@end
