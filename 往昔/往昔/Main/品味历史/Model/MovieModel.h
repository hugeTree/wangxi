//
//  MovieModel.h
//  往昔
//
//  Created by mac on 16/2/24.
//  Copyright © 2016年 干晨威. All rights reserved.
//

#import "JSONModel.h"

@interface MovieModel : JSONModel

@property (nonatomic, copy)NSString *slot;
@property (nonatomic, copy)NSString *runtime;
@property (nonatomic, copy)NSString *name;
@property (nonatomic, copy)NSString *country;
@property (nonatomic, copy)NSString *release_date;
@property (nonatomic, copy)NSString *img;
@property (nonatomic, copy)NSString *director;
@property (nonatomic, copy)NSString *alias;
@property (nonatomic, copy)NSString *type;

@property (nonatomic, strong)NSMutableArray *actor;
@property (nonatomic, strong)NSMutableArray *writers;

@property (nonatomic, strong)NSNumber *rating;
@property (nonatomic, strong)NSNumber *rating_count;


@end
