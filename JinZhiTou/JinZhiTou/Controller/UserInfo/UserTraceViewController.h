//
//  UserCollecteViewController.h
//  JinZhiTou
//
//  Created by air on 15/8/8.
//  Copyright (c) 2015年 金指投. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NavView.h"
#import "UITableViewCustomView.h"
@interface UserTraceViewController : UIViewController
@property(assign,nonatomic)NSInteger currentSelected;
@property (retain, nonatomic)NavView *navView;
@property (nonatomic,assign)BOOL isEndOfPageSize;
@property(retain,nonatomic)NSMutableArray* dataArray;
@property(retain,nonatomic)NSString* titleStr;
@property (retain, nonatomic)UITableViewCustomView *tableView;
@end
