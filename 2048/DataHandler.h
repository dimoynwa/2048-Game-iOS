

#import <Foundation/Foundation.h>
#import "SwipeProtocol.h"


@interface DataHandler : NSObject<SwipeProtocol>

@property NSMutableArray* board;
@property NSNumber* maxNum;

+(instancetype) sharedInstance ;

-(BOOL) generateNumber;

@end
