//
//  ViewController.m
//  PieMenu
//
//  Created by Z on 2018/3/19.
//  Copyright © 2018年 Z. All rights reserved.
//

#import "ViewController.h"

#define centerX   120
#define centerY   400
#define banjin    80
#define btnHW     60

@interface ViewController ()

@property (nonatomic, strong) NSMutableArray *btnArray;
@property (nonatomic, strong) UIView *backView;
@property (nonatomic, strong) UIButton *closeBtn;

@end

@implementation ViewController

- (NSMutableArray *)btnArray {
    if (!_btnArray) {
        _btnArray = [NSMutableArray array];
    }
    return _btnArray;
}


- (void)viewDidLoad {
    [super viewDidLoad];

    [self addCenterBtn];
}


- (void)addCenterBtn {
    UIButton *centerBtn = [[UIButton alloc]init];
    centerBtn.frame =CGRectMake(centerX, centerY , btnHW , btnHW);
    [centerBtn setBackgroundImage:[UIImage imageNamed:@"like_01"] forState:UIControlStateNormal
     ];
    [centerBtn addTarget:self action:@selector(openMenu) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:centerBtn];
}


//打开菜单
- (void)openMenu {
    
    if (!self.btnArray) {
        return;
    } else {
        _backView = [[UIView alloc] initWithFrame:self.view.bounds];
        _backView.backgroundColor = [UIColor blackColor];
        _backView.alpha = 0.1;
        [_backView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewClick)]];
        [self.view addSubview:_backView];
        
        _closeBtn = [[UIButton alloc] init];
        _closeBtn.frame = CGRectMake(centerX, centerY, btnHW, btnHW);
        [_closeBtn addTarget:self action:@selector(closeMenu) forControlEvents:UIControlEventTouchUpInside];
        [_closeBtn setBackgroundImage:[UIImage imageNamed:@"like_01"] forState:UIControlStateNormal];
        [_backView addSubview:_closeBtn];
        
        [_backView addSubview:[self addBtnWitnImage:@"like_01" tag:1]];
        [_backView addSubview:[self addBtnWitnImage:@"like_02" tag:2]];
        [_backView addSubview:[self addBtnWitnImage:@"like_03" tag:3]];
        [_backView addSubview:[self addBtnWitnImage:@"like_04" tag:4]];
        [_backView addSubview:[self addBtnWitnImage:@"like_05" tag:5]];
        [_backView addSubview:[self addBtnWitnImage:@"like_06" tag:6]];
        
        [UIView animateWithDuration:0.3f animations:^{
            _backView.alpha = 0.5;
            
            UIButton *btn1 = _btnArray[0];
            btn1.alpha = 1;
            btn1.frame = CGRectMake(centerX - (banjin * sinf(60 * M_PI / 180)), centerY - (banjin * cosf(60 * M_PI / 180)), btnHW, btnHW);
            [btn1 addTarget:self action:@selector(pressSubBtn:) forControlEvents:UIControlEventTouchUpInside];
            
            UIButton *btn2 = _btnArray[1];
            btn2.frame = CGRectMake(centerX, centerY - banjin, btnHW, btnHW);
            [btn2 addTarget:self action:@selector(pressSubBtn:) forControlEvents:UIControlEventTouchUpInside];
            
            UIButton *btn3 = _btnArray[2];
            btn3.frame = CGRectMake(centerX + (banjin * sinf(60 * M_PI / 180)), centerY - (banjin * cosf(60 * M_PI / 180)), btnHW, btnHW);
            [btn3 addTarget:self action:@selector(pressSubBtn:) forControlEvents:UIControlEventTouchUpInside];
            
            UIButton *btn4 = _btnArray[3];
            btn4.frame = CGRectMake(centerX - (banjin * sinf(60 * M_PI / 180)), centerY + (banjin * cosf(60 * M_PI / 180)), btnHW, btnHW);
            [btn4 addTarget:self action:@selector(pressSubBtn:) forControlEvents:UIControlEventTouchUpInside];
            
            UIButton *btn5 = _btnArray[4];
            btn5.frame = CGRectMake(centerX, centerY + banjin, btnHW, btnHW);
            [btn5 addTarget:self action:@selector(pressSubBtn:) forControlEvents:UIControlEventTouchUpInside];
            
            UIButton *btn6 = _btnArray[5];
            btn6.frame = CGRectMake(centerX + (banjin * sinf(60 * M_PI / 180)), centerY + (banjin * cosf(60 * M_PI / 180)), btnHW, btnHW);
            [btn6 addTarget:self action:@selector(pressSubBtn:) forControlEvents:UIControlEventTouchUpInside];
        }];
        
    }
}
    
    //添加动画子按钮
- (UIButton *)addBtnWitnImage:(NSString *)image tag:(int)tag {
    UIButton *btn = [[UIButton alloc]init];
    [btn setBackgroundImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    btn.frame = CGRectMake(centerX, centerY, 60, 60);
    btn.tag = tag;
    [_btnArray addObject:btn];
    return btn;
    
}
//关闭圆盘按钮
- (void)closeMenu {
    
    [UIView animateWithDuration:0.3f animations:^{
        _backView.alpha = 0;
        UIButton *btn1 = _btnArray[0];
        btn1.frame = CGRectMake(centerX ,centerY, btnHW, btnHW);
        UIButton *btn2 = _btnArray[1];
        btn2.frame = CGRectMake(centerX ,centerY, btnHW, btnHW);
        UIButton *btn3 = _btnArray[2];
        btn3.frame = CGRectMake(centerX ,centerY, btnHW, btnHW);
        UIButton *btn4 = _btnArray[3];
        btn4.frame = CGRectMake(centerX ,centerY, btnHW, btnHW);
        UIButton *btn5 = _btnArray[4];
        btn5.frame = CGRectMake(centerX ,centerY, btnHW, btnHW);
        UIButton *btn6 = _btnArray[5];
        btn6.frame = CGRectMake(centerX ,centerY, btnHW, btnHW);
    } completion:^(BOOL finished) {
        [_btnArray removeAllObjects];
        [_backView removeFromSuperview];
        [_closeBtn removeFromSuperview];
    }];
}


//此处处理点击事件
- (void)pressSubBtn:(UIButton *)pressBtn {
    switch (pressBtn.tag) {
        case 1:
            NSLog(@"点击1");
            break;
        case 2:
            NSLog(@"点击2");
            break;
        case 3:
            NSLog(@"点击3");
            break;
        case 4:
            NSLog(@"点击4");
            break;
        case 5:
            NSLog(@"点击5");
            break;
        case 6:
            NSLog(@"点击6");
            break;
    }
}

//关闭背景
- (void)viewClick {
    [self closeMenu];
}






@end
