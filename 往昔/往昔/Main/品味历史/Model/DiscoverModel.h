//
//  DiscoverModel.h
//  Discover
//
//  Created by mac on 16/2/17.
//  Copyright © 2016年 Simon. All rights reserved.
//

#import "JSONModel.h"

@interface DiscoverModel : JSONModel

@property (nonatomic, copy)NSString *title;
@property (nonatomic, strong)UIImage *image;

@property (nonatomic, copy)NSString *url;
@property (nonatomic, strong)NSMutableArray *urls;

@property (nonatomic, copy)NSString *cType;
@property (nonatomic, copy)NSString *impId;
@property (nonatomic, copy)NSString *pageId;
@property (nonatomic, copy)NSString *docId;
@property (nonatomic, copy)NSString *itemId;
@property (nonatomic, copy)NSString *imageStr;

@property (nonatomic, copy)NSString *source;
@property (nonatomic, copy)NSString *date;

@end
