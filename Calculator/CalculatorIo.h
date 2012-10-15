#import <Foundation/Foundation.h>

@interface CalculatorIo : NSObject
  @property (nonatomic) BOOL inputting;
  

- (CalculatorIo *) init:(UILabel *)output;
- (void) set:(double)digit;
- (void) send:(NSString *)digit;
- (double) read;


@end
