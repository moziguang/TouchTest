//
//  ViewController.m
//  TouchTest
//
//  Created by qianyuan on 2019/6/26.
//  Copyright © 2019 qianyuan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property(nonatomic, strong) IBOutlet UILabel *trackLabel1;
@property(nonatomic, strong) IBOutlet UILabel *trackLabel2;
@property(nonatomic, strong) IBOutlet UILabel *trackLabel3;
@property(nonatomic, strong) IBOutlet UILabel *trackLabel4;

@end

static ViewController* sViewController;
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    sViewController = self;
    // Do any additional setup after loading the view.
}


+ (void)touchesBegan:(int)index
{
    if(index==0){
        sViewController.trackLabel1.hidden = false;
    }else if (index == 1){
        sViewController.trackLabel2.hidden = false;
    }else if (index == 2){
        sViewController.trackLabel3.hidden = false;
    }else if (index == 3){
        sViewController.trackLabel4.hidden = false;
    }
}

+ (void)touchesEnded:(int)index
{
    if(index==0){
        sViewController.trackLabel1.hidden = true;
    }else if (index == 1){
        sViewController.trackLabel2.hidden = true;
    }else if (index == 2){
        sViewController.trackLabel3.hidden = true;
    }else if (index == 3){
        sViewController.trackLabel4.hidden = true;
    }
}

@end
