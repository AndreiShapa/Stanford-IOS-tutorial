//
//  CalculatorViewController.m
//  Calculator
//
//  Created by Mark Burns on 13/10/2012.
//  Copyright (c) 2012 Mark Burns. All rights reserved.
//

#import "CalculatorViewController.h"
#import "CalculatorBrain.h"

@interface CalculatorViewController ()
  @property (nonatomic) BOOL userIsInTheMiddleOfEnteringANumber;
  @property (nonatomic) CalculatorBrain *brain;

@end

@implementation CalculatorViewController

@synthesize brain = _brain;
@synthesize display;
@synthesize userIsInTheMiddleOfEnteringANumber;


- (CalculatorBrain *)brain{
  if(!_brain) _brain = [[CalculatorBrain alloc] init];
  
  return _brain;
}


- (IBAction)digitPressed:(UIButton *)inputButton {
  NSString * digit = [inputButton currentTitle];
  NSLog(@"User touched %@", digit);
    
  if (self.userIsInTheMiddleOfEnteringANumber){
    self.display.text = [self.display.text stringByAppendingString:digit];
  }
  else{
    self.display.text = digit;
    self.userIsInTheMiddleOfEnteringANumber = YES;

  }
  
}

- (IBAction)enterPressed
{
  [self.brain debugInfo];

  [self.brain pushOperand:[self.display.text doubleValue]];
  self.userIsInTheMiddleOfEnteringANumber = NO;
}

- (IBAction)operationPressed:(UIButton *)sender {
  
  if (self.userIsInTheMiddleOfEnteringANumber) {
    [self enterPressed];
  }
  NSString *operation = [sender currentTitle];
  NSLog(@"User pressed %@", operation);
  
  double result = [self.brain performOperation:operation];
  self.display.text = [NSString stringWithFormat:@"%g", result];
}

@end
