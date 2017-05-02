//
//  CustomCalloutView.h
//  JZLY
//
//  Created by jyLiu on 16/10/13.
//  Copyright © 2016年 Hydom. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface CustomCalloutView : UIView
@property (nonatomic, copy) NSString *subtitle; //地址
@property (nonatomic, copy) UIImage *image;//定位
@property (strong, nonatomic) UIButton *rightButton;
@end
