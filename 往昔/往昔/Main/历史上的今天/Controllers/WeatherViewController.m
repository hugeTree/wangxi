//
//  WeatherViewController.m
//  往昔
//
//  Created by 干晨威 on 16/2/20.
//  Copyright © 2016年 干晨威. All rights reserved.
//

/*
 2016-02-23 08:39:49.574 往昔[1911:630080] PBRequester failed with Error Error Domain=NSURLErrorDomain Code=-1001 "The request timed out." UserInfo={NSErrorFailingURLStringKey=https://gsp13-cn.ls.apple.com/localshift, _kCFStreamErrorCodeKey=-2102, NSErrorFailingURLKey=https://gsp13-cn.ls.apple.com/localshift, NSLocalizedDescription=The request timed out., _kCFStreamErrorDomainKey=4, NSUnderlyingError=0x14597020 {Error Domain=kCFErrorDomainCFNetwork Code=-1001 "The request timed out." UserInfo={_kCFStreamErrorCodeKey=-2102, NSErrorFailingURLStringKey=https://gsp13-cn.ls.apple.com/localshift, NSErrorFailingURLKey=https://gsp13-cn.ls.apple.com/localshift, NSLocalizedDescription=The request timed out., _kCFStreamErrorDomainKey=4}}}
 2016-02-23 08:39:49.576 往昔[1911:629931] An error occurred = Error Domain=kCLErrorDomain Code=2 "(null)"
 */

#import "WeatherViewController.h"
#import "BaseTabBarController.h"
#import "TodayViewController.h"
#import "WeatherView.h"
#import <CoreLocation/CoreLocation.h>
#import "TodayWeatherModel.h"
#import "FutureWeatherModel.h"
#import "LifeModel.h"
#import "MBProgressHUD.h"

@interface WeatherViewController () <CLLocationManagerDelegate>
{
    WeatherView *_weatherView;
    
    UIImageView *_bkgImgView;
    
    CLLocationManager *_locationManager;
    
    NSString *_cityStr;
    
    MBProgressHUD *hud;
}

@end

@implementation WeatherViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"查天气";
    self.view.backgroundColor = [UIColor whiteColor];
    
    _bkgImgView = [[UIImageView alloc] initWithFrame:self.view.bounds];
    _bkgImgView.image = [UIImage imageNamed:@"sunny.jpeg"];
    
    [self.view addSubview:_bkgImgView];
    
    [self createWeatherView];
    
    [self createWeatherHeadView];
    
    [self initializeLocationService];
    
    self.navigationItem.hidesBackButton = YES;
    
    
    

    [self createBackButton];
}

- (void)loadData
{
    
    NSString *urlString = @"http://op.juhe.cn/onebox/weather/query";
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    manager.responseSerializer = [AFJSONResponseSerializer serializerWithReadingOptions:NSJSONReadingMutableContainers];
    
    NSDictionary *params = @{
                             @"cityname" : _cityStr,
                             @"key" : @"f9ad657017d3636330660d7e48f4df78"
                             };
    
    
    [manager GET:urlString parameters:params progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//                NSLog(@"请求成功\n%@",responseObject);
//                NSArray *result = responseObject[@"result"];
        //        NSDictionary *dic = result[0];
        //        NSString *str = dic[@"des"];
        //        NSLog(@"%@",str);
        
        [self loadDataFinish:responseObject];
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"请求失败\n%@",error);
    }];
}

- (void)loadDataFinish:(id)responseObject
{
    NSDictionary *resultDic = responseObject[@"result"];
    NSDictionary *dataDic = resultDic[@"data"];
//    NSLog(@"dataDic = %@",dataDic);
    //今日信息
    TodayWeatherModel *todayWeatherModel = [[TodayWeatherModel alloc] init];
    
    NSDictionary *todayDic = dataDic[@"realtime"];
    todayWeatherModel.nongli = todayDic[@"moon"];
    todayWeatherModel.date = todayDic[@"date"];
    todayWeatherModel.cityName = todayDic[@"city_name"];
//    todayWeatherModel.weekDay = todayDic[@"week"];
    switch ([todayDic[@"week"] integerValue])
    {
        case 1:
            todayWeatherModel.weekDay = @"周一";
            break;
        case 2:
            todayWeatherModel.weekDay = @"周二";
            break;
        case 3:
            todayWeatherModel.weekDay = @"周三";
            break;
        case 4:
            todayWeatherModel.weekDay = @"周四";
            break;
        case 5:
            todayWeatherModel.weekDay = @"周五";
            break;
        case 6:
            todayWeatherModel.weekDay = @"周六";
            break;
        case 7:
            todayWeatherModel.weekDay = @"周日";
            break;
        default:
            break;
    }
    
    NSDictionary *windDic = todayDic[@"wind"];
//    NSLog(@"windDic = %@",windDic);
    todayWeatherModel.windDirect = windDic[@"direct"];
    todayWeatherModel.windPower = windDic[@"power"];
    
    NSDictionary *todayWeatherDic = todayDic[@"weather"];
    todayWeatherModel.humidity = todayWeatherDic[@"humidity"];
    todayWeatherModel.temperature = todayWeatherDic[@"temperature"];
    todayWeatherModel.weatherInfo = todayWeatherDic[@"info"];
    
    NSDictionary *pm25Dic = dataDic[@"pm25"];
    NSDictionary *pm25DetailDic = pm25Dic[@"pm25"];
    todayWeatherModel.pm25 = pm25DetailDic[@"pm25"];
    todayWeatherModel.airQuality = pm25DetailDic[@"quality"];
    
//    NSLog(@"%@",todayWeatherModel);
    
    NSMutableArray *todayArr = [NSMutableArray array];
    [todayArr addObject:todayWeatherModel];
    
//    NSLog(@"todayArr = %@", todayArr);
    
    self.todayDataArr = todayArr;
    
//    NSLog(@"weatherView.todayDataArr = %@",_weatherView.todayDataArr);
    
    //未来信息
    NSArray *futureWeatherArr = dataDic[@"weather"];
    //舍去第一个数据（即今日数据）
    for (int i = 1; i < futureWeatherArr.count; i++)
    {
        FutureWeatherModel *futureWeatherModel = [[FutureWeatherModel alloc] init];
        
        NSDictionary *oneDayDic = futureWeatherArr[i];
        futureWeatherModel.date = oneDayDic[@"date"];
        futureWeatherModel.week = oneDayDic[@"week"];
        futureWeatherModel.nongliDate = oneDayDic[@"nongli"];
        
        NSDictionary *infoDic = oneDayDic[@"info"];
        
        NSArray *dawnArr = infoDic[@"dawn"];
        futureWeatherModel.dawnWeatherInfo = dawnArr[1];
        futureWeatherModel.dawnTemperature = dawnArr[2];
        futureWeatherModel.dawnWindDirect = dawnArr[3];
        futureWeatherModel.dawnWindPower = dawnArr[4];
        
        NSArray *dayArr = infoDic[@"day"];
        futureWeatherModel.dayWeatherInfo = dayArr[1];
        futureWeatherModel.dayTemperature = dayArr[2];
        futureWeatherModel.dayWindDirect = dayArr[3];
        futureWeatherModel.dayWindPower = dayArr[4];
        
        NSArray *nightArr = infoDic[@"night"];
        futureWeatherModel.nightWeatherInfo = nightArr[1];
        futureWeatherModel.nightTemperature = nightArr[2];
        futureWeatherModel.nightWindDirect = nightArr[3];
        futureWeatherModel.nightWindPower = nightArr[4];
        
//        NSLog(@"futureModel = %@",futureWeatherModel);
        
        [_weatherView.futureDataArr addObject:futureWeatherModel];
    }
    
    //生活信息
    NSDictionary *lifeDic = dataDic[@"life"];
    NSDictionary *lifeInfoDic = lifeDic[@"info"];
    
    LifeModel *lifeModel = [[LifeModel alloc] init];
    lifeModel.kongtiao = lifeInfoDic[@"kongtiao"];
    lifeModel.yundong = lifeInfoDic[@"yundong"];
    lifeModel.ziwaixian = lifeInfoDic[@"ziwaixian"];
    lifeModel.ganmao = lifeInfoDic[@"ganmao"];
    lifeModel.xiche = lifeInfoDic[@"xiche"];
    lifeModel.wuran = lifeInfoDic[@"wuran"];
    lifeModel.chuanyi = lifeInfoDic[@"chuanyi"];
    
//    NSLog(@"lifeModel = %@",lifeModel);
    
    [_weatherView.lifeDataArr addObject:lifeModel];
    
    [hud hideAnimated:YES afterDelay:0.3];
    
    [_weatherView reloadData];
}

- (void)createLocationManager
{
    _locationManager = [[CLLocationManager  alloc] init];
}

- (void)createWeatherView
{
    _weatherView = [[WeatherView alloc] initWithFrame:self.view.bounds];
    
    [self.view addSubview:_weatherView];
}

- (void)setTodayDataArr:(NSMutableArray *)todayDataArr
{
    if (_todayDataArr != todayDataArr)
    {
        _todayDataArr = todayDataArr;
        
        TodayWeatherModel *todayWeatherModel = _todayDataArr[0];
        
        _weatherHeadView.todayWeatherModel = todayWeatherModel;
        
        NSLog(@"weatherHeadView.todayWeatherModel = %@",_weatherHeadView.todayWeatherModel);
    }
}

//初始化定位服务
- (void)initializeLocationService {
    
    if ([CLLocationManager locationServicesEnabled]) {
        NSLog(@"定位服务已开启");
        
        // 初始化定位管理器
        _locationManager = [[CLLocationManager alloc] init];
        // 设置代理
        _locationManager.delegate = self;
        // 设置定位精确度到十米
        _locationManager.desiredAccuracy = kCLLocationAccuracyBest;
        // 设置过滤器为无
        _locationManager.distanceFilter = kCLDistanceFilterNone;
        // 开始定位
        // 取得定位权限，有两个方法，取决于你的定位使用情况
        // 一个是requestAlwaysAuthorization，一个是requestWhenInUseAuthorization
        [_locationManager requestAlwaysAuthorization];//这句话ios8以上版本使用。
        [_locationManager startUpdatingLocation];
        
        hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        hud.label.text = @"正在定位";
    }else
    {
        NSLog(@"请手动开启定位服务");
    }
    
}

- (void)createWeatherHeadView
{
    _weatherHeadView = [[WeatherHeadView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 300)];
    _weatherHeadView.tag = 101;
    
    [self.view insertSubview:_weatherHeadView belowSubview:_weatherView];
}

//创建自定义返回按钮
- (void)createBackButton
{
    UIButton *backButton = [[UIButton alloc] initWithFrame:CGRectMake(10, 20, 40, 40)];
    [backButton setImage:[UIImage imageNamed:@"item-back-white@2x.png"] forState:UIControlStateNormal];
    [backButton addTarget:self action:@selector(backButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:backButton];
    
}

- (void)backButtonAction:(UIButton *)button
{
    [self.navigationController popViewControllerAnimated:YES];
}

//view将要显示时隐藏标签栏和导航栏上的选择日期按钮
- (void)viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBar.hidden = YES;
    
    BaseTabBarController *baseTabBarController = (BaseTabBarController *)[UIApplication sharedApplication].keyWindow.rootViewController;
    
    [baseTabBarController hideTabBar];
    
    TodayViewController *todayViewController = [UIApplication sharedApplication].keyWindow.rootViewController.childViewControllers[0].childViewControllers[0];
    
    todayViewController.chooseDateButton.hidden = YES;
    
}

//view将要消失时显示标签栏和导航栏上的选择日期按钮
- (void)viewWillDisappear:(BOOL)animated
{
    self.navigationController.navigationBar.hidden = NO;
    
    BaseTabBarController *baseTabBarController = (BaseTabBarController *)[UIApplication sharedApplication].keyWindow.rootViewController;
    
    [baseTabBarController showTabBar];
    
    TodayViewController *todayViewController = [UIApplication sharedApplication].keyWindow.rootViewController.childViewControllers[0].childViewControllers[0];
    
    todayViewController.chooseDateButton.hidden = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma - mark CLLocationManager Delegate
-(void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    
}

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    //将经度显示到label上
    NSLog(@"longitude = %lf",newLocation.coordinate.longitude);
//    self.longitude.text = [NSString stringWithFormat:@"%lf", newLocation.coordinate.longitude];
    //将纬度现实到label上
    NSLog(@"latitude = %lf",newLocation.coordinate.latitude);
//    self.latitude.text = [NSString stringWithFormat:@"%lf", newLocation.coordinate.latitude];
    // 获取当前所在的城市名
    CLGeocoder *geocoder = [[CLGeocoder alloc] init];
    
    NSLog(@"new:%@",newLocation);
    NSLog(@"old:%@",oldLocation);
    
    //根据经纬度反向地理编译出地址信息
    [geocoder reverseGeocodeLocation:newLocation completionHandler:^(NSArray *array, NSError *error){
        if (array.count > 0){
            CLPlacemark *placemark = [array objectAtIndex:0];
            //将获得的所有信息显示到label上
            NSLog(@"location = %@",placemark.name);
//            self.location.text = placemark.name;
            //获取城市
            NSString *city = placemark.locality;
            if (!city) {
                //四大直辖市的城市信息无法通过locality获得，只能通过获取省份的方法来获得（如果city为空，则可知为直辖市）
                city = placemark.administrativeArea;
            }
            NSLog(@"city = %@", city);
            
//            static dispatch_once_t onceToken;
//
//            dispatch_once(&onceToken, ^{
//                if (_cityStr != city)
//                {
//                    _cityStr = city;
//                    
//                    [self loadData];
//                }
//            });
            
            if (_cityStr != city)
            {
                _cityStr = city;
                
                [self loadData];
            }
        }
        else if (error == nil && [array count] == 0)
        {
            NSLog(@"No results were returned.");
            NSLog(@"赞不支持当前城市");
        }
        else if (error != nil)
        {
            NSLog(@"An error occurred = %@", error);
        }
    }];
    //系统会一直更新数据，直到选择停止更新，因为我们只需要获得一次经纬度即可，所以获取之后就停止更新
    [manager stopUpdatingLocation];
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
