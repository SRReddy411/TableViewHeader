//
//  ViewController.h
//  TableViewHeaderDemo
//
//  Created by volive solutions on 15/09/18.
//  Copyright © 2018 volive solutions. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
@property (strong, nonatomic) IBOutlet UITableView *myTableView;


@end

