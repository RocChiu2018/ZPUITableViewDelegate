//
//  ViewController.m
//  tableView的代理方法
//
//  Created by apple on 16/5/17.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController

#pragma mark ————— 生命周期 —————
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    /**
     如果不在cellForRowAtIndexPath方法中撰写创建新的原生的cell的代码的话就应该在此处撰写相关的注册代码，提示系统如果在缓存池中找不到具有相同标识符的cell的话就应该创建新的原生的cell。
     */
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
}

#pragma mark ————— UITableViewDataSource —————
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 30;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    cell.textLabel.text = [NSString stringWithFormat:@"test - %zd", indexPath.row];
    
    return cell;
}

/**
 设置指定section的头部标题（字符串）
 */
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return @"这是头部";
}

/**
 设置指定section的尾部标题（字符串）
 */
-(NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
    return @"这是尾部";
}

#pragma mark ————— UITableViewDelegate —————
/**
 选中某一行的时候会调用这个方法
 */
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"click - %zd", indexPath.row);
}

/**
 取消选中某一行的时候会调用这个方法：
 首先用户会点击某个cell，这个时候系统会调用didSelectRowAtIndexPath方法，当用户点击其他的cell的时候，系统会先调用这个方法取消选中之前的cell，然后才会调用didSelectRowAtIndexPath方法。
 */
-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"deselect - %zd", indexPath.row);
}

/**
 设置cell的高度：
 这个方法与UITableView控件的rowHeight属性的区别是：这个方法可以把每个cell设置成不同的高度，而rowHeight属性只能把每个cell设置成相同的高度；
 这个方法会被频繁地调用。
 */
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row % 2 == 0)
    {
        return 100;
    }else
    {
        return 50;
    }
}

/**
 设置指定section的头部高度
 */
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 50;
}

/**
 设置指定section的尾部高度
 */
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 50;
}

/**
 设置指定section的头部视图
 */
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    return [UIButton buttonWithType:UIButtonTypeInfoLight];
}

/**
 设置指定section的尾部视图
 */
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    return [UIButton buttonWithType:UIButtonTypeContactAdd];
}

#pragma mark ————— UIScrollViewDelegate —————
/**
 因为<UITableViewDelegate>协议也符合<UIScrollViewDelegate>协议，所以在代码中可以直接调用<UIScrollViewDelegate>协议里面的这个方法来监听UITableView控件的滚动。
 */
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    NSLog(@"UITableView控件正在滚动");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
