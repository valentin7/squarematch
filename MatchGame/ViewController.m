//
//  ViewController.m
//  MatchGame
//
//  Created by Valentin Perez on 12/30/15.
//  Copyright © 2015 Valpe Technologies. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController




- (void)viewDidLoad {
  [super viewDidLoad];
  [self initialConfiguration];



  


  // Do any additional setup after loading the view, typically from a nib.



  //NSArray *row1 = [[NSArray alloc] initWithObjects: @"1", @"2", @"3", nil];
  
  //self.grid = [[NSArray alloc] initWithObjects: @"hell", nil];
}

- (void) initialConfiguration {


  Neighbors *s11Neighs = [[Neighbors alloc] init];
  s11Neighs.west = NULL;
  s11Neighs.north = NULL;
  s11Neighs.east = _s12;
  s11Neighs.south = _s21;

  _s11.isEmpty = NO;
  _s11.neighbors = s11Neighs;


  Neighbors *s12Neighs = [[Neighbors alloc] init];
  s12Neighs.west = _s11;
  s12Neighs.north = NULL;
  s12Neighs.east = _s13;
  s12Neighs.south = _s22;

  _s12.isEmpty = NO;
  _s12.neighbors = s12Neighs;



  Neighbors *s13Neighs = [[Neighbors alloc] init];
  s13Neighs.west = _s12;
  s13Neighs.north = NULL;
  s13Neighs.east = NULL;
  s13Neighs.south = _s23;

  _s13.isEmpty = NO;
  _s13.neighbors = s13Neighs;



  Neighbors *s21Neighs = [[Neighbors alloc] init];
  s21Neighs.west = NULL;
  s21Neighs.north = _s11;
  s21Neighs.east = _s22;
  s21Neighs.south = _s31;

  _s21.isEmpty = NO;
  _s21.neighbors = s21Neighs;



  Neighbors *s22Neighs = [[Neighbors alloc] init];
  s22Neighs.west = _s21;
  s22Neighs.north = _s12;
  s22Neighs.east = _s23;
  s22Neighs.south = _s32;

  _s22.isEmpty = NO;
  _s22.neighbors = s22Neighs;


  Neighbors *s23Neighs = [[Neighbors alloc] init];
  s23Neighs.west = _s22;
  s23Neighs.north = _s13;
  s23Neighs.east = NULL;
  s23Neighs.south = _s33;

  _s23.isEmpty = NO;
  _s23.neighbors = s23Neighs;


  Neighbors *s31Neighs = [[Neighbors alloc] init];
  s31Neighs.west = NULL;
  s31Neighs.north = _s21;
  s31Neighs.east = _s32;
  s31Neighs.south = NULL;

  _s31.isEmpty = NO;
  _s31.neighbors = s31Neighs;


  Neighbors *s32Neighs = [[Neighbors alloc] init];
  s32Neighs.west = _s31;
  s32Neighs.north = _s22;
  s32Neighs.east = _s33;
  s32Neighs.south = NULL;

  _s32.isEmpty = NO;
  _s32.neighbors = s32Neighs;


  Neighbors *s33Neighs = [[Neighbors alloc] init];
  s33Neighs.west = _s32;
  s33Neighs.north = _s33;
  s33Neighs.east = NULL;
  s33Neighs.south = NULL;

  _s33.neighbors = s33Neighs;
  _s33.isEmpty = YES;





}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

@end
