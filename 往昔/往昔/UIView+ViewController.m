//
//  UIView+ViewController.m
//  往昔
//
//  Created by mac on 16/2/19.
//  Copyright © 2016年 干晨威. All rights reserved.
//

#import "UIView+ViewController.h"

@implementation UIView (ViewController)

- (UIViewController *)viewController {
    
    UIResponder *next = self.nextResponder;
    while (next != nil) {
        
        if ([next isKindOfClass:[UISearchController class]]) {
            
            next = next.nextResponder;
            continue;
        }
        
        if ([next isKindOfClass:[UIViewController class]]) {
            
            return (UIViewController *)next;
        }
        
        next = next.nextResponder;
    }
    
    return nil;
}

- (UISearchController *)searchController {
    
    UIResponder *next = self.nextResponder;
    while (next != nil) {
        if ([next isKindOfClass:[UISearchController class]]) {
            
            return (UISearchController *)next;
        }
        
        next = next.nextResponder;
    }
    
    return nil;
}

@end
