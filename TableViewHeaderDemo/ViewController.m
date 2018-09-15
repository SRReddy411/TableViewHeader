//
//  ViewController.m
//  TableViewHeaderDemo
//
//  Created by volive solutions on 15/09/18.
//  Copyright © 2018 volive solutions. All rights reserved.
//

#import "ViewController.h"
#import "MyOrdersCell.h"

@interface ViewController (){
    NSMutableArray *ordersArray;
    NSMutableArray *rowsArray;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSError *error;
    NSString *url_string = [NSString stringWithFormat: @"http://www.volivesolutions.com/atallah_dev/api/services/user_orders_by_date/10"];
    NSData *data = [NSData dataWithContentsOfURL: [NSURL URLWithString:url_string]];
   NSMutableDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
    ordersArray = [[NSMutableArray alloc]init];
    rowsArray = [[NSMutableArray alloc]init];
    NSArray *reject_reasons = [json objectForKey:@"orders"];
    for (NSDictionary * dic in reject_reasons){
        [ordersArray addObject:[dic objectForKey:@"date"]];
        [rowsArray addObject:[dic objectForKey:@"orders"]];
           NSLog(@"json: %@", ordersArray);
        
    }
    self.myTableView.delegate = self;
    self.myTableView.dataSource = self;
    self.myTableView.tableHeaderView.backgroundColor = [UIColor grayColor];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
     MyOrdersCell *cell = [_myTableView dequeueReusableCellWithIdentifier:@"MyOrdersCell" forIndexPath:indexPath];
    
   NSMutableDictionary *data = [[rowsArray objectAtIndex:[indexPath section]] objectAtIndex:[indexPath row]];
    
    cell.bgView.layer.cornerRadius = 8;
    cell.clipsToBounds = YES;
    cell.bgView.layer.borderWidth = 2;
    cell.bgView.layer.borderColor = [[UIColor whiteColor]CGColor];
    
    cell.productName.text = [data objectForKey:@"product_name"];
    cell.quantity_lbl.text = [data objectForKey:@"quantity"];
    NSString *status = [data objectForKey:@"order_status"];
    if ([status  isEqual: @"1"]){
        cell.statusDynamic_lbl.text = @"Delivered";
        cell.statusDynamic_lbl.textColor = [UIColor greenColor];
    }else{
        cell.statusDynamic_lbl.text = @"on the way";
        cell.statusDynamic_lbl.textColor = [UIColor redColor];
    }
     
   
  
    return cell;
}
//- (UIView *) tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
//{
//    UIView *headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, tableView.bounds.size.width, 30)];
//
//    headerView.backgroundColor = [UIColor lightGrayColor];
//
//    return headerView;
//}
- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
   return [[rowsArray objectAtIndex:section] count];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return ordersArray.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 120;
}
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return [ordersArray objectAtIndex:section];
}

@end
