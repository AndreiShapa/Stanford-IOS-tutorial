#import "CalculatorIo.h"

@interface CalculatorIo()
  @property (weak, nonatomic) IBOutlet UILabel *output;

- (void) setString:(NSString *)digit;
- (void) append:(NSString *)digit;

- (NSString *) stringValue;
- (double)doubleValue;

@end

@implementation CalculatorIo

- (CalculatorIo *) init:(UILabel *)output
{
  self = [super init];
  self.output = output;
  return self;
}
- (NSString *)stringValue {
  return self.output.text;
}

- (double)doubleValue {
  return [self.stringValue doubleValue];
}

- (void) append:(NSString *)digit
{
  NSString* concatenated = [self.stringValue stringByAppendingString:digit];
  self.output.text = concatenated;
}

- (void) setString:(NSString *)digit
{
  self.output.text = digit;
}

- (double) readDigits{
  self.inputting = NO;
  return self.doubleValue;
}

- (void) set:(double)digit
{
  NSString * value = [NSString stringWithFormat:@"%g", digit];
  self.output.text = value;
}

- (void) sendDigit:(NSString *)digit
{
  if (self.inputting){
    [self append:digit];
  }
  else{
    [self setString:digit];
    self.inputting = YES;
  }
}

@end
