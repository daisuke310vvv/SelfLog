//
//  SLLogListCell.h
//  SelfLog
//
//  Created by SatoDaisuke on 12/9/14.
//  Copyright (c) 2014 SatoDaisuke. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SLLogListCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *postedDateLabel;

@end
