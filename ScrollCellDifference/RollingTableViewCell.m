//
//  RollingTableViewCell.m
//  ScrollCellDifference
//
//  Created by 钱锐博 on 16/5/31.
//  Copyright © 2016年 TurboRun. All rights reserved.
//

#import "RollingTableViewCell.h"

@interface RollingTableViewCell ()

@property (nonatomic, strong, readwrite) UIImageView *bgImageView;

@end

@implementation RollingTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self setupImageView];
    }
    
    return self;
}

#pragma mark - Setup Method
- (void)setupImageView
{
    // clip subviews
    self.clipsToBounds = YES;
    
    // add image subview
    self.bgImageView = [[UIImageView alloc] initWithFrame:CGRectMake(self.bounds.origin.x, self.bounds.origin.y, [UIScreen mainScreen].bounds.size.width, IMAGE_HEIGHT)];
    self.bgImageView.contentMode = UIViewContentModeScaleAspectFill;
    self.bgImageView.clipsToBounds = NO;
    [self addSubview:self.bgImageView];
}

#pragma mark - Setters

- (void)setBgImage:(UIImage *)bgImage
{
    self.bgImageView.image = bgImage;
}

- (void)cellOnTableView:(UITableView *)tableView didScrollOnView:(UIView *)view {
    
    //偏移量
    CGFloat cellOffset = tableView.contentOffset.y - self.frame.origin.y;
    
    CGFloat yOffset = (cellOffset / IMAGE_HEIGHT) * IMAGE_OFFSET_SPEED;
    
    CGRect frame = self.bgImageView.bounds;
    self.bgImageView.frame = CGRectOffset(frame, 0, yOffset);
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
