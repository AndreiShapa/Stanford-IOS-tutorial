#import "CalculatorViewController.h"
#import "CalculatorBrain.h"
#import "CalculatorIo.h"

@interface CalculatorViewController ()
  @property (nonatomic) CalculatorBrain *brain;
  @property (nonatomic) CalculatorIo *io;
@end

@implementation CalculatorViewController

@synthesize brain = _brain;
@synthesize display;
@synthesize io = _calculatorIo;


- (CalculatorBrain *)brain{
  if(!_brain) _brain = [[CalculatorBrain alloc] init];
  
  return _brain;
}


- (CalculatorIo *)io{
  if(!_calculatorIo) _calculatorIo = [[CalculatorIo alloc] init:self.display];
  
  return _calculatorIo;
}

- (IBAction)digitPressed:(UIButton *)inputButton {
  NSString * digit = [inputButton currentTitle];
  
  [self.io send:digit];
}

- (void)push{  [self.brain push: [self.io read]];}

- (IBAction)enterPressed{  [self push];}

- (IBAction)operationPressed:(UIButton *)sender {
  if ([self.io inputting]) {    [self push];  }
  
  NSString *operation = [sender currentTitle];
  
  double result = [self.brain perform:operation];
 
  [self.io set:result];
}

@end
