//
//  HTTopView.h
//  taoqianbao
//
//  Created by tim on 16/9/8.
//  Copyright © 2016年 tim. All rights reserved.
//

#import <HTHorizontalSelectionList/HTHorizontalSelectionList.h>

static NSString * const TimCoreCachedata_prefix = @"com.fan97.HTTopView.cachedata.prefix";


@class HTTopView;

typedef void(^HTTopViewSelectItemBlock)( HTTopView  *view , NSInteger index);

typedef NSInteger(^HTTopViewNumberBlock)( HTTopView *view );

typedef NSString*(^HTTopViewTitleBlock)( HTTopView *view , NSInteger index);
typedef UIView*(^HTTopViewTitleViewBlock)( HTTopView *view , NSInteger index);
typedef NSString*(^HTTopViewBadgeValueBlock)( HTTopView *view , NSInteger index);


@interface HTTopView : HTHorizontalSelectionList


@property (copy,nonatomic) HTTopViewSelectItemBlock topViewselectTopItemBlock ;
@property (copy,nonatomic) HTTopViewNumberBlock topViewNumberBlock ;
@property (copy,nonatomic) HTTopViewTitleBlock topViewTitleBlock ;
@property (copy,nonatomic) HTTopViewTitleViewBlock topViewTitleViewBlock ;
@property (copy,nonatomic) HTTopViewBadgeValueBlock topViewBadgeValueBlock ;


@property (nonatomic, strong) UIColor *mainColor;
///是否缓存之前的 index, 目前缓存的 key 是 view 的 vc 的 class name
@property (nonatomic, assign) BOOL enableCacheIndex;

@end
