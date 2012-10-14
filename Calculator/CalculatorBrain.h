//
//  CalculatorBrain.h
//  Calculator
//
//  Created by Mark Burns on 13/10/2012.
//  Copyright (c) 2012 Mark Burns. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CalculatorBrain : NSObject
- (void)pushOperand:(double)operand;
- (double)performOperation:(NSString *)operation;
@end
