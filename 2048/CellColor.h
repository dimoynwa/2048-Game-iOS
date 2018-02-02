
#import <Foundation/Foundation.h>
#import  <UIKit/UIKit.h>

@interface CellColor : NSObject

+sharedInstance;
-(UIColor*) getColorforCellAtIndex : (NSUInteger) cellIndex withValue : (NSNumber*) value;

@end
