//
//  FrontViewController.h
//  NineViewController
//
//  Created by YuShuHui on 13-12-6.
//  Copyright (c) 2013年 鱼舒辉. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface FrontViewController : BaseViewController<UITextFieldDelegate,UIScrollViewDelegate>
{
    UIScrollView *scrollView;
    
    //  NSArray *daArr;
}
@property (strong, nonatomic) UITextField *textFil;
@property (strong, nonatomic) NSArray *cates;
@property (strong, nonatomic) NSMutableArray *subArr;
@property (strong, nonatomic) NSMutableArray *greadArr;


-(void)subCateBtnAction:(UIButton *)btn;

@end

