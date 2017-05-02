//
//  CustomAnnotationView.m
//  JZLY
//
//  Created by jyLiu on 16/10/13.
//  Copyright © 2016年 Hydom. All rights reserved.
//
#define kCalloutWidth       180.0
#define kCalloutHeight      50.0
#import "CustomAnnotationView.h"
@interface CustomAnnotationView ()<UIGestureRecognizerDelegate>
@property (nonatomic, strong, readwrite) CustomCalloutView *calloutView;
@end
@implementation CustomAnnotationView

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    if (self.selected == selected)
    {
        return;
    }
    
    if (selected)
    {
        if (self.calloutView == nil)
        {
            self.calloutView = [[CustomCalloutView alloc] initWithFrame:CGRectMake(0, 0, kCalloutWidth, kCalloutHeight)];
            self.calloutView.center = CGPointMake(CGRectGetWidth(self.bounds) / 2.f + self.calloutOffset.x,-CGRectGetHeight(self.calloutView.bounds) / 2.f + self.calloutOffset.y);
        }
        self.calloutView.subtitle = self.annotation.title;
        UITapGestureRecognizer *button = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handTap:)];
        [self.calloutView addGestureRecognizer:button];
        [self addSubview:self.calloutView];

    } else
    {
        [self.calloutView removeFromSuperview];
    }
}
- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    
    UIView *view = [super hitTest:point withEvent:event];
    
    if (view == nil) {
        
        CGPoint tempoint = [self.calloutView.rightButton convertPoint:point fromView:self];
        
        if (CGRectContainsPoint(self.calloutView.rightButton.bounds, tempoint))
            
        {
            
            view = self.calloutView.rightButton;
            
        }
        
    }
    
    return view;
    
}

-(void)handTap:(UITapGestureRecognizer*)sener{
    NSLog(@"1111111111111");
}

@end
