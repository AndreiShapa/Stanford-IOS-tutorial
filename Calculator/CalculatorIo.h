#import <Foundation/Foundation.h>

@interface CalculatorIo : NSObject
  @property (nonatomic) BOOL inputting;
  

- (CalculatorIo *) init:(UILabel *)output;
- (void) set:(double)digit;
- (void) sendDigit:(NSString *)digit;
- (double) readDigits;


@end
