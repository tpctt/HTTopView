//
//  HTTopView.m
//  taoqianbao
//
//  Created by tim on 16/9/8.
//  Copyright © 2016年 tim. All rights reserved.
//

#import "HTTopView.h"
@interface HTTopView()<HTHorizontalSelectionListDataSource,HTHorizontalSelectionListDelegate >


@end


@implementation HTTopView
-(void)setMainColor:(UIColor *)mainColor
{
    if (_mainColor != mainColor) {
        _mainColor = mainColor;
        
    
//        [self setTitleColor:self.mainColor forState:0];
        self.selectionIndicatorColor = self.mainColor ;
        
        
    }
}
-(void)commonInit1
{
    
    self.enableCacheIndex = YES;
    
    
    
    self.dataSource = self;
    self.delegate = self;
    
    self.backgroundColor = [UIColor whiteColor];
    self.bottomTrimColor = [UIColor whiteColor];

    
    [self setTitleColor:self.mainColor forState:0];
    self.selectionIndicatorColor = self.mainColor ;
    
    
    
    self.centerButtons = 1 ;
    self.snapToCenter =  1 ;
    
    self.selectionIndicatorHeight =  1 ;
    
    
//     NSInteger selectedButtonIndex = [self getCacheIndex];
    
    
    
}
-(void)reloadData
{
    
    [super reloadData];
    
    self.selectedButtonIndex = [self getCacheIndex];
    if(self.topViewselectTopItemBlock){
//        self.topViewselectTopItemBlock(self, self.selectedButtonIndex);
    }
    
    
}
-(void)setSelectedButtonIndex:(NSInteger)selectedButtonIndex
{
    [super setSelectedButtonIndex:selectedButtonIndex];
   
    [self cacheIndex:selectedButtonIndex];

}

-(void)awakeFromNib
{
    
    [super awakeFromNib];
    
    [self commonInit1];
    
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self commonInit1];

    }
    return self;
}
- (instancetype)init
{
    self = [super init];
    if (self) {
        [self commonInit1];
    
    }
    return self;
}

#pragma mark HTHorizontalSelectionListDataSource
- (NSInteger)numberOfItemsInSelectionList:(HTHorizontalSelectionList *)selectionList
{
    if(self.topViewNumberBlock)
    {
        return self.topViewNumberBlock(self);
        
    }
    else{
        return 0;
        
    }
    
}
- (nullable NSString *)selectionList:(HTHorizontalSelectionList *)selectionList titleForItemWithIndex:(NSInteger)index
{
    if(self.topViewTitleBlock)
    {
        return self.topViewTitleBlock(self,index);
        
    }
    else{
        return nil;
    }
    
}

- (nullable NSString *)selectionList:(HTHorizontalSelectionList *)selectionList badgeValueForItemWithIndex:(NSInteger)index
{
    if(self.topViewBadgeValueBlock)
    {
        return self.topViewBadgeValueBlock(self,index);
        
    }
    else{
        return nil;
    }
}

//- (nullable UIView *)selectionList:(HTHorizontalSelectionList *)selectionList viewForItemWithIndex:(NSInteger)index
//{
//    
//    if(self.topViewTitleViewBlock)
//    {
//        return self.topViewTitleViewBlock(self,index);
//        
//    }
//    else{
//        return nil;
//    }
//}

#pragma mark HTHorizontalSelectionListDelegate
- (void)selectionList:(HTHorizontalSelectionList *)selectionList didSelectButtonWithIndex:(NSInteger)index
{
    if(_topViewselectTopItemBlock){
        _topViewselectTopItemBlock(self,index);
        
    }
    
    [self cacheIndex:index];
    
}

#pragma mark 缓存上一次的选中 index
-(NSString *)getIndexCacheKey{
    UIResponder *vc = self;
    while (1) {
        if([vc isKindOfClass:[UIViewController class]] ) break;
        vc = vc.nextResponder;
        
    }
    
    return [[TimCoreCachedata_prefix stringByAppendingPathComponent:@"HTTopIndex"] stringByAppendingPathComponent: NSStringFromClass([vc class])];
    
    return @"";
    
}
-(void)cacheIndex:(NSInteger)index
{
    [[NSUserDefaults standardUserDefaults] setInteger:index forKey:[self getIndexCacheKey]];
    [[NSUserDefaults standardUserDefaults]  synchronize];
    
}
-(NSInteger)getCacheIndex
{
    NSInteger index =  [[NSUserDefaults standardUserDefaults] integerForKey:[self getIndexCacheKey]];
    
    if (self.enableCacheIndex
         && index >= 0
         && self.dataSource
         && [self.dataSource respondsToSelector:@selector(numberOfItemsInSelectionList:)]
         && [self.dataSource numberOfItemsInSelectionList:self] > index
        
        ) {
        
        return index;
        
    }
    
    return 0;
    
    
}

@end
