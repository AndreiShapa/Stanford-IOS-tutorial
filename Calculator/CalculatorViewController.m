#import "CalculatorViewController.h"
#import "CalculatorBrain.h"
#import "CalculatorIo.h"

@interface CalculatorViewController ()
  @property (nonatomic) CalculatorBrain *brain;
  @property (nonatomic) CalculatorIo *calculatorIo;
@end

@implementation CalculatorViewController

@synthesize brain = _brain;
@synthesize display;
@synthesize calculatorIo = _calculatorIo;


- (CalculatorBrain *)brain{
  if(!_brain) _brain = [[CalculatorBrain alloc] init];
  
  return _brain;
}



- (CalculatorIo *)calculatorIo{
  if(!_calculatorIo) _calculatorIo = [[CalculatorIo alloc] init:self.display];
  
  return _calculatorIo;
}

- (IBAction)digitPressed:(UIButton *)inputButton {
  NSString * digit = [inputButton currentTitle];
  
  [self.calculatorIo sendDigit:digit];
}

- (void)calculate{
  [self.brain pushOperand: [self.calculatorIo readDigits]];
}

- (IBAction)enterPressed
{
  [self calculate];
}



- (IBAction)operationPressed:(UIButton *)sender {
  
  if ([self.calculatorIo inputting]) {
    [self calculate];
  }
  NSString *operation = [sender currentTitle];
  
  double result = [self.brain performOperation:operation];
 
  [self.calculatorIo set:result];
}

@end
