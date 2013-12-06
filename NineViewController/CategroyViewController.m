//
//  CategroyViewController.m
//  FenLei100
//
//  Created by  on 12-12-5.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "CategroyViewController.h"
#import "NAMenuItem.h"
#import "DetailCategroyViewController.h"

@implementation CategroyViewController

@synthesize m_searchBar;


#pragma mark - Memory Management

- (id)init {
	self = [super init];
	
	if (self) {
        
        // tabbarItem 的图标和标题
        UITabBarItem *item1 = [[UITabBarItem alloc] initWithTitle:@"分类" image:[UIImage imageNamed:@"catogreyb.png"] tag:0];
        [item1 setFinishedSelectedImage:[UIImage imageNamed:@"catogreyb.png"] withFinishedUnselectedImage:[UIImage imageNamed:@"catogreyg.png"]];
        UIColor *color = [UIColor grayColor];
        NSValue *offset = [NSValue valueWithUIOffset:UIOffsetMake(0, -1)];
        // ios5
        NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:color,UITextAttributeTextColor,offset,UITextAttributeTextShadowOffset, nil];
        //  ios6用这个
        //NSDictionary *dict = @{UITextAttributeTextColor : color, UITextAttributeTextShadowOffset : offset};
        
        [item1 setTitleTextAttributes:dict forState:UIControlStateNormal];
        self.tabBarItem = item1;
        // 加载九宫格界面
		[self setMenuItems:[self createMenuItems]];
	}
	
	return self;
}



#pragma mark   按钮点击事件

- (void)menuView:(NAMenuView *)menuView didSelectItemAtIndex:(NSUInteger)index {
	NSAssert([self menuItems], @"You must set menuItems before attempting to load.");
    
    
	Class class = [[self.menuItems objectAtIndex:index] targetViewControllerClass];
	DetailCategroyViewController *viewController = [[class alloc] init];
	[self.navigationController pushViewController:viewController animated:YES];
    viewController.navigationItem.title = [[self.menuItems objectAtIndex:index] title];
}



#pragma mark - 创建按钮，加载界面

- (NSArray *)createMenuItems {
	NSMutableArray *items = [[NSMutableArray alloc] init];
    
    
	// First Item
	NAMenuItem *item1 = [[NAMenuItem alloc] initWithTitle:@"跳蚤市场"
													 image:[UIImage imageNamed:@"changzhoufangchan.png"]
												   vcClass:[DetailCategroyViewController class]];
	[items addObject:item1];
	
	// Second Item
	NAMenuItem *item2 = [[NAMenuItem alloc] initWithTitle:@"常州房产" 
													 image:[UIImage imageNamed:@"changzhoufangchan.png"] 
												   vcClass:[DetailCategroyViewController class]];
	[items addObject:item2];
	
	// Third Item
	NAMenuItem *item3 = [[NAMenuItem alloc] initWithTitle:@"车辆信息" 
													 image:[UIImage imageNamed:@"changzhoufangchan.png"]
												   vcClass:[DetailCategroyViewController class]];
	[items addObject:item3];
	
	// Fourth Item
	NAMenuItem *item4 = [[NAMenuItem alloc] initWithTitle:@"宠物" 
													 image:[UIImage imageNamed:@"changzhoufangchan.png"]
												   vcClass:[DetailCategroyViewController class]];
	[items addObject:item4];
	
	// Fifth Item
	NAMenuItem *item5 = [[NAMenuItem alloc] initWithTitle:@"票务卡券" 
													 image:[UIImage imageNamed:@"changzhoufangchan.png"]
												   vcClass:[DetailCategroyViewController class]];
	[items addObject:item5];
	
	// Sixth Item
	NAMenuItem *item6 = [[NAMenuItem alloc] initWithTitle:@"教育培训" 
													 image:[UIImage imageNamed:@"jiaoyupeixun.png"] 
												   vcClass:[DetailCategroyViewController class]];
	[items addObject:item6];
	
	// Seventh Item
	NAMenuItem *item7 = [[NAMenuItem alloc] initWithTitle:@"生活服务" 
													 image:[UIImage imageNamed:@"changzhoufangchan.png"]
												   vcClass:[DetailCategroyViewController class]];
	[items addObject:item7];
	
	// Eighth Item
	NAMenuItem *item8 = [[NAMenuItem alloc] initWithTitle:@"商务服务" 
													 image:[UIImage imageNamed:@"changzhoufangchan.png"]
												   vcClass:[DetailCategroyViewController class]];
	[items addObject:item8];
    
	// Ninth Item
	NAMenuItem *item9 = [[NAMenuItem alloc] initWithTitle:@"全职招聘" 
													 image:[UIImage imageNamed:@"changzhoufangchan.png"]
												   vcClass:[DetailCategroyViewController class]];
	[items addObject:item9];
    // Ten Item
	NAMenuItem *item10 = [[NAMenuItem alloc] initWithTitle:@"兼职招聘" 
                                                      image:[UIImage imageNamed:@"changzhoufangchan.png"]
                                                    vcClass:[DetailCategroyViewController class]];
	[items addObject:item10];
	
	// Eleven Item
	NAMenuItem *item11 = [[NAMenuItem alloc] initWithTitle:@"全职求职" 
                                                      image:[UIImage imageNamed:@"changzhoufangchan.png"]
                                                    vcClass:[DetailCategroyViewController class]];
	[items addObject:item11];
    
	// Twelve Item
	NAMenuItem *item12 = [[NAMenuItem alloc] initWithTitle:@"兼职求职" 
                                                      image:[UIImage imageNamed:@"changzhoufangchan.png"] 
                                                    vcClass:[DetailCategroyViewController class]];
	[items addObject:item12];
	
	return items;
}



- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}


#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
}


- (void)viewDidUnload
{
    [super viewDidUnload];

}

@end
