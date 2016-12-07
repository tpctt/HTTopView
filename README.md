# HTTopView
HTTopView 使用 block 使用 HTHorizontalSelectionList 
 

````objectivec

@implementation ViewController

- (void)viewDidLoad {
[super viewDidLoad];
// Do any additional setup after loading the view, typically from a nib.

self.topView = [[HTTopView alloc] initWithFrame:CGRectMake(0, 0, 200, 44)];
self.topView.mainColor = [UIColor redColor];
[self.view addSubview:self.topView];



static NSArray *titles;
titles = @[@"AA",@"bb" ];

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


@end

