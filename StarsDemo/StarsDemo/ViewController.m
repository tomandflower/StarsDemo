//
//  ViewController.m
//  StarsDemo
//
//  Created by tomandhua on 16/5/16.
//  Copyright © 2016年 tomandhua. All rights reserved.
//

#import "ViewController.h"
#import "TableViewCell.h"

@interface ViewController ()<UITableViewDataSource, UITableViewDelegate>
// 显示星星视图
@property (nonatomic, strong)UIView * myview1;
@property (nonatomic, strong)UIView * myview2;
@property (nonatomic, strong)UIView * myview3;

// 显示图片数组
@property (nonatomic, strong)NSMutableArray * myImageArray1;
@property (nonatomic, strong)NSMutableArray * myImageArray2;
@property (nonatomic, strong)NSMutableArray * myImageArray3;


// 显示分数
@property (nonatomic, strong)UILabel * score1;
@property (nonatomic, strong)UILabel * score2;
@property (nonatomic, strong)UILabel * score3;

// 显示进度条视图
@property (nonatomic, strong)UIView * myview4;
@property (nonatomic, strong)NSMutableArray * myImageArray4;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addSubViews];
    [self initUI];
    
}

- (void)initUI {
    _myview4 = [[UIView alloc] initWithFrame:CGRectMake(100, 250, 180, 24)];
    self.myImageArray4 = [[NSMutableArray alloc] init];
    UIImageView *imageView4;
    for (int i = 0; i < 2; i++) {
        if (i == 0) {
            imageView4 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"wathet01"]];
        } else {
            imageView4 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"red03"]];
        }
        imageView4.frame = CGRectMake(_myview4.bounds.origin.x + ((i+1)*90), _myview4.bounds.origin.y, 90, 24);
        [_myview4 addSubview:imageView4];
        [_myImageArray4 addObject:imageView4];
    }
    [self.view addSubview:_myview4];
}

#pragma mark - TableView

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
//    return self.dataArray.count;
    return 10;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier = @"mycell";
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[TableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
//    cell.textLabel.text = self.dataArray[indexPath.row][@"provinceName"];
    
    cell.selectionStyle = UITableViewCellSelectionStyleGray;
    cell.accessoryType =  UITableViewCellAccessoryDisclosureIndicator;
    return cell;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    
}


// 初始化界面
- (void)addSubViews
{
    _myview1 = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 180, 24)];
    self.myImageArray1 = [[NSMutableArray alloc] init];
    UIImageView *imageView;
    for (int i = 0; i < 5; i++) {
        imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"star01"]];
        imageView.frame = CGRectMake(_myview1.bounds.origin.x+((i+1)*24), _myview1.bounds.origin.y, 24, 24);
        [_myview1 addSubview:imageView];
        [_myImageArray1 addObject:imageView];
    }
    
    self.score1 = [[UILabel alloc] initWithFrame:(CGRectMake(6 * 24 + 5, 0, 40, 24))];
    _score1.textColor = [UIColor redColor];
    [_myview1 addSubview:_score1];
    [self.view addSubview:_myview1];
    
    _myview2 = [[UIView alloc] initWithFrame:CGRectMake(100, 140, 180, 24)];
    self.myImageArray2 = [[NSMutableArray alloc] init];
    UIImageView *imageView2;
    for (int i = 0; i < 5; i++) {
        imageView2 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"star01"]];
        imageView2.frame = CGRectMake(_myview2.bounds.origin.x+((i+1)*24), _myview2.bounds.origin.y, 24, 24);
        [_myview2 addSubview:imageView2];
        [_myImageArray2 addObject:imageView2];
    }
    
    self.score2 = [[UILabel alloc] initWithFrame:(CGRectMake(6 * 24 + 5, 0, 40, 24))];
    _score2.textColor = [UIColor redColor];
    [_myview2 addSubview:_score2];
    [self.view addSubview:_myview2];
    
    
    _myview3 = [[UIView alloc] initWithFrame:CGRectMake(100, 180, 180, 24)];
    self.myImageArray3 = [[NSMutableArray alloc] init];
    UIImageView *imageView3;
    for (int i = 0; i < 5; i++) {
        imageView3 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"star01"]];
        imageView3.frame = CGRectMake(_myview3.bounds.origin.x+((i+1)*24), _myview3.bounds.origin.y, 24, 24);
        [_myview3 addSubview:imageView3];
        [_myImageArray3 addObject:imageView3];
    }
    
    self.score3 = [[UILabel alloc] initWithFrame:(CGRectMake(6 * 24 + 5, 0, 40, 24))];
    _score3.textColor = [UIColor redColor];
    [_myview3 addSubview:_score3];
    [self.view addSubview:_myview3];

}

#pragma mark -- 点击的坐标
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint touchPoint1 = [touch locationInView:_myview1];
    CGPoint touchPoint2 = [touch locationInView:_myview2];
    CGPoint touchPoint3 = [touch locationInView:_myview3];

    UIImageView *im ;
    for(int i = 0;i < 5 ; i++){
        NSLog(@"_myImageArray[%i] = (%f,%f)",i,im.frame.origin.x,im.frame.origin.y);
        if ((touchPoint1.x > 0)&&(touchPoint1.x < 144)&&(touchPoint1.y > 0)&&(touchPoint1.y < 24)) {
            im = _myImageArray1[i];

            NSString *myscore = [NSString stringWithFormat:@"%i分",((int)touchPoint1.x/24)];
            _score1.text = myscore;//_score是一个UILable，myscore为分数，显示在给用户看，关于这个不在赘述
                        if (im.frame.origin.x > touchPoint1.x) {
                            im.image =[UIImage imageNamed:@"star01"];
                        }else{
                            im.image =[UIImage imageNamed:@"star02"];
                        }
        }
        else if ((touchPoint2.x > 0)&&(touchPoint2.x < 144)&&(touchPoint2.y > 0)&&(touchPoint2.y < 24)) {
            im = _myImageArray2[i];

            NSString *myscore = [NSString stringWithFormat:@"%i分",((int)touchPoint2.x/24)];
            _score2.text = myscore;//_score是一个UILable，myscore为分数，显示在给用户看，关于这个不在赘述
            if (im.frame.origin.x > touchPoint2.x) {
                im.image =[UIImage imageNamed:@"star01"];
            }else{
                im.image =[UIImage imageNamed:@"star02"];
            }
        }
        else if ((touchPoint3.x > 0)&&(touchPoint3.x < 144)&&(touchPoint3.y > 0)&&(touchPoint3.y < 24)) {
            im = _myImageArray3[i];

            NSString *myscore = [NSString stringWithFormat:@"%i分",((int)touchPoint3.x/24)];
            _score3.text = myscore;//_score是一个UILable，myscore为分数，显示在给用户看，关于这个不在赘述
            if (im.frame.origin.x > touchPoint3.x) {
                im.image =[UIImage imageNamed:@"star01"];
            }else{
                im.image =[UIImage imageNamed:@"star02"];
            }
        }
    }
}

#pragma mark - 滑动的坐标
-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    CGPoint touchPoint1 = [touch locationInView:_myview1];
    CGPoint touchPoint2 = [touch locationInView:_myview2];
    CGPoint touchPoint3 = [touch locationInView:_myview3];

    UIImageView *im ;
    for(int i = 0;i < 5 ; i++){
        NSLog(@"_myImageArray[%i] = (%f,%f)",i,im.frame.origin.x,im.frame.origin.y);
        if ((touchPoint1.x > 0)&&(touchPoint1.x < 144)&&(touchPoint1.y > 0)&&(touchPoint1.y < 24)) {
            im = _myImageArray1[i];

            NSString *myscore = [NSString stringWithFormat:@"%i分",((int)touchPoint1.x/24)];
            _score1.text = myscore;//_score是一个UILable，myscore为分数，显示在给用户看，关于这个不在赘述
            if (im.frame.origin.x > touchPoint1.x) {
                im.image =[UIImage imageNamed:@"star01"];
            }else{
                im.image =[UIImage imageNamed:@"star02"];
            }
        }
        if ((touchPoint2.x > 0)&&(touchPoint2.x < 144)&&(touchPoint2.y > 0)&&(touchPoint2.y < 24)) {
            im = _myImageArray2[i];

            NSString *myscore = [NSString stringWithFormat:@"%i分",((int)touchPoint2.x/24)];
            _score2.text = myscore;//_score是一个UILable，myscore为分数，显示在给用户看，关于这个不在赘述
            if (im.frame.origin.x > touchPoint2.x) {
                im.image =[UIImage imageNamed:@"star01"];
            }else{
                im.image =[UIImage imageNamed:@"star02"];
            }
        }
        if ((touchPoint3.x > 0)&&(touchPoint3.x < 144)&&(touchPoint3.y > 0)&&(touchPoint3.y < 24)) {
            im = _myImageArray3[i];

            NSString *myscore = [NSString stringWithFormat:@"%i分",((int)touchPoint3.x/24)];
            _score3.text = myscore;//_score是一个UILable，myscore为分数，显示在给用户看，关于这个不在赘述
            if (im.frame.origin.x > touchPoint3.x) {
                im.image =[UIImage imageNamed:@"star01"];
            }else{
                im.image =[UIImage imageNamed:@"star02"];
            }
        }

    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
