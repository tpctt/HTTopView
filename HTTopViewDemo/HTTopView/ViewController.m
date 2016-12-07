//
//  ViewController.m
//  HTTopView
//
//  Created by tim on 16/11/17.
//  Copyright © 2016年 timRabbit. All rights reserved.
//

#import "ViewController.h"
#import "HTTopView.h"

@interface ViewController ()
@property (nonatomic, strong) HTTopView *topView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.topView = [[HTTopView alloc] initWithFrame:CGRectMake(0, 0, 200, 44)];
    self.topView.mainColor = [UIColor redColor];
    [self.view addSubview:self.topView];
    
    
    
    static NSArray *titles;
    titles = @[@"趣图展业",@"热文展业" ];
    
    self.topView.topViewNumberBlock = ^NSInteger(HTTopView *view ){
        return titles.count;
    };
    
    self.topView.topViewTitleBlock = ^NSString *(HTTopView *view,NSInteger index ){
        return [titles objectAtIndex:index];
    };
    
  
    
    self.topView.topViewselectTopItemBlock = ^void(HTTopView * topView ,NSInteger index ) {
        
        NSLog(@"%ld",index);
        
    };
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
