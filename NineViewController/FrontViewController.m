//
//  FrontViewController.m
//  NineViewController
//
//  Created by YuShuHui on 13-12-6.
//  Copyright (c) 2013年 鱼舒辉. All rights reserved.
//

#import "FrontViewController.h"

#define CP_Words_Container_Width 300
#define CP_Words_Container_Margin 5
#define CP_Words_Container_Colomes 3
#define CP_Words_Container_Rows 3
#define CP_Word_Cell_Margin 4
#define CP_Word_Cell_Size (CP_Words_Container_Width-CP_Words_Container_Margin*2-CP_Word_Cell_Margin*(CP_Words_Container_Colomes-1))/CP_Words_Container_Colomes

#define CP_Answer_Button_Tag_Offset 1000
#define CP_Word_Button_Tag_Offset 10000

@interface FrontViewController ()

@end





@implementation FrontViewController

@synthesize textFil;

@synthesize subArr;
@synthesize greadArr;




- (void)initBtnview{
    
    // Do any additional setup after loading the view.
    scrollView = [[[UIScrollView alloc] initWithFrame:CGRectMake(0, 118 + NAVIGATIONHEIGHT, 320, 460)] autorelease];
    
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.showsVerticalScrollIndicator = NO;
    scrollView.delegate = self;
    scrollView.contentSize = CGSizeMake(320, 630);
    [self.view addSubview:scrollView];
    
    
    for(int i=0; i< [subArr count] ; i++) {
        
        SubMode *mode = (SubMode *)[subArr objectAtIndex:i ];
        
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        
        [btn setBackgroundImage:[UIImage imageNamed:@"icon-bj.png"] forState:UIControlStateNormal];
        //[btn setBackgroundImage:[UIImage imageNamed:@"btn_nomal_pressed.png"] forState:UIControlStateHighlighted];
        [btn setImage:[UIImage imageNamed:@"math_1.png"] forState:UIControlStateNormal];
        
        btn.titleEdgeInsets = UIEdgeInsetsMake(5, -50, -60, 15);
        btn.imageEdgeInsets = UIEdgeInsetsMake(5, 20, 30,15);
        btn.titleLabel.font = [UIFont systemFontOfSize:13];
        
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
        btn.tag = i+CP_Word_Button_Tag_Offset;
        [btn addTarget:self action:@selector(wordButtonSelected:) forControlEvents:UIControlEventTouchUpInside];
        [btn addTarget:self action:@selector(wordButtonTouchDown:) forControlEvents:UIControlEventTouchDown];
        [btn addTarget:self action:@selector(wordButtonTouchCancel:) forControlEvents:UIControlEventTouchCancel];
        [btn addTarget:self action:@selector(wordButtonTouchUpOutside:) forControlEvents:UIControlEventTouchUpOutside];
        
        [btn setTitle:mode.aq_subject_name forState:UIControlStateNormal];
        
        
        
        CGFloat x = i%CP_Words_Container_Colomes*107;
        CGFloat y = (i/CP_Words_Container_Colomes)*107+20 ;
        
        [btn setFrame:CGRectMake(x, y, 107, 107)];
        
        [scrollView addSubview:btn];
        
        [UIView animateWithDuration:1.0 animations:^{
            
            [btn setFrame:CGRectMake(x, y, 107, 107)];
            
        } completion:^(BOOL finished){
            
            if (finished) {
                
                [UIView animateWithDuration:0.3 animations:^{
                    
                    [btn setFrame:CGRectMake(x, y, 107, 107)];
                    
                } completion:^(BOOL finished){
                    
                }];
            }
            
        }];
        
        
        
        
        
    }
    
    [self.view addSubview:scrollView];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    self.navigationController.navigationBar.hidden = YES;
    
    self.navBar.backToParentBtn.hidden = YES;
    self.navBar.titilLabel.text = @"师说堂";
    [self.request getAllSubject];
    //daArr = [[NSArray alloc] initWithObjects:@"数学",@"英语",@"语文",@"物理",@"化学",@"生物",@"地理",@"历史",@"政治", nil]
    
    UILabel *textLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 44 + NAVIGATIONHEIGHT, 320, 30)];
    textLabel.text = @"当前有321位名师在线";
    textLabel.textColor = [z_UI colorWithHexString:@"4F96CE"];
    textLabel.font = [UIFont systemFontOfSize:18];
    textLabel.textAlignment = UITextAlignmentLeft;
    textLabel.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:textLabel];
    [textLabel release];
    
    UIImageView *textImageVie = [[UIImageView alloc] initWithFrame:CGRectMake(0, 74 + NAVIGATIONHEIGHT, 320, 44)];
    textImageVie.userInteractionEnabled = YES;
    textImageVie.image = [UIImage imageNamed:@"search_bj.png"];
    [self.view addSubview:textImageVie];
    // 搜索
    textFil = [[UITextField alloc] initWithFrame:CGRectMake(30, 7, 240, 30)];
    textFil.delegate = self;
    textFil.placeholder = (@"写下你的疑问");
    textFil.keyboardType =  UIKeyboardTypeDefault;
    [textImageVie addSubview:textFil];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    // btn.titleLabel.text = @"问老师";
    [btn setImage:[UIImage imageNamed:@"teacher_banner"]  forState:UIControlStateNormal];
    
    btn.titleLabel.textColor = [UIColor blackColor];
    
    btn.frame = CGRectMake(250, 7, 64, 30);
    
    [textImageVie addSubview:btn];
    
    
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [subArr release];
    [textFil release];
    [scrollView release];
    
    [super dealloc];
}


- (void)wordButtonSelected:(id)sender
{
    NSLog(@"即将展开.");
    
    
    [self.request getAllGradeWithSubject:@"2"];
    
    
    SubCateViewController *subVc = [[[SubCateViewController alloc]
                                     initWithNibName:NSStringFromClass([SubCateViewController class])
                                     bundle:nil] autorelease];
    
    subVc.subCates = greadArr;
    // self.currentCate = cate;
    subVc.cateVC = self;
    
    UIButton *btn =( UIButton* ) sender;
    
    //   CGPoint openPoint = CGPointMake(140.0f,btn.frame.origin.y+105); //arbitrary point,x不起作用，y是展开的起始点
    
    CGPoint openPoint ;
    
    NSLog(@"%d",NAVIGATIONHEIGHT);
    
    if (IS_IPHONE_5) {
        openPoint = CGPointMake(140.0f,btn.frame.origin.y+85+NAVIGATIONHEIGHT); //arbitrary point,x不起作用，y是展开的起始点
    }else{
        openPoint = CGPointMake(140.0f,btn.frame.origin.y+85); //arbitrary point,x不起作用，y是展开的起始点
    }
    //    //展开
    [JWFolders openFolderWithContentView:subVc.view position:openPoint containerView:scrollView sender:self direction:1];
}



- (void)wordButtonTouchDown:(id)sender
{
    
    
}


- (void)wordButtonTouchCancel:(id)sender{
    //    UIButton *btn = (UIButton*)sender;
    //    [btn setBackgroundImage:[UIImage imageNamed:@"btn_nomal.png"] forState:UIControlStateNormal];
}


- (void)wordButtonTouchUpOutside:(id)sender{
    //DLog(@"yushuhuionfldkmg;ldfml");
}



-(void)subCateBtnAction:(UIButton *)btn
{
    
    XueKeListViewController *VieContro = [[XueKeListViewController alloc] init];
    
    [self.navigationController pushViewController:VieContro animated:YES];
    [VieContro release];
    
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField;
{
    postViewController *VieContro = [[postViewController alloc] init];
    
    [self.navigationController pushViewController:VieContro animated:YES];
    [VieContro release];
    return YES;
}



//所有科目请求成功
-(void)didGetAllSubject:(NSArray *)aArray{
    subArr  = [[NSMutableArray alloc] init];
    for (NSDictionary *dic in aArray) {
        
        SubMode *mode = [[SubMode alloc] init];
        mode.aq_subject_id = [dic objectForKey:@"aq_subject_id"];
        mode.aq_subject_name = [dic objectForKey:@"aq_subject_name"];
        mode.count = [dic objectForKey:@"count"];
        
        DLog(@"%@",mode.aq_subject_name);
        [subArr addObject:mode];
        [mode release];
    }
    
    [self initBtnview];
}

//请求所有年级成功
-(void)didGetGrade:(NSArray *)aArray{
    DLog(@"%@",aArray);
    
    greadArr  = [[NSMutableArray alloc] init];
    for (NSDictionary *dic in aArray) {
        
        GradeMode *mode = [[GradeMode alloc] init];
        mode.aq_grade_id = [dic objectForKey:@"aq_grade_id"];
        mode.aq_grade_name = [dic objectForKey:@"aq_grade_name"];
        mode.count = [dic objectForKey:@"count"];
        
        DLog(@"%@",mode.aq_grade_name);
        [greadArr addObject:mode];
        [mode release];
    }
    
}

@end

