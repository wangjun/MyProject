#ifndef PetGuLu_Constance_h
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= 70000
//UIStatusBarStyle SB=UIStatusBarStyleLightContent;
#else
//UIStatusBarStyle SB=UIStatusBarStyleBlackTranslucent
#endif
#define PetGuLu_Constance_h
#define WebServiceUri @"http://ws.gulu8.com"
#define PetDefaultImage @"PetDefault.jpg"
#define UserDefaultImage @"UserDefault.jpg"

#define PopuleColor [UIColor colorWithRed:194.0/255 green:5.0/255  blue:81.0/255 alpha:1.0f]
#define GreenColor [UIColor colorWithRed:173.0/255 green:202.0/255  blue:83.0/255 alpha:1.0f]
#define YellowColor [UIColor colorWithRed:242.0/255 green:188.0/255  blue:0.0/255 alpha:1.0f]
#define GrayColor [UIColor colorWithRed:137.0/255 green:130.0/255  blue:148.0/255 alpha:1.0f]
#define LightGrayColor [UIColor colorWithRed:236.0/255 green:236.0/255  blue:236.0/255 alpha:1.0f]
#define DEFAULT_BLUE [UIColor colorWithRed:0.0 green:122.0/255.0 blue:1.0 alpha:1.0]

#define BTNGENRAL [UIColor colorWithRed:84.0/255.0 green:188.0/255.0 blue:116.0/255 alpha:1.0]
#define BTNGENRALPRESSED [UIColor colorWithRed:60.0/255.0 green:156.0/255.0 blue:106.0/255 alpha:1.0]

#define BTNCANCEL [UIColor colorWithRed:144.0/255 green:137.0/255.0 blue:156.0/255 alpha:1.0]
#define BTNCANCELPRESSED [UIColor colorWithRed:110.0/255 green:98.0/255.0 blue:130.0/255 alpha:1.0]

#define BTNSURE [UIColor colorWithRed:204.0/255 green:70.0/255.0 blue:124.0/255 alpha:1.0]
#define BTNSUREPRESSED [UIColor colorWithRed:194.0/255 green:5.0/255.0 blue:81.0/255 alpha:1.0]

#define BTNSHARE [UIColor colorWithRed:255.0/255 green:198.0/255.0 blue:0.0 alpha:1.0]
#define BTNSHAREPRESSED [UIColor colorWithRed:255.0/255 green:156.0/255.0 blue:0.0 alpha:1.0]

#define BTNSTART [UIColor colorWithRed:204.0/255 green:69.0/255.0 blue:123.0/255 alpha:1.0]
#define BTNSTARTPRESSED [UIColor colorWithRed:194.0/255.0 green:4.0/255.0 blue:80.0/255.0 alpha:1.0]

//常量
#define VIEWWIDTH 320   //视图宽度
#define VIEWSTART 0     //视图起始坐标x
#define VIEWEND   320   //视图起始坐标y
#define NUMBERTHIRTY 30
#define NUMBERFORTY 40
#define NUMBERHUNDRED 100

//屏幕
#define DEVICE_IS_IPHONE5 ([[UIScreen mainScreen] bounds].size.height == 568)
#define DEVICE_IS_IPHONE4 ([[UIScreen mainScreen] bounds].size.height == 480)

 
/***===================================================================================**
 *                                          app 颜色常亮
 *
 ***===================================================================================**/
#define THEME_COLOR [UIColor colorWithRed:0.0/255 green:186.0/255  blue:181.0/255 alpha:1.0f]
#define PEISONG_COLOR [UIColor colorWithRed:252.0/255 green:107.0/255  blue:79.0/255 alpha:1.0f]
#define CLEAR_COLOR [UIColor colorWithRed:0.0/255 green:186.0/255  blue:181.0/255 alpha:1.0f]
#define MORNING_COLOR [UIColor colorWithRed:0.0/255 green:186.0/255  blue:181.0/255 alpha:1.0f]
#define BUTTON_COLOR [UIColor colorWithRed:246.0/255 green:140.0/255  blue:66.0/255 alpha:1.0f]
#define BACKGROUND_COLOR [UIColor colorWithRed:239.0/255 green:239.0/255  blue:246.0/255 alpha:1.0f]
#define BACKGROUND_GRAY_COLOR [UIColor colorWithRed:239.00/255 green:239.00/255 blue:244.00/255 alpha:1]
#define TABLE_ORDER_IMAGE_COLOR1 [UIColor colorWithRed:246.00/255 green:140.00/255 blue:66.00/255 alpha:1]
#define TABLE_ORDER_IMAGE_COLOR2 [UIColor colorWithRed:204.00/255 green:204.00/255 blue:204.00/255 alpha:1]

//普通app字体颜色
#define ColorFontNormal  [UIColor colorWithRed:0x66/256. green:0x66/256. blue:0x66/256. alpha:1]
//浅色app字体颜色
#define ColorFontLight  [UIColor colorWithRed:0x66/256. green:0x66/256. blue:0x66/256. alpha:1]
//鸡肉描述颜色
#define CHICKEN_COLOR [UIColor colorWithRed:250.00/255 green:124.00/255 blue:124.00/255 alpha:1];
//猪肉描述颜色
#define PIG_COLOR [UIColor colorWithRed:128.00/255 green:200.00/255 blue:255.00/255 alpha:1];
//鱼肉颜色描述
#define FISH_COLOR [UIColor colorWithRed:228.00/255 green:164.00/255 blue:255.00/255 alpha:1];
//牛肉颜色描述
#define COW_COLOR [UIColor colorWithRed:255.00/255 green:170.00/255 blue:128.00/255 alpha:1];
//蔬菜描述颜色
#define VEGETABLE_COLOR [UIColor colorWithRed:132.00/255 green:205.00/255 blue:111.00/255 alpha:1];
//描述盒子类型颜色
#define BOX_MODEL_COLOR [UIColor colorWithRed:176.00/255 green:92.00/255 blue:58.00/255 alpha:1];
#define  MESSAGETPL @"您的短信验证码为：%ld"

//各种溯源状态
//厨师烹饪
#define ORINGINL_COOKING [UIColor colorWithRed:0xFC/256. green:0x6B/256. blue:0x4F/256. alpha:1.0]
//你好早安
#define ORINGINL_MORNING [UIColor colorWithRed:0x84/256. green:0xCD/256. blue:0x6F/256. alpha:1.0]
//厨师烹饪
#define ORINGINL_TAKEN [UIColor colorWithRed:0xF6/256. green:0x8c/256. blue:0x42/256. alpha:1.0]
//厨师烹饪
#define ORINGINL_FRESH [UIColor colorWithRed:0x68/256. green:0xA5/256. blue:0xE1/256. alpha:1.0]
//厨师烹饪
#define ORINGINL_DISPATCH [UIColor colorWithRed:0x00/256. green:0xBA/256. blue:0xB5/256. alpha:1.0]
//背景
#define BACKGROUND_LIGHT_GRAY_COLOR [UIColor colorWithRed:0x99/256. green:0x99/256. blue:0x99/256. alpha:1.0]
//中餐未选中种类颜色
#define MENU_CHINESE_COLOR [UIColor colorWithRed:204.00/255 green:92.00/255 blue:93.00/255 alpha:1]
//西餐未选中种类颜色
#define MENU_WESTRN_COLOR [UIColor colorWithRed:170.00/255 green:117.00/255 blue:71.00/255 alpha:1]

//单元格选中颜色
#define CELL_SELECTED_COLOR [UIColor colorWithRed:229.0/255 green:248.0/255 blue:248.0/255 alpha:1]
//默认地址选中颜色
#define DEFAULT_ADDRESS_COLOR [UIColor colorWithRed:229.0/255 green:248.0/255 blue:248.0/255 alpha:1]
//textView字体颜色
#define DEFAULT_TEXTVIEW_FONT_COLOR [UIColor colorWithRed:177.0/255 green:177.0/255 blue:177.0/255 alpha:1]


//主题色
#define ColorTheme  [UIColor colorWithRed:0xdc/256. green:0x47/256. blue:0x1c/256. alpha:1]
#define ColorCompanyTheme  [UIColor colorWithRed:0xd4/256. green:0xa2/256. blue:0x25/256. alpha:1]
#define ColorTheme2  [UIColor colorWithRed:0xe6/256. green:0x97/256. blue:0x85/256. alpha:1]
#define BackColor [UIColor colorWithRed:245.0/255 green:245.0/255 blue:244.0/255 alpha:1]
//描述菜品属性
#define ColorFish  [UIColor colorWithRed:0xE4/256. green:0xA4/256. blue:0xFF/256. alpha:1]
#define ColorPig  [UIColor colorWithRed:0x80/256. green:0xC8/256. blue:0xFF/256. alpha:1]
#define ColorChicken  [UIColor colorWithRed:0xFA/256. green:0x7C/256. blue:0x7C/256. alpha:1]
#define ColorBeef  [UIColor colorWithRed:0xFF/256. green:0xAA/256. blue:0x80/256. alpha:1]
#define ColorVegeTable  [UIColor colorWithRed:0x84/256. green:0xCD/256. blue:0x6F/256. alpha:1]

//西餐菜品描述
#define ColorWest_Spaghetti  [UIColor colorWithRed:0xbc/256. green:0x88/256. blue:0x59/256. alpha:1]
#define ColorWest_Pizza  [UIColor colorWithRed:0xf0/256. green:0x8a/256. blue:0x58/256. alpha:1]
#define ColorWest_Gali  [UIColor colorWithRed:0xf5/256. green:0x8b/256. blue:0x8b/256. alpha:1]
//启动页背景
#define StartPageColor  [UIColor colorWithRed:0xFF/256. green:0xFC/256. blue:0xF7/256. alpha:1]
#define StartPageTextColor  [UIColor colorWithRed:0xA3/256. green:0x58/256. blue:0x34/256. alpha:1]

//默认地址背景颜色
#define AdreessDefaultBckColor  [UIColor colorWithRed:0xea/256. green:0xea/256. blue:0xeb/256. alpha:1]
//购物车背景颜色
#define DEFAULT_SHOPPING_COLOR [UIColor colorWithRed:63.0/255 green:67.0/255 blue:73.0/255 alpha:1]
//购物车总计份数背景颜色
#define DEFAULT_SHOPPING_COUNT_COLOR [UIColor colorWithRed:255.0/255 green:45.0/255 blue:75.0/255 alpha:1]
//购物车视图背景颜色
#define DEFAULT_SHOPPING_BACK_COLOR [UIColor colorWithRed:75.0/255 green:80.0/255 blue:87.0/255 alpha:1]

//字体名称
#define FONT_NAME @"STHeitiSC-Light"

//红色字体
#define FONT_COLOR_RED [UIColor colorWithRed:233.0/255 green:72.0/255 blue:25.0/255 alpha:1]

//红色字体
#define FONT_COLOR_BLACK [UIColor colorWithRed:64.0/255 green:64.0/255 blue:64.0/255 alpha:1]

//红色字体
#define FONT_COLOR_GRAY [UIColor colorWithRed:114.0/255 green:114.0/255 blue:114.0/255 alpha:1]

//溯源背景颜色数组
#define ORINGINL_COLORS [NSMutableArray arrayWithObjects:ORINGINL_MORNING,ORINGINL_TAKEN,ORINGINL_FRESH,ORINGINL_COOKING,ORINGINL_DISPATCH,ORINGINL_DISPATCH,ORINGINL_COOKING,ORINGINL_COOKING,nil]
#define ClearColor [UIColor clearColor]
#define BlackColor [UIColor blackColor]
#define WriteColor [UIColor whiteColor]

/***===================================================================================**
 *                                          服务器数据获取相关
 *
 ***===================================================================================**/

//服务器域名地址
//#define SERVICE_URL @"http://weini.im/"
#define SERVICE_URL @"http://www.jinzht.com/phone3/"//服务器域名地址
//#define SERVICE_URL @"http://www.jinzht.com:8000/phone/"//服务器域名地址
//服务器域名地址
//#define SERVICE_URL @"http://www.jinzht.com/phone/"//服务器域名地址
//#define SERVICE_URL @"http://192.168.31.236:8080/weini/"
//#define SERVICE_URL @"http://192.168.0.182:8080/weini/"
//版本更新itunes 地址
#define ITUNES_URL @"https://itunes.apple.com/us/app/jin-zhi-tou-zhong-guo-cheng/id1024857089?mt=8"
//版本更新
#define VERSION_CHECK @"LastedVersion.action"
//身份证正面
#define ID_FORE @"idfore/"
//Banner
#define BANNER_LIST @"banner/"
//微路演项目列表
#define PROJECT_LIST @"project/"
//项目详情
#define PROJECT_DETAIL @"projectdetail/"
//融资计划
#define FINANCE_PLAN @"financeplan/"
//投资人列表
#define  INVEST_LIST  @"projectinvestorlist/"
//核心团队
#define  COREMEMBER @"coremember/"
//手机验证码发送
#define  SEND_MESSAGE_CODE @"sendcode/"
//用户手机验证码登陆
#define  USER_LOGIN @"login/"
//检测用户是否已经登录
#define ISLOGIN @"issessionvalid/"
//待融资
#define WAIT_FINACE @"waitforfinance/"
//已融资
#define FINISHED_FINACE  @"finishfinance/"
//智囊团
#define THINKTANK @"thinktank/"
//平台推荐
#define RECOMMEND_PROJECT @"recommendproject/"
//用户注册
#define USER_REGIST @"register/"
//忘记密码
#define USER_FORGET_PWD @"resetpassword/"
//修改 密码
#define USER_MODIFY_PWD @"modifypassword/"
//收藏
#define COLLECTE @"collect/"
//点赞
#define PRISE @"like/"
//投票
#define VOTE  @"vote/"
//认证协议
#define INVESTOR_PROT @"investorqualification/"
//基金规模
#define FOUNSIZERANGE @"fundsizerange/"
//行业类别
#define INDUSTORY_TYPE_LIST @"industrytype/"
//投资人认证
#define AUTHENTICATE  @"authenticate/"
//上传名片
#define UPLOAD_BUINESSCARD @"businesscard/"
//上传身份证
#define PROVINCE_LIST @"idfore/"
//用户类型
#define Position_Type @"positiontype/"
//获取城市
#define MODIFY_CITY @"provincecity/"
//上传设备唯一码，极光推送
#define REG_ID @"regid/"
//添加公司
#define ADD_COMPANY @"addcompany/"
//公司信息
#define COMPANY_INFO @"companyinfo/"
//编辑公司
#define EDIT_COMPANY @"editcompany/"
//公司列表
#define COMPANY_LIST @"companylist/"
//公司状态
#define COMPANY_STATUS @"companystatus/"
//我要路演
#define ROAD_SHOW @"wantroadshow/"
//我要投资
#define INVEST @"wantinvest/"
//修改性别
#define MODFIY_GENDER @"gender/"
//真实姓名
#define MODFIY_NAME @"realname/"
//订单查询
#define MODFIY_USER_IMAGE @"userimg/"
//订单详情
#define USERINFO @"generalinformation/"
//申请退款
#define TOKEAN @"token/"
//检测是否已经认证通过
#define ISINVESTOR @"isinvestor/"
//我的身份认证信息
#define MY_INVESTID @"myinvestorlist/"
//身份认证详情
#define INVESTINFO @"investorinfo/"
//我的收藏
#define MY_COLLECT @"mycollect/"
//收藏的路演项目
#define MY_COLLECTE_ROADSHOW @"collectroadshow/"
//收藏的正在融资
#define MY_COLLECTE_FINANCING @"collectfinancing/"
//收藏的融资结束
#define MY_COLLECTE_FINANCED @"collectfinanced/"
//收藏的投资人
#define MY_COLLECTE_THINKTANK @"collectthinktank/"
//来现场
#define JOIN_ROADSHOW @"participate/"
//签到
#define ACTIVITY @"activity/"
//签到
#define SIGNIN @"signin/"
//用户基本信息
#define USERINFO @"generalinformation/"
//忌口列表
#define UPLOAD_USER_PIC @"userimg/"
//重置密码
#define RESET_PASSWORD @"resetpassword/"
//修改姓名
#define REALNAME @"realname/"
//用户性别
#define  UserGender @"gender/"
//用户类型修改
#define  UserType @"modifypositiontype/"
//检测用户是否已经登录
#define ISLOGIN @"issessionvalid/"
//我创建的项目
#define  MY_CREATE_PROJECT @"mycreateproject/"
//我投资的项目
#define MY_FINIAL_PROJECT @"myinvestproject/"
//根据日期获取菜谱
#define MY_INVEST_LIST @"myinvestorauthentication/"
//我的认证列表
#define MENUTYPELIST @"myinvestorlist/"
//核心团队成员详情
#define TEAM_DETAIL @"corememberdetail/"
//智囊团详情
#define THINK_DETAIL @"thinktankdetail/"
//微信分享
#define WEBCAT_SHARE @"shareInfoMation?userId=%@&menuId=%@"
//联系我们
#define CONTACT_US @"contactus/"
//更新版本
#define UPDATE @"checkupdate/"
//关键词
#define KEYWORD @"keyword/"
//搜索
#define PROJECT_SEARCH @"projectsearch/"
//反馈
#define  FEEDBACK @"feedback/"
//分享
#define SHARE_PROJECT @"shareproject/"
//分享
#define SHARE_APP  @"shareapp/"
//回复消息列表
#define REPLYLIST @"topiclist/"
//回复
#define TOPIC @"topic/"
//我的消息回复
#define MY_TOPIC_LIST @"topicread/"
//我的系统通知
#define MY_SYSTEM_LIST @"systeminform/"
//关于路演
#define aboutroadshow @"aboutroadshow/"
//风险
#define risk @"risk/"
//用户协议
#define useragreement @"useragreement/"
//项目协议
#define projectprotocol @"projectprotocol/"
//隐私政策
#define privacy @"privacy/"

//修改地址
#define editprovince @"provincecity/"

//检测更新
#define checkversion @"checkupdate/"

/**
 *
 *二期新三板功能
 *
 */
//新三板咨询列表
#define NEWS @"news/"
//新三板标签
#define NEWS_TYPE @"newstype/"
//知识库
#define KNOWLEDGE @"knowledge/"
//知识库标签
#define KNOWLEDGE_TAG @"knowledgetag/"
//咨询标签搜索
#define NEWS_TAG_SEARCH  @"newstagsearch/"
//咨询标题搜索
#define NEWS_SEARCH @"newssearch/"
//咨询点赞
#define NEWS_LIKE @"newslike/"
//咨询阅读量
#define NEWS_READ_COUNT @"newsreadcount/"
//咨询分享
#define NEWS_SHARE  @"sharenews/"

//我的路演申请
#define MY_ROADSHOW_APPLY @"myroadshow/"
//来现场
#define MY_PARTICATE  @"myparticipate/"
//我的认证
#define MY_AUTH @"myinvestorauthentication/"


//消息推送
//是否有新的系统通知
#define hasnewmsg @"hassysteminform/"
//系统通知列表
#define msgread @"msgread/"
//设置消息已读
#define setmsgread @"setsysteminform/"
//删除系统通知消息
#define deletemsgread @"deletesysteminform/"
//是否有消息回复
#define hasnewtopic @"hasnewtopic/"
//消息回复列表
#define topicread @"topicread/"
//设置已读
#define settopicread @"settopicread/"

//新三板更新数据
#define latestnewscount @"latestnewscount/"
//知识库更新数据
#define latestknowledgecount @"latestknowledgecount/"


//用户下载头像
//http://weini.im/upload//menuinfo//_EN_8427.jpg

//支持区域
#define ROMATE_MSG_TYPE [NSDictionary dictionaryWithObjectsAndKeys:@"projectdetail",@"0",@"msg",@"1",@"system",@"2",@"web",@"3",@"news",@"4",@"knowledge",@"5",@"roadshow",@"6",@"participate",@"7",@"investor",@"8",nil]

/***===================================================================================**
 *                                          本地缓存静态变量
 *
 ***===================================================================================**/
//用户是否第一次启动app
#define STATIC_USER_FIRST_START_APP @"isUserFirstStartApp"
//用户账号名称
#define STATIC_USER_NAME @"userName"
//用户密码
#define STATIC_USER_PASSWORD @"userPassword"
//用户Id
#define STATIC_USER_ID @"userId"
//用户
#define STATIC_USER_COUNT_DAYS @"userCountDays"
//用户头像
#define STATIC_USER_DEFAULT_PIC @"userDefaultPic"
//用户头像
#define STATIC_USER_HEADER_PIC @"userDefaultHeaderPic"
//用户性别
#define STATIC_USER_GENDER @"userGender"
//用户类别
#define STATIC_USER_TYPE @"userType"
//用户默认头像
#define  USER_DEFAULT_PIC [UIImage imageNamed:@"img_default_avatar"]
//用户是否第一次通过客户端下单
#define  STATIC_IS_USER_IFRST_ORDER @"isFirstOrder"
//用户是否打开软件时间
#define  STATIC_IS_USER_ORDER_START_TIME @"orderStartTime"
//用户通过支持区域视图选择默认地址
#define  STATIC_IS_USER_SELECT_ADDRESS  @"selectDefaultAddress"
//默认手机号码
#define  STATIC_USER_DEFAULT_DISPATCH_PHONE @"defaultphone"
//默认地址
#define  STATIC_USER_DEFAULT_DISPATCH_ADDRESS @"defaultaddress"
//设置地理位置信息
// 省份
#define LOCATION_STATE @"locationstate"
//城市
#define LOCATION_CITY @"locationcity"
//行政区域
#define LOCATION_SUBLOCALITY @"locationsublocaity"
//区域名称
#define LOCATION_NAME @"locationname"
//默认地址
#define  STATIC_USER_DEFAULT_DISPATCH_ID @"dispatchid"
//商圈id
#define STATIC_LOCATION_AREA_ID @"buessAreaId"
//行政id
#define STATIC_LOCATION_SUBLOCAITY_ID @"locationsublocaity"


#define APP_PRIVATE_KEY @"lindyang"

/***===================================================================================**
 *                                          静态数字型常量
 *
 ***===================================================================================**/
#define NAVVIEW_HEIGHT 44
#define NAVVIEW_POSITION_Y 20
#define   IOS7_NAVI_SPACE   -10
#define gestureMinimumTranslation  20.0

typedef enum : NSInteger {
    
    kCameraMoveDirectionNone,
    
    kCameraMoveDirectionUp,
    
    kCameraMoveDirectionDown,
    
    kCameraMoveDirectionRight,
    
    kCameraMoveDirectionLeft
    
} CameraMoveDirection ;

#endif
