//
//  MyOrdersCell.h
//  TableViewHeaderDemo
//
//  Created by volive solutions on 15/09/18.
//  Copyright © 2018 volive solutions. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyOrdersCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIView *bgView;
@property (strong, nonatomic) IBOutlet UIImageView *oderImageView;
@property (strong, nonatomic) IBOutlet UILabel *productName;
@property (strong, nonatomic) IBOutlet UILabel *quantity_lbl;
@property (strong, nonatomic) IBOutlet UILabel *quantityStatic_lbl;
@property (strong, nonatomic) IBOutlet UILabel *statusStatic_lbl;
@property (strong, nonatomic) IBOutlet UILabel *statusDynamic_lbl;

@end
