//
//  TodayModel.h
//  往昔
//
//  Created by 干晨威 on 16/2/6.
//  Copyright © 2016年 干晨威. All rights reserved.
//

//#import <Foundation/Foundation.h>
#import "JSONModel.h"

@interface TodayModel : JSONModel

@property (nonatomic, copy) NSString *_id;  //事件id

@property (nonatomic, copy) NSString *title;  //事件title

@property (nonatomic, copy) NSString *des;  //事件子标题

@property (nonatomic, assign) long year;  //事件年份

@property (nonatomic, assign) long month;  //月份

@property (nonatomic, assign) long day;  //日

@property (nonatomic, copy) NSString *pic;  //图片地址

@end
