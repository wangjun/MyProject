//
//  FinalViewController.m
//  JinZhiTou
//
//  Created by air on 15/7/27.
//  Copyright (c) 2015年 金指投. All rights reserved.
//

#import "FinalViewController.h"
#import "Cell.h"
#import "TDUtil.h"
#import "NavView.h"
#import "MobClick.h"
#import "HttpUtils.h"
#import "MJRefresh.h"
#import "LineLayout.h"
#import "UConstants.h"
#import "DialogUtil.h"
#import "LoadingView.h"
#import "LoadingUtil.h"
#import "GlobalDefine.h"
#import "NSString+SBJSON.h"
#import "INSViewController.h"
#import "ASIFormDataRequest.h"
#import "VoteViewController.h"
#import "ThinkTankTableViewCell.h"
#import "ThinkTankViewController.h"
#import "RoadShowDetailViewController.h"

@interface FinalViewController ()
{
    NavView* navView;
    HttpUtils* httpUtils;
    LoadingView* loadingView;
    
    BOOL isRefresh;
    int currentPage;
    int currentSelectIndex;
    BOOL isResetPosition;
    NSString* _identify;
    NSMutableArray* currentArray;
}
@property (nonatomic,assign)BOOL isEndOfPageSize;
@end
@implementation FinalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController.navigationBar setHidden:YES];
    //设置背景颜色
    self.view.backgroundColor=ColorTheme;
    
    //初始化网络对象
    httpUtils = [[HttpUtils alloc]init];
    //TabBarItem 设置
    UIImage* image=IMAGENAMED(@"btn_tourongzi_selected");
    image=[image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [self.tabBarItem setSelectedImage:image];
    [self.tabBarItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:ColorTheme,NSForegroundColorAttributeName, nil] forState:UIControlStateSelected];
    
    //设置标题
    navView=[[NavView alloc]initWithFrame:CGRectMake(0,NAVVIEW_POSITION_Y,self.view.frame.size.width,NAVVIEW_HEIGHT)];
    navView.imageView.alpha=0;
    [navView setTitle:@"金指投"];
    navView.titleLable.textColor=WriteColor;
    [navView.leftButton setImage:IMAGENAMED(@"top-caidan") forState:UIControlStateNormal];
    [navView.leftButton addTarget:self action:@selector(userInfoAction:) forControlEvents:UIControlEventTouchUpInside];
    [navView.backView addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(userInfoAction:)]];
    
    [navView.rightButton setImage:IMAGENAMED(@"sousuobai") forState:UIControlStateNormal];
    [navView.rightButton addTarget:self action:@selector(searchAction:) forControlEvents:UIControlEventTouchUpInside];
    
    
    [self.view addSubview:navView];
    
    self.finalContentTableView = [[UITableViewCustomView alloc]initWithFrame:CGRectMake(51, POS_Y(navView), WIDTH(self.view)-50, HEIGHT(self.view)-POS_Y(navView)-kBottomBarHeight-85)];
    self.finalContentTableView.backgroundColor  =WriteColor;
    [self.view addSubview:self.finalContentTableView];
    
    //分割线
    UIImageView* imgView = [[UIImageView alloc]initWithFrame:CGRectMake(50, POS_Y(navView), 1, HEIGHT(self.finalContentTableView))];
    imgView.backgroundColor = BACKGROUND_LIGHT_GRAY_COLOR;
    [self.view addSubview:imgView];
    
    self.finalFunTableView.tag=100001;
    self.finalContentTableView.tag=100002;
    self.finalFunTableView.delegate=self;
    self.finalContentTableView.delegate=self;
    self.finalFunTableView.dataSource=self;
    self.finalContentTableView.dataSource=self;
    self.finalFunTableView.backgroundColor=BackColor;
    self.finalContentTableView.backgroundColor=BackColor;
    self.finalFunTableView.separatorStyle=UITableViewCellSeparatorStyleNone;
    self.finalContentTableView.separatorStyle=UITableViewCellSeparatorStyleNone;
    float h =HEIGHT(self.finalFunTableView)/10;
    self.finalFunTableView.contentInset = UIEdgeInsetsMake(h, 0, 0, 0);
    
    [TDUtil tableView:self.finalContentTableView target:self refreshAction:@selector(refreshProject) loadAction:@selector(loadProject)];
    [self addObserver];
    //加载左侧菜单
    [self loadMenuData];
    //加载数据
    [self loadWaitFinaceData];
    
    loadingView = [LoadingUtil shareinstance:self.view];
    currentSelectIndex = 0;
    loadingView.isTransparent = NO;
    
    //添加监听
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(userInteractionEnabled:) name:@"userInteractionEnabled" object:nil];
    //添加监听
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(updateNewMessage:) name:@"updateMessageStatus" object:nil];
    
    
    [self updateNewMessage:nil];
   
    
}

-(void)updateNewMessage:(NSDictionary*)dic
{
    NSUserDefaults* dataStore = [NSUserDefaults standardUserDefaults];
    NSInteger newMessageCount = [[dataStore valueForKey:@"NewMessageCount"] integerValue];
    NSInteger systemMessageCount = [[dataStore valueForKey:@"SystemMessageCount"] integerValue];
    if (newMessageCount+systemMessageCount>0) {
        [navView setIsHasNewMessage:YES];
    }
    
}


-(void)userInteractionEnabled:(NSDictionary*)dic

{
    
    BOOL isUserInteractionEnabled = [[[dic valueForKey:@"userInfo"] valueForKey:@"userInteractionEnabled"] boolValue];
    
    self.view.userInteractionEnabled = isUserInteractionEnabled;
    
}

-(void)refreshProject
{
    isRefresh =YES;
    currentPage = 0;
    switch (currentSelectIndex) {
        case 0:
            [self loadWaitFinaceData];
            break;
        case 1:
            [self loadFinishData];
            break;
        case 2:
            [self loadThinkTank];
            break;
        case 3:
            [self loadRecommendproject];
            break;
        default:
            break;
    }
    
}

-(void)loadProject
{
    isRefresh =NO;
    if (!self.isEndOfPageSize) {
        currentPage++;
        switch (currentSelectIndex) {
            case 0:
                [self loadWaitFinaceData];
                break;
            case 1:
                [self loadFinishData];
                break;
            case 2:
                [self loadThinkTank];
                break;
            case 3:
                [self loadRecommendproject];
                break;
            default:
                break;
        }
    }else{
        [[DialogUtil sharedInstance]showDlg:self.view textOnly:@"已加载全部"];
        isRefresh =NO;
    }
}

-(void)loadMenuData
{
    NSMutableArray* dataArray=[NSMutableArray arrayWithObjects:@"融资中",@"已融资",@"智囊团",@"金推荐",nil];
    self.array=dataArray;
    
}
-(void)loadWaitFinaceData
{
    loadingView.isTransparent = YES;
    [LoadingUtil showLoadingView:self.finalContentTableView withLoadingView:loadingView];
    NSString* url = [WAIT_FINACE stringByAppendingFormat:@"%d/",currentPage];
    [httpUtils getDataFromAPIWithOps:url postParam:nil type:0 delegate:self sel:@selector(requestWaitFinaceList:)];
}

-(void)loadFinishData
{
    loadingView.isTransparent = YES;
    [LoadingUtil showLoadingView:self.finalContentTableView withLoadingView:loadingView];
    NSString* url = [FINISHED_FINACE stringByAppendingFormat:@"%d/",currentPage];
    [httpUtils getDataFromAPIWithOps:url postParam:nil type:0 delegate:self sel:@selector(requestFinishedFinaceList:)];
}

-(void)loadThinkTank
{
    loadingView.isTransparent = YES;
    [LoadingUtil showLoadingView:self.finalContentTableView withLoadingView:loadingView];
    NSString* url = [THINKTANK stringByAppendingFormat:@"%d/",currentPage];
    [httpUtils getDataFromAPIWithOps:url postParam:nil type:0 delegate:self sel:@selector(requestThinkTankFinaceList:)];
}

-(void)loadRecommendproject
{
    loadingView.isTransparent = YES;
    [LoadingUtil showLoadingView:self.finalContentTableView withLoadingView:loadingView];
    NSString* url = [RECOMMEND_PROJECT stringByAppendingFormat:@"%d/",currentPage];
    [httpUtils getDataFromAPIWithOps:url postParam:nil type:0 delegate:self sel:@selector(requestRecommendFinaceList:)];
}

-(void)loadProjectDetail:(NSMutableDictionary*)dic
{
    if (currentSelectIndex!=2) {
        RoadShowDetailViewController* controller = [[RoadShowDetailViewController alloc]init];
        controller.dic = dic;
        controller.type=1;
        controller.title = navView.title;
        [self.navigationController pushViewController:controller animated:YES];
    }else{
        ThinkTankViewController* controller = [[ThinkTankViewController alloc]init];
        controller.dic = dic;
        controller.title = navView.title;
        [self.navigationController pushViewController:controller animated:YES];
    }
    
}

-(void)addObserver
{
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(vote:) name:@"vote" object:nil];
    
}


-(void)setArray:(NSMutableArray *)array
{
    self->_array = array;
    [self.finalFunTableView reloadData];
}
-(void)userInfoAction:(id)sender
{
    [[NSNotificationCenter defaultCenter]postNotificationName:@"userInfo" object:nil];
}


-(void)searchAction:(id)sender
{
    INSViewController* controller =[[INSViewController alloc]init];
    controller.title = navView.title;
    [self.navigationController pushViewController:controller animated:YES];
}
-(void)vote:(id)sender
{
    //获取storyboard: 通过bundle根据storyboard的名字来获取我们的storyboard,
    UIStoryboard *story = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    //由storyboard根据myView的storyBoardID来获取我们要切换的视图
    VoteViewController *controller = [story instantiateViewControllerWithIdentifier:@"Vote"];
    controller.projectId = 11;
    [self.navigationController pushViewController:controller animated:YES];
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger row = indexPath.row;
    if (tableView.tag==100001) {
        FinalKindTableViewCell* Cell=(FinalKindTableViewCell*)[tableView cellForRowAtIndexPath:indexPath];
        Cell.isSelected=YES;
        
        NSIndexPath* path = [NSIndexPath indexPathForRow:0 inSection:0];
        
        //获取第一行
        FinalKindTableViewCell* cellRowAtFirst=(FinalKindTableViewCell*)[tableView cellForRowAtIndexPath:path];
        if (cellRowAtFirst.isSelected && indexPath.row!=0) {
            cellRowAtFirst.isSelected =NO;
        }
        
        currentPage = 0;
        currentSelectIndex=(int)row;
        switch (row) {
            case 0:
                if (!self.waitFinialDataArray) {
                    [self loadWaitFinaceData];
                }else{
                    currentArray = self.waitFinialDataArray;
                    [self.finalContentTableView reloadData];
                }
                break;
            case 1:
                if (!self.finishedFinialDataArray) {
                    [self loadFinishData];
                }else{
                    isRefresh = YES;
                    currentArray = self.finishedFinialDataArray;
                    [self.finalContentTableView reloadData];
                }
                break;
            case 2:
                if (!self.thinkTankFinialDataArray) {
                    [self loadThinkTank];
                }else{
                    currentArray = self.thinkTankFinialDataArray;
                    [self.finalContentTableView reloadData];
                }
                break;
            case 3:
                if (!self.recommendFinialDataArray) {
                    [self loadRecommendproject];
                }else{
                    currentArray = self.recommendFinialDataArray;
                    [self.finalContentTableView reloadData];
                }
                break;
            default:
                if (!self.waitFinialDataArray) {
                    [self loadWaitFinaceData];
                }else{
                    currentArray = self.waitFinialDataArray;
                    [self.finalContentTableView reloadData];
                }
                break;
        }
        
    }else{
        //此处获取项目id
        [self loadProjectDetail:currentArray[row]];
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView.tag!=100001) {
        if (currentSelectIndex!=2) {
            return 190;
        }
        return 150;
    }
    return 60;
}
-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView.tag==100001) {
        FinalKindTableViewCell* Cell=(FinalKindTableViewCell*)[tableView cellForRowAtIndexPath:indexPath];
        Cell.isSelected=NO;
    }
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (tableView.tag==100001) {
        return 4;
    }
    if (currentArray.count==0) {
        self.finalContentTableView.isNone =YES;
    }else{
        self.finalContentTableView.isNone =NO;
    }
    return currentArray.count;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView.tag==100001) {
        static NSString *CustomCellIdentifier = @"CustomCellIdentifier";
        FinalKindTableViewCell *Cell =(FinalKindTableViewCell*)[tableView dequeueReusableCellWithIdentifier:CustomCellIdentifier];
        if (!Cell) {
            Cell =(FinalKindTableViewCell*)[[FinalKindTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CustomCellIdentifier];
        }
        
        if (indexPath.row==0) {
            Cell.isSelected=YES;
        }
        Cell.lblFunName.text=self.array[indexPath.row];
        Cell.selectionStyle=UITableViewCellSelectionStyleNone;
        return Cell;
        
    }else{
        NSInteger row =indexPath.row;
        if (currentSelectIndex!=2) {
            static NSString *reuseIdetify = @"FinialListView";
            FinalContentTableViewCell *cellInstance = (FinalContentTableViewCell*)[tableView dequeueReusableCellWithIdentifier:reuseIdetify];
            if (!cellInstance) {
                cellInstance = [[FinalContentTableViewCell alloc]initWithFrame:CGRectMake(0, 0, WIDTH(self.finalContentTableView), 190)];
            }
            NSDictionary* dic = currentArray[row];
            NSURL* url = [NSURL URLWithString:[dic valueForKey:@"thumbnail"]];
            __block FinalContentTableViewCell* cell = cellInstance;
            [cellInstance.imgView sd_setImageWithURL:url placeholderImage:IMAGENAMED(@"loading") completed:^(UIImage* image,NSError* error,SDImageCacheType cacheType,NSURL* imageUrl){
                if (image) {
                    cell.imgView.contentMode = UIViewContentModeScaleAspectFill;
                }
            }];
            cellInstance.title = [dic valueForKey:@"company_name"];
            NSMutableArray* arry  =[dic valueForKey:@"industry_type"];
            cellInstance.content = [dic valueForKey:@"project_summary"];
            cellInstance.priseData = [[dic valueForKey:@"like_sum"] integerValue];
            cellInstance.collectionData = [[dic valueForKey:@"collect_sum"] integerValue];
            
            NSString* str=@"";
            str = [str stringByAppendingFormat:@"%@/",[dic valueForKey:@"province"]];
            str = [str stringByAppendingFormat:@"%@/",[dic valueForKey:@"city"]];
            for (int i = 0; i< arry.count; i++) {
                str = [str stringByAppendingFormat:@"%@/",arry[i]];
            }
            
            cellInstance.typeDescription = str;
            cellInstance.selectionStyle=UITableViewCellSelectionStyleNone;
            tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
            return cellInstance;

        }else{
            static NSString *reuseIdetify = @"FinialThinkView";
            ThinkTankTableViewCell *cellInstance = (ThinkTankTableViewCell*)[tableView dequeueReusableCellWithIdentifier:reuseIdetify];
            if (!cellInstance) {
                float height =[self tableView:tableView heightForRowAtIndexPath:indexPath];
                cellInstance = [[ThinkTankTableViewCell alloc]initWithFrame:CGRectMake(0, 0, WIDTH(self.finalContentTableView), height)];
            }
            NSDictionary* dic = currentArray[row];
            NSURL* url = [NSURL URLWithString:[dic valueForKey:@"thumbnail"]];
            __block ThinkTankTableViewCell* cell = cellInstance;
            [cellInstance.imgView sd_setImageWithURL:url placeholderImage:IMAGENAMED(@"loading") completed:^(UIImage* image,NSError* error,SDImageCacheType cacheType,NSURL* imageUrl){
                if (image) {
                    cell.imgView.contentMode = UIViewContentModeScaleAspectFill;
                }
            }];
            cellInstance.title = [dic valueForKey:@"name"];
            cellInstance.content = [dic valueForKey:@"company"];
            cellInstance.typeDescription =  [dic valueForKey:@"title"];;
            cellInstance.selectionStyle=UITableViewCellSelectionStyleNone;
            tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
            return cellInstance;

        }

    }
    
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    // 禁用 iOS7 返回手势
    if ([self.navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        if (self.navigationController.interactivePopGestureRecognizer.enabled) {
            self.navigationController.interactivePopGestureRecognizer.enabled = NO;
        }
        
    }
}


-(void)setWaitFinialDataArray:(NSMutableArray *)waitFinialDataArray
{
    self->_waitFinialDataArray  = waitFinialDataArray;
    currentArray = self.waitFinialDataArray;
    [self.finalContentTableView reloadData];
}

-(void)setFinishedFinialDataArray:(NSMutableArray *)finishedFinialDataArray
{
    self->_finishedFinialDataArray = finishedFinialDataArray;
    currentArray = self.finishedFinialDataArray;
    [self.finalContentTableView reloadData];
}

-(void)setThinkTankFinialDataArray:(NSMutableArray *)thinkTankFinialDataArray
{
    self->_thinkTankFinialDataArray = thinkTankFinialDataArray;
    currentArray = self.thinkTankFinialDataArray;
    [self.finalContentTableView reloadData];
}

-(void)setRecommendFinialDataArray:(NSMutableArray *)recommendFinialDataArray
{
    self->_recommendFinialDataArray = recommendFinialDataArray;
    currentArray = self.recommendFinialDataArray;
    [self.finalContentTableView reloadData];
}
#pragma ASIHttpRequest
//待融资
-(void)requestWaitFinaceList:(ASIHTTPRequest*)request
{
    NSString* jsonString =[TDUtil convertGBKDataToUTF8String:request.responseData];
    NSLog(@"返回:%@",jsonString);
    
    NSDictionary* jsonDic = [jsonString JSONValue];
    if (jsonDic!=nil) {
        NSString* status =[jsonDic valueForKey:@"status"];
        if([status intValue] == 0 || [status intValue] ==-1){
            if (isRefresh) {
                self.waitFinialDataArray = [jsonDic valueForKey:@"data"];
            }else{
                if (self.waitFinialDataArray) {
                    [self.waitFinialDataArray addObjectsFromArray:[jsonDic valueForKey:@"data"]];
                    [self.finalContentTableView reloadData];
                }else{
                    self.waitFinialDataArray = [jsonDic valueForKey:@"data"];
                }
            }
            
            if ([status intValue] == -1 ){
                [[DialogUtil sharedInstance]showDlg:self.view textOnly:[jsonDic valueForKey:@"msg"]];
            }
        }
        [LoadingUtil closeLoadingView:loadingView];
        if (isRefresh) {
            [self.finalContentTableView.header endRefreshing];
        }else{
            [self.finalContentTableView.footer endRefreshing];
        }
        self.finalContentTableView.content = [jsonDic valueForKey:@"msg"];
    }
}

//已融资
-(void)requestFinishedFinaceList:(ASIHTTPRequest*)request
{
    NSString* jsonString =[TDUtil convertGBKDataToUTF8String:request.responseData];
    NSLog(@"返回:%@",jsonString);
    
    NSDictionary* jsonDic = [jsonString JSONValue];
    if (jsonDic!=nil) {
        NSString* status =[jsonDic valueForKey:@"status"];
        if([status intValue] == 0 || [status intValue] ==-1){
            if (isRefresh) {
                self.finishedFinialDataArray = [jsonDic valueForKey:@"data"];
            }else{
                if (self.finishedFinialDataArray) {
                    [self.finishedFinialDataArray addObjectsFromArray:[jsonDic valueForKey:@"data"]];
                    [self.finalContentTableView reloadData];
                }else{
                    self.finishedFinialDataArray = [jsonDic valueForKey:@"data"];
                }
               
            }
            if ([status intValue] == -1 ){
                [[DialogUtil sharedInstance]showDlg:self.view textOnly:[jsonDic valueForKey:@"msg"]];
            }
        }
        [LoadingUtil closeLoadingView:loadingView];
        if (isRefresh) {
            [self.finalContentTableView.header endRefreshing];
        }else{
            [self.finalContentTableView.footer endRefreshing];
        }
self.finalContentTableView.content = [jsonDic valueForKey:@"msg"];
    }
}
//智囊团
-(void)requestThinkTankFinaceList:(ASIHTTPRequest*)request
{
    NSString* jsonString =[TDUtil convertGBKDataToUTF8String:request.responseData];
    NSLog(@"返回:%@",jsonString);
    
    NSDictionary* jsonDic = [jsonString JSONValue];
    if (jsonDic!=nil) {
        NSString* status =[jsonDic valueForKey:@"status"];
        if([status intValue] == 0 || [status intValue] ==-1){
            if (isRefresh) {
                self.thinkTankFinialDataArray = [jsonDic valueForKey:@"data"];
            }else{
                if (self.thinkTankFinialDataArray) {
                    [self.thinkTankFinialDataArray addObjectsFromArray:[jsonDic valueForKey:@"data"]];
                    [self.finalContentTableView reloadData];
                }else{
                    self.thinkTankFinialDataArray = [jsonDic valueForKey:@"data"];
                }
            }
            if ([status intValue] == -1 ){
                [[DialogUtil sharedInstance]showDlg:self.view textOnly:[jsonDic valueForKey:@"msg"]];
            }
        }
        [LoadingUtil closeLoadingView:loadingView];
        if (isRefresh) {
            [self.finalContentTableView.header endRefreshing];
        }else{
            [self.finalContentTableView.footer endRefreshing];
        }
        
self.finalContentTableView.content = [jsonDic valueForKey:@"msg"];
    }
}
//平台推荐
-(void)requestRecommendFinaceList:(ASIHTTPRequest*)request
{
    NSString* jsonString =[TDUtil convertGBKDataToUTF8String:request.responseData];
    NSLog(@"返回:%@",jsonString);
    
    NSDictionary* jsonDic = [jsonString JSONValue];
    if (jsonDic!=nil) {
        NSString* status =[jsonDic valueForKey:@"status"];
        if([status intValue] == 0 || [status intValue] ==-1){
            if (isRefresh) {
                self.recommendFinialDataArray = [jsonDic valueForKey:@"data"];
            }else{
                if (self.recommendFinialDataArray) {
                    [self.recommendFinialDataArray addObjectsFromArray:[jsonDic valueForKey:@"data"]];
                    [self.finalContentTableView reloadData];
                }else{
                    self.recommendFinialDataArray = [jsonDic valueForKey:@"data"];
                }
                
            }
            if ([status intValue] == -1 ){
                [[DialogUtil sharedInstance]showDlg:self.view textOnly:[jsonDic valueForKey:@"msg"]];
            }
        }
        [LoadingUtil closeLoadingView:loadingView];
        if (isRefresh) {
            [self.finalContentTableView.header endRefreshing];
        }else{
            [self.finalContentTableView.footer endRefreshing];
        }
        self.finalContentTableView.content = [jsonDic valueForKey:@"msg"];

    }
}
//项目详情
-(void)requestProjectDetail:(ASIHTTPRequest *)request{
    NSString *jsonString = [TDUtil convertGBKDataToUTF8String:request.responseData];
    NSLog(@"返回:%@",jsonString);
    NSMutableDictionary* jsonDic = [jsonString JSONValue];
    
    if(jsonDic!=nil)
    {
        NSString* status = [jsonDic valueForKey:@"status"];
        if ([status intValue] == 0 || [status intValue] == -1) {
            
        }
        self.finalContentTableView.content = [jsonDic valueForKey:@"msg"];
        
        [LoadingUtil closeLoadingView:loadingView];
        [[DialogUtil sharedInstance]showDlg:self.view textOnly:[jsonDic valueForKey:@"msg"]];
        if (isRefresh) {
            [self.finalContentTableView.header endRefreshing];
        }else{
            [self.finalContentTableView.footer endRefreshing];
        }

    }
}

-(void)requestFailed:(ASIHTTPRequest *)request
{
    
}
-(void)dealloc
{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}



- (void)viewWillAppear:(BOOL)animated { [super viewWillAppear:animated];
    
    [MobClick beginLogPageView:navView.title];
}

- (void)viewWillDisappear:(BOOL)animated { [super viewWillDisappear:animated];
    
    [MobClick beginLogPageView:navView.title];
}

@end
