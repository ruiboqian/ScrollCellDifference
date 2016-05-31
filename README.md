# ScrollCellDifference
滚动时添加imageView的视觉差 

It provides a parallax effect on a `UIImageView` on a `UITableViewCell` when the table scrolls.

This project is to create a parallax effect on a `UIImageView` on a `UITableViewCell` when the table scrolls.


![image](https://github.com/TurboRun/ScrollCellDifference/raw/master/ScrollCellDifference/imageCell.gif)

#### On your `UITableViewCell`

  1、Add the `imageView` inside the `UITableViewCell` with `clipsToBounds = YES`. `IMAGE_HEIGHT` is higher than cell`s height.
  
  2、Add this function to calculate the image offset when the `UITableView` scrolls.

    - (void)cellOnTableView:(UITableView *)tableView didScrollOnView:(UIView *)view {`
    
        CGFloat cellOffset = tableView.contentOffset.y - self.frame.origin.y;
    
        CGFloat yOffset = (cellOffset / IMAGE_HEIGHT) * IMAGE_OFFSET_SPEED;
    
        CGRect frame = self.bgImageView.bounds;
        
        self.bgImageView.frame = CGRectOffset(frame, 0, yOffset);
    }
    

#### On your `UITableViewDelegate` add this function

    - (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
        // Get visible cells on table view.
        NSArray *visibleCells = [self.tableView visibleCells];
    
        for(RollingTableViewCell *cell in visibleCells) {
            [cell cellOnTableView:self.tableView didScrollOnView:self.view];
        }
    }
    
    
#### That is all
