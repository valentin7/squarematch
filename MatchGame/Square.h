//
//  Square.h
//  MatchGame
//
//  Created by Valentin Perez on 12/30/15.
//  Copyright © 2015 Valpe Technologies. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Neighbors.h"

@interface Square : UIView

@property Neighbors *neighbors;

@property BOOL isEmpty;
@property BOOL isWall;

typedef enum colorCode
{
  BLUE,
  GREEN,
  YELLOW
} ColorCode;


@property ColorCode colorCode;


@end
