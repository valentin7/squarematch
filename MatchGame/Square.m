//
//  Square.m
//  MatchGame
//
//  Created by Valentin Perez on 12/30/15.
//  Copyright © 2015 Valpe Technologies. All rights reserved.
//

#import "Square.h"

@implementation Square



- (id)initWithCoder:(NSCoder *)aDecoder {
  if ((self = [super initWithCoder:aDecoder])) {
    [self baseClassInit];
  }
  return self;
}

- (void)baseClassInit {
  self.userInteractionEnabled = YES;
  [self setGestures];

  //initialize all ivars and properties
}

- (id) initWithNeighbors: (Neighbors *) neighbors isEmpty: (BOOL) empty isWall: (BOOL) wall  colorCode: (ColorCode) color {

  if ((self = [super initWithFrame:CGRectMake(0, 0, 150, 200)])) {
    // your init stuff here
    self.neighbors = neighbors;
    self.isEmpty = empty;
    self.isWall = wall;
    self.colorCode = color;
  }

  [self setGestures];

  return self;
}


- (void) setGestures {

  NSLog(@"setting gestures");
  UISwipeGestureRecognizer *swipeEast = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipeFrom:)];
  swipeEast.direction = UISwipeGestureRecognizerDirectionRight;

  UISwipeGestureRecognizer *swipeWest = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipeFrom:)];
  swipeWest.direction = UISwipeGestureRecognizerDirectionLeft;

  UISwipeGestureRecognizer *swipeNorth = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipeFrom:)];
  swipeNorth.direction = UISwipeGestureRecognizerDirectionUp;

  UISwipeGestureRecognizer *swipeSouth = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipeFrom:)];
  swipeSouth.direction = UISwipeGestureRecognizerDirectionDown;

  [self addGestureRecognizer:swipeEast];
  [self addGestureRecognizer:swipeWest];
  [self addGestureRecognizer:swipeNorth];
  [self addGestureRecognizer:swipeSouth];

}

-(void)handleSwipeFrom:(UISwipeGestureRecognizer *)recognizer {
  //NSLog(@"Swipe received.");

  Square *toSquare;

  switch (recognizer.direction) {
    case UISwipeGestureRecognizerDirectionDown:
      toSquare = (Square *) self.neighbors.south;
      break;
    case UISwipeGestureRecognizerDirectionUp:
      toSquare = (Square *) self.neighbors.north;
      break;
    case UISwipeGestureRecognizerDirectionLeft:
      toSquare = (Square *) self.neighbors.west;
      break;
    default: // Right direction
      toSquare = (Square *) self.neighbors.east;

    break;
  }

  if (toSquare && toSquare.isEmpty) {
    [UIView animateWithDuration:0.25 delay:0.0 options:UIViewAnimationOptionCurveEaseIn animations:^{
      CGRect prevLoc = self.frame;
      self.frame = toSquare.frame;
      toSquare.frame = prevLoc;

    } completion:^(BOOL finished){
      [self updateReferencesToSquare:toSquare andDirection:recognizer.direction];
    }];


  } else {
    NSLog(@"to square is null OR NOT empty");

    if (toSquare) {
      NSLog(@"TO SQUARE EMPTY?: %@", toSquare.isEmpty);
    }
  }
}

- (void) updateSurroundersTo: (Square *) wasSurrouonded newReference: (Square *) newSquare {

  if (!wasSurrouonded.neighbors) {
    return;
  }

  if (wasSurrouonded.neighbors.north) {
    Square *surrounder = (Square *) wasSurrouonded.neighbors.north;
    surrounder.neighbors.south = newSquare;
  }
  if (wasSurrouonded.neighbors.south) {
    Square *surrounder = (Square *) wasSurrouonded.neighbors.south;
    surrounder.neighbors.north = newSquare;

  }
  if (wasSurrouonded.neighbors.east) {
    Square *surrounder = (Square *) wasSurrouonded.neighbors.east;
    surrounder.neighbors.west = newSquare;

  }
  if (wasSurrouonded.neighbors.west) {
    Square *surrounder = (Square *) wasSurrouonded.neighbors.west;
    surrounder.neighbors.east = newSquare;
  }


}

- (void) updateReferencesToSquare: (Square *) toSquare andDirection: (UISwipeGestureRecognizerDirection) direction {
  NSLog(@"updating references");
  
  // Updating self references:
  Neighbors *prevNeighbors = self.neighbors;
  [self updateSurroundersTo:self newReference:toSquare];

  self.neighbors = toSquare.neighbors;

  switch (direction) {
    case UISwipeGestureRecognizerDirectionRight:
      self.neighbors.west = toSquare;

      break;
    case UISwipeGestureRecognizerDirectionLeft:
      self.neighbors.east = toSquare;

      break;
    case UISwipeGestureRecognizerDirectionUp:
      self.neighbors.south = toSquare;

      break;
    default: // DOWN BRAHUGH
      self.neighbors.north = toSquare;
      break;
  }


  [self updateSurroundersTo:toSquare newReference:self];
  // Updating empty square references:
  toSquare.neighbors = prevNeighbors;

  switch (direction) {
    case UISwipeGestureRecognizerDirectionRight:
      toSquare.neighbors.east = self;

      break;
    case UISwipeGestureRecognizerDirectionLeft:
      toSquare.neighbors.west = self;

      break;
    case UISwipeGestureRecognizerDirectionUp:
      toSquare.neighbors.north = self;
      break;
    default: // DOWN BRAHUGH
      toSquare.neighbors.south = self;
      break;
  }



}

- (void) swipedEast {

  NSLog(@"swiped EAST");
  NSLog(@"neighbors: %@", self.neighbors);
  NSLog(@"east neigh: %@", self.neighbors.east);

  if (self.neighbors.east) {

    Square *eastSquare = (Square *) self.neighbors.east;

    if (eastSquare.isEmpty) {

      [UIView animateWithDuration:0.25 delay:0.0 options:UIViewAnimationOptionCurveEaseIn animations:^{
        self.frame = eastSquare.frame;
      } completion:^(BOOL finished){ }];

    } else {
      // nuthin cuz it's _another one_

    }
  } else {
    // nuthin cuz there isn't a square

  }

}


- (void) swipedWest {
  NSLog(@"swiped west");

  if (self.neighbors.west) {

    Square *westSquare = (Square *) self.neighbors.west;

    if (westSquare.isEmpty) {
      //[UIView anim]



    } else {
      // nuthin cuz it's _another one_

    }
  } else {
    // nuthin cuz there isn't a square
    
  }
  
}
- (void) swipedNorth {
  NSLog(@"swiped north");

  if (self.neighbors.north) {

    Square *northSquare = (Square *) self.neighbors.north;

    if (northSquare.isEmpty) {
      //[UIView anim]



    } else {
      // nuthin cuz it's _another one_

    }
  } else {
    // nuthin cuz there isn't a square
    
  }

}
- (void) swipedSouth {
  NSLog(@"swiped south");

  if (self.neighbors.south) {

    Square *southSquare = (Square *) self.neighbors.south;

    if (southSquare.isEmpty) {
      //[UIView anim]



    } else {
      // nuthin cuz it's _another one_

    }
  } else {
    // nuthin cuz there isn't a square
    
  }

}

@end
