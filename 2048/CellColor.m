
#import "CellColor.h"

@implementation CellColor

+sharedInstance {
    static CellColor* instance=nil;
    
    if(!instance){
        instance = [[super alloc] init];
    }
    return instance;
}

+(instancetype)alloc{
    return [CellColor sharedInstance];
}


-(UIColor*) getColorforCellAtIndex : (NSUInteger) cellIndex withValue : (NSNumber*) value {
    UIColor* color  = [UIColor colorWithRed:1 green:1 blue:1 alpha:1];
    
        if([value isEqualToNumber: @0])
            color = [UIColor colorWithRed:1 green:1 blue:0.0 alpha:1];
        if([value isEqualToNumber: @2])
            color = [UIColor colorWithRed:1 green:0.9 blue:0.0 alpha:1];
        if([value isEqualToNumber: @4])
           color = [UIColor colorWithRed:1 green:0.8 blue:0.0 alpha:1];
        if([value isEqualToNumber: @8])
            color = [UIColor colorWithRed:1 green:0.7 blue:0.0 alpha:1];
        if([value isEqualToNumber: @16])
            color = [UIColor colorWithRed:1 green:0.6 blue:0.0 alpha:1];
        if([value isEqualToNumber: @32])
            color = [UIColor colorWithRed:1 green:0.5 blue:0.0 alpha:1];
        if([value isEqualToNumber: @64])
            color = [UIColor colorWithRed:1 green:0.4 blue:0.0 alpha:1];
        if([value isEqualToNumber: @128])
            color = [UIColor colorWithRed:1 green:0.3 blue:0.0 alpha:1];
        if([value isEqualToNumber: @256])
            color = [UIColor colorWithRed:1 green:0.2 blue:0.0 alpha:1];
        if([value isEqualToNumber: @512])
            color = [UIColor colorWithRed:1 green:0.1 blue:0.0 alpha:1];
        if([value isEqualToNumber: @1024])
            color = [UIColor colorWithRed:1 green:0.8 blue:0.8 alpha:1];
        if([value isEqualToNumber: @2048])
            color = [UIColor colorWithRed:0.2 green:0.2 blue:0.8 alpha:1];
    
    return color;
}

@end
