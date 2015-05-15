//
//  ViewController.m
//  TrayBarTest
//
//  Created by Mike Keller on 5/15/15.
//  Copyright (c) 2015 Meek Apps, LLC. All rights reserved.
//

#import "ViewController.h"
#import "TrayBar.h"

@interface ViewController ()
@property (strong, nonatomic) TrayBar *trayBarDown, *trayBarUp;
@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view, typically from a nib.
  
  CGFloat width = 30.0F;
  CGFloat height = 5.0F;
  self.trayBarDown = [[TrayBar alloc] initWithFrame:CGRectMake(self.view.bounds.size.width / 2.0F - width / 2.0F, 100.0F, width, height) color:[UIColor redColor] arrowDirection:TrayBarArrowDirectionDown];
  [self.view addSubview:self.trayBarDown];
  
  self.trayBarUp = [[TrayBar alloc] initWithFrame:CGRectMake(self.view.bounds.size.width / 2.0F - width / 2.0F, 140.0F, width, height) color:[UIColor greenColor] arrowDirection:TrayBarArrowDirectionUp];
  [self.view addSubview:self.trayBarUp];
  
  //Add tap recognizer to toggle tray view bend state.
  UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
  [self.view addGestureRecognizer:tapRecognizer];
}

- (void) handleTap:(UITapGestureRecognizer*)recognizer {
  [self.trayBarDown setBent:!self.trayBarDown.bent animated:YES];
  [self.trayBarUp setBent:!self.trayBarUp.bent animated:YES];
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

@end
