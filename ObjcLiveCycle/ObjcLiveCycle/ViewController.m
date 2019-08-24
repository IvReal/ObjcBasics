//
//  ViewController.m
//  ObjcLiveCycle
//
//  Created by Iv on 24/08/2019.
//  Copyright © 2019 Iv. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

//2. Отследить в созданном приложении все методы жизненного цикла контроллера.

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"ViewController did load");
}

- (void)viewWillAppear:(BOOL)animated {
    NSLog(@"ViewController will appear");
}

- (void)viewDidAppear:(BOOL)animated {
    NSLog(@"ViewController did appear");
}

- (void)viewWillDisappear:(BOOL)animated {
    NSLog(@"ViewController will disappear");
}

- (void)viewDidDisappear:(BOOL)animated {
    NSLog(@"ViewController did disappear");
}

@end
