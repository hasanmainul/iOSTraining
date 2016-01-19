//
//  ViewController.m
//  Hypnosister
//
//  Created by Md Mainul Haque on 1/18/16.
//  Copyright © 2016 Md Mainul Haque. All rights reserved.
//

#import "ViewController.h"
#import "HypnosisView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    
    //CGRect firstFrame = CGRectMake(160, 240, 100, 150);
//    CGRect firstFrame = self.view.bounds;
//    
//    HypnosisView *firstView = [[HypnosisView alloc] initWithFrame:firstFrame];
//    //firstView.backgroundColor = [UIColor redColor];
//    //[self.view setBackgroundColor:[UIColor redColor]];
//    
//    [self.view addSubview:firstView];
    
//    HypnosisView *x = [[HypnosisView alloc] init];
//    NSLog(@"%d", [firstView sum2:5 secondArgument:74]);
    
    
//    CGRect secondFrame = CGRectMake(20, 30, 50, 50);
//    HypnosisView *secondView = [[HypnosisView alloc] initWithFrame:secondFrame];
//    secondView.backgroundColor = [UIColor blueColor];
//    [firstView addSubview:secondView];
    
//    NSArray *arr = [[NSArray alloc] initWithArray:self.view.subviews];
//    for (UIView *subview in arr)
//    {
//        NSLog(@"hello %@", subview.class);
//    }
    
 
    CGRect screenRect = self.view.bounds;
    CGRect bigRect = screenRect;
    //bigRect.size.height *= 2.0;
    bigRect.size.width *= 2.0;
    
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:screenRect];
    scrollView.pagingEnabled = YES;
    [self.view addSubview:scrollView];
    
    HypnosisView *hypnosisView = [[HypnosisView alloc] initWithFrame:screenRect];
    [scrollView addSubview:hypnosisView];
    
    // Add a second screen-sized hypnosis view just off screen to the right
    screenRect.origin.x += screenRect.size.width;
    HypnosisView *anotherView = [[HypnosisView alloc] initWithFrame:screenRect];
    [scrollView addSubview:anotherView];
    
    scrollView.contentSize = bigRect.size;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
