//
//  CustomCalloutView.m
//  JZLY
//
//  Created by jyLiu on 16/10/13.
//  Copyright © 2016年 Hydom. All rights reserved.
//

#import "CustomCalloutView.h"
#define kArrorHeight        10
#define kTitleWidth         140
#define kTitleHeight        20
#define COLOR(R, G, B, A) [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:A]
@interface CustomCalloutView()
@property (nonatomic, strong) UILabel *subtitleLabel;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIImageView *pointImge;

@end


@implementation CustomCalloutView

- (void)drawRect:(CGRect)rect
{
    
    [self drawInContext:UIGraphicsGetCurrentContext()];
    
    self.layer.shadowColor = [[UIColor blackColor] CGColor];
    self.layer.shadowOpacity = 0.2;
    self.layer.shadowOffset = CGSizeMake(0.0f, 0.0f);
    
}
- (void)drawInContext:(CGContextRef)context
{
    CGContextSetLineWidth(context, 2.0);
    CGContextSetFillColorWithColor(context, [UIColor whiteColor].CGColor);
    
    [self getDrawPath:context];
    CGContextFillPath(context);
    
}
- (void)getDrawPath:(CGContextRef)context
{
    CGRect rrect = self.bounds;
    CGFloat radius = 6.0;
    CGFloat minx = CGRectGetMinX(rrect),
    midx = CGRectGetMidX(rrect),
    maxx = CGRectGetMaxX(rrect);
    CGFloat miny = CGRectGetMinY(rrect),
    maxy = CGRectGetMaxY(rrect)-kArrorHeight;

    CGContextMoveToPoint(context, midx+kArrorHeight, maxy);
    CGContextAddLineToPoint(context,midx, maxy+kArrorHeight);
    CGContextAddLineToPoint(context,midx-kArrorHeight, maxy);
    
    CGContextAddArcToPoint(context, minx, maxy, minx, miny, radius);
    CGContextAddArcToPoint(context, minx, minx, maxx, miny, radius);
    CGContextAddArcToPoint(context, maxx, miny, maxx, maxx, radius);
    CGContextAddArcToPoint(context, maxx, maxy, midx, maxy, radius);
    CGContextClosePath(context);
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.backgroundColor = [UIColor clearColor];
        [self initSubViews];
    }
    return self;
}
- (void)initSubViews
{
    
    // 添加副标题，即商户地址
    self.subtitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(5 ,0, kTitleWidth, kTitleHeight+20)];
    self.subtitleLabel.numberOfLines = 0;//表示label可以多行显示
    self.subtitleLabel.font = [UIFont boldSystemFontOfSize:13];
    self.subtitleLabel.textColor = COLOR(51, 51, 51, 1.0);
    self.subtitleLabel.userInteractionEnabled = YES;
//    self.subtitleLabel.text = @"subtitleLabelsubtitleLabelsubtitleLabel";
    [self addSubview:self.subtitleLabel];
    
    // 添加图片，即定位样式
    self.pointImge = [[UIImageView alloc]initWithFrame:CGRectMake(self.bounds.size.width - 35, 1, 36, 36)];
    self.pointImge.userInteractionEnabled = YES;
    [self addSubview:self.pointImge];
    
    
    self.rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.rightButton.frame = self.bounds;
    [self.rightButton addTarget:self action:@selector(respondsToOn:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.rightButton];
}



- (void)setSubtitle:(NSString *)subtitle
{
    self.subtitleLabel.text = subtitle;
    self.pointImge.image = [UIImage imageNamed:@"享购_03-3"];
}

- (void)respondsToOn:(UIButton*)sender
{
    NSLog(@"4546446434364664");
}

@end
