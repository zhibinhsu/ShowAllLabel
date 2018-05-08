//
//  ViewController.m
//  LabelShowMore
//
//  Created by Admin on 2018/5/8.
//  Copyright © 2018年 Admin. All rights reserved.
//

#import "ViewController.h"
#import "YYLabel.h"
#import "NSAttributedString+YYText.h"
#import <UIKit/UIKit.h>

@interface ViewController ()

@property (nonatomic, strong) YYLabel *label;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSMutableAttributedString *text = [NSMutableAttributedString new];
    UIFont *font = [UIFont systemFontOfSize:16];
    
    // 添加文本
    NSString *title = @"dwwdqwddqdqdqdqwdqdqwdqwdqdqdqdqwdqwdqdqdqwdqdqwdqdqdqdqdqdqwdq当前的群无多群无多群无多群无多群无多群多群无多群无多群无多群无多群多群多群多群当前的群无多群多群无多群多群多群多群多群多群多群多群的权威的权威的期望多无群多群无多群多群多群多群无多群无多群无多群无多群无多群无多群多群无多群无多群多群无多群多群无多无多无群多多群无多群多群多群多群无多群多无！";
    
    [text appendAttributedString:[[NSAttributedString alloc] initWithString:title attributes:nil]];
    
    text.yy_font = font ;
    _label = [YYLabel new];
    _label.userInteractionEnabled = YES;
    _label.numberOfLines = 0;
    _label.textVerticalAlignment = YYTextVerticalAlignmentTop;
    _label.frame = CGRectMake(40, 60, self.view.frame.size.width - 80, 150);
    _label.attributedText = text;
    [self.view addSubview:_label];
    
    _label.layer.borderWidth = 0.5;
    _label.layer.borderColor = [[UIColor blueColor] CGColor];
    
    // 添加全文
    [self addSeeMoreButton];
}

#pragma mark - 添加全文
- (void)addSeeMoreButton {
    
    __weak __typeof(self) weakSelf = self;
    
    NSMutableAttributedString *text = [[NSMutableAttributedString alloc] initWithString:@"...全文"];
    
    YYTextHighlight *hi = [YYTextHighlight new];
    [hi setColor:[UIColor colorWithRed:0.578 green:0.790 blue:1.000 alpha:1.000]];
    
    hi.tapAction = ^(UIView *containerView,NSAttributedString *text,NSRange range, CGRect rect) {
        
        // 点击全文回调
        YYLabel *label = weakSelf.label;
        [label sizeToFit];
    };
    
    
    [text yy_setColor:[UIColor colorWithRed:0.000 green:0.449 blue:1.000 alpha:1.000] range:[text.string rangeOfString:@"全文"]];
    [text yy_setTextHighlight:hi range:[text.string rangeOfString:@"全文"]];
    text.yy_font = _label.font;
    
    YYLabel *seeMore = [YYLabel new];
    seeMore.attributedText = text;
    [seeMore sizeToFit];
    
    NSAttributedString *truncationToken = [NSAttributedString yy_attachmentStringWithContent:seeMore contentMode:UIViewContentModeCenter attachmentSize:seeMore.frame.size alignToFont:text.yy_font alignment:YYTextVerticalAlignmentCenter];
    
    _label.truncationToken = truncationToken;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
