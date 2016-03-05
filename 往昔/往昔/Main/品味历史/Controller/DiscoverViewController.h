//
//  DiscoverViewController.h
//  Discover
//
//  Created by mac on 16/2/17.
//  Copyright © 2016年 Simon. All rights reserved.
//

#import "BaseViewController.h"
#import "DiscoverCollectionView.h"

@interface DiscoverViewController : BaseViewController <UIGestureRecognizerDelegate, UINavigationControllerDelegate>

@property(nonatomic,weak) UIViewController* currentShowVC;

@property(nonatomic, strong)DiscoverCollectionView *collectionView;

@end
