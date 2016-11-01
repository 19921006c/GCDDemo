//
//  ViewController.m
//  GCDDemo
//
//  Created by joe on 2016/11/1.
//  Copyright © 2016年 joe. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //1.同步执行 + 串行队列  sync  + serial
//    [self test1];
    //2.同步执行 + 并行队列  sync  + concurrent
//    [self test2];
    //3.同步执行 + 主队列    sync  + main
//    [self test3];
    //4.异步执行 + 串行队列  async + serial
//    [self test4];
    //5.异步执行 + 并行队列  async + concurrent
//    [self test5];
    //6.异步执行 + 主队列    async + concurrent
//    [self test6];
}

- (void)test1 {
    //创建串行队列
    dispatch_queue_t queue = dispatch_queue_create("标识符", DISPATCH_QUEUE_SERIAL);
    
    NSLog(@"--START--");
    dispatch_sync(queue, ^{
        NSLog(@"任务1---%@", [NSThread currentThread]);
    });
    dispatch_sync(queue, ^{
        NSLog(@"任务2---%@", [NSThread currentThread]);
    });
    dispatch_sync(queue, ^{
        NSLog(@"任务3---%@", [NSThread currentThread]);
    });
    NSLog(@"--END--");
}

- (void)test2 {
    //创建并行队列
    dispatch_queue_t queue = dispatch_queue_create("标识符", DISPATCH_QUEUE_CONCURRENT);
    NSLog(@"--START--");
    dispatch_sync(queue, ^{
        NSLog(@"任务1---%@",[NSThread currentThread]);
    });
    dispatch_sync(queue, ^{
        NSLog(@"任务2---%@", [NSThread currentThread]);
    });
    dispatch_sync(queue, ^{
        NSLog(@"任务3---%@", [NSThread currentThread]);
    });
    NSLog(@"--END--");
}

- (void)test3 {
    //获取主队列
    dispatch_queue_t queue = dispatch_get_main_queue();
    
    NSLog(@"--START--");
    dispatch_sync(queue, ^{
        NSLog(@"任务1---%@",[NSThread currentThread]);
    });
    dispatch_sync(queue, ^{
        NSLog(@"任务2---%@", [NSThread currentThread]);
    });
    dispatch_sync(queue, ^{
        NSLog(@"任务3---%@", [NSThread currentThread]);
    });
    NSLog(@"--END--");
}

- (void)test4 {
    //创建串行队列
    dispatch_queue_t queue = dispatch_queue_create("标识符", DISPATCH_QUEUE_CONCURRENT);
    
    NSLog(@"--START--");
    dispatch_sync(queue, ^{
        NSLog(@"任务1---%@", [NSThread currentThread]);
    });
    dispatch_sync(queue, ^{
        NSLog(@"任务2---%@", [NSThread currentThread]);
    });
    dispatch_sync(queue, ^{
        NSLog(@"任务3---%@", [NSThread currentThread]);
    });
    NSLog(@"--END--");
}

- (void)test5 {
    //创建并行队列
    dispatch_queue_t queue = dispatch_queue_create("标识符", DISPATCH_QUEUE_CONCURRENT);
    NSLog(@"--START--");
    dispatch_async(queue, ^{
        NSLog(@"任务1---%@",[NSThread currentThread]);
    });
    dispatch_async(queue, ^{
        NSLog(@"任务2---%@", [NSThread currentThread]);
    });
    dispatch_async(queue, ^{
        NSLog(@"任务3---%@", [NSThread currentThread]);
    });
    NSLog(@"--END--");
}

- (void)test6 {
    //获取主队列
    dispatch_queue_t queue = dispatch_get_main_queue();
    
    NSLog(@"--START--");
    dispatch_async(queue, ^{
        NSLog(@"任务1---%@",[NSThread currentThread]);
    });
    dispatch_async(queue, ^{
        NSLog(@"任务2---%@", [NSThread currentThread]);
    });
    dispatch_async(queue, ^{
        NSLog(@"任务3---%@", [NSThread currentThread]);
    });
    NSLog(@"--END--");
}
@end
