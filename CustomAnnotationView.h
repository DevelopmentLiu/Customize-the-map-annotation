//
//  CustomAnnotationView.h
//  JZLY
//
//  Created by jyLiu on 16/10/13.
//  Copyright © 2016年 Hydom. All rights reserved.
//

#import <MAMapKit/MAMapKit.h>
#import "CustomCalloutView.h"
@interface CustomAnnotationView : MAAnnotationView
@property (nonatomic, readonly) CustomCalloutView *calloutView;
@end
