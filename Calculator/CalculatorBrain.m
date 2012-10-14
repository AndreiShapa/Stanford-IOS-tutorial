//
//  CalculatorBrain.m
//  Calculator
//
//  Created by Mark Burns on 13/10/2012.
//  Copyright (c) 2012 Mark Burns. All rights reserved.
//

#import "CalculatorBrain.h"

@interface CalculatorBrain()
  @property (nonatomic, strong) NSMutableArray *operandStack;
@end


@implementation CalculatorBrain
@synthesize operandStack = _operandStack;

- (NSMutableArray *)operandStack{
  if (!_operandStack){
    _operandStack = [[NSMutableArray alloc] init];
  }
  return _operandStack;
}


- (void)pushOperand:(double)operand
{
  NSNumber *operandObject = [NSNumber numberWithDouble:operand];
  [self.operandStack addObject:operandObject];
}

- (double)popOperand
{
  NSNumber *operandObject = [self.operandStack lastObject];
  if (operandObject) [self.operandStack removeLastObject] ;
  
  return operandObject.doubleValue;
}

- (void)debugInfo
{
  for (id object in self.operandStack) {
    NSLog([object stringValue]);
  }
}

- (double)performOperation:(NSString *)operation
{
  double result = 0;
  [self debugInfo];

  if (     [@"+" isEqualToString:operation]){
    result = [self popOperand] + [self popOperand];
  }
  else if ([@"*" isEqualToString:operation]){
    result = [self popOperand] * [self popOperand];
  }
  else if ([@"/" isEqualToString:operation]){
    double divisor = [self popOperand];
      result = [self popOperand] / divisor;
  }
  else if ([@"-" isEqualToString:operation]){
    double subtrahend = [self popOperand];
    result = [self popOperand] - subtrahend;
    
  }
  
  [self pushOperand:result];
  
  return result;
}
@end
