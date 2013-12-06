//
//  CategroyViewController.h
//  FenLei100
//
//  Created by  on 12-12-5.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NAMenuViewController.h"

//  继承九宫格视图

@interface CategroyViewController : NAMenuViewController<UISearchBarDelegate,UIAlertViewDelegate>{
    NSMutableArray *nameArray;    //二级分类 cell的title数组
    NSMutableArray *spellArray;   //二级分类 cell的拼音数组
}

@property (strong, nonatomic) UISearchBar *m_searchBar;

- (NSArray *)createMenuItems;
- (void)menuView:(NAMenuView *)menuView didSelectItemAtIndex:(NSUInteger)index;


@end
