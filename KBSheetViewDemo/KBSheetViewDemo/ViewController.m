//
//  ViewController.m
//  KBSheetViewDemo
//
//  Created by KentonYu on 16/3/5.
//  Copyright © 2016年 KentonYu. All rights reserved.
//

#import "ViewController.h"
#import "KBSheetView.h"
@interface ViewController ()

@property (nonatomic, strong) KBSheetView *sheetView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *button = ({
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 100, 150, 50)];
        button.backgroundColor = [UIColor orangeColor];
        [button setTitle:@"Show SheetView" forState:UIControlStateNormal];
        [button addTarget:self action:@selector(p_show:) forControlEvents:UIControlEventTouchUpInside];
        button;
    });
    [self.view addSubview:button];
}

- (void)p_show:(id)sender {
    if (!self.sheetView) {
        UIView *contentView = ({
            UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 300)];
            view.backgroundColor = [UIColor blueColor];
            view;
        });
        
        self.sheetView = [[KBSheetView alloc] init];
        [self.sheetView addCustomContentView:contentView];
    }
    [self.sheetView show];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
