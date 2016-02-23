//
//  ViewController.h
//  MatchGame
//
//  Created by Valentin Perez on 12/30/15.
//  Copyright © 2015 Valpe Technologies. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Square.h"

@interface ViewController : UIViewController


@property NSArray *grid;

@property (strong, nonatomic) IBOutlet Square *s11;

@property (strong, nonatomic) IBOutlet Square *s12;

@property (strong, nonatomic) IBOutlet Square *s13;

@property (strong, nonatomic) IBOutlet Square *s21;

@property (strong, nonatomic) IBOutlet Square *s31;

@property (strong, nonatomic) IBOutlet Square *s22;

@property (strong, nonatomic) IBOutlet Square *s32;

@property (strong, nonatomic) IBOutlet Square *s23;

@property (strong, nonatomic) IBOutlet Square *s33;

@end

