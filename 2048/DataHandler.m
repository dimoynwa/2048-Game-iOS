
#import "DataHandler.h"



@interface DataHandler ()



@property NSInteger filledCells;
@property NSInteger rows;


@end



@implementation DataHandler



const NSUInteger kSizeOfArray = 16;


+(instancetype) sharedInstance {
    
    static DataHandler* instance=nil;
    
    
    
    if(!instance){
        
        instance = [[super alloc] init];
        
        instance.board = [[NSMutableArray alloc]initWithCapacity:kSizeOfArray];
        
        instance.rows = sqrt(kSizeOfArray);
        
        for (int i =0; i<=kSizeOfArray ; i++) {
            
            [instance.board insertObject:@0 atIndex : i];
            
        }
        
        [instance generateNumber];
        
    }
    
    
    
    
    
    return instance;
    
}



-(void)swipeDown{
    
    NSLog(@"Swipe Down");
    
    for(NSInteger i = 0;i < 4;++i)
        
        [self pushDown:i];
    
    for(NSInteger i = 0;i < 4;++i)
        
        [self arrangeDown:i];
    
}



-(void)swipeLeft{
    
    NSLog(@"Swipe Left");
    
    for(NSInteger i = 3;i < kSizeOfArray;i+=4)
        
        [self pushLeft:i];
    
    for(NSInteger i = 3;i < kSizeOfArray;i+=4)
        
        [self arrangeLeft:i];
    
}



-(void)swipeRight{
    
    NSLog(@"Swipe Right");
    
    for(NSInteger i = 0;i<kSizeOfArray;i+=4)
        
        [self pushRight:i];
    
    for(NSInteger i = 0;i<kSizeOfArray;i+=4)
        
        [self arrangeRight:i];
    
}



-(void)swipeUp{
    
    NSLog(@"Swipe Up");
    
    for(NSInteger i = 12;i<kSizeOfArray;++i)
        
        [self pushUp:i];
    
    for(NSInteger i = 12;i<kSizeOfArray;++i)
        
        [self arrangeUp:i];
    
}



+(instancetype)alloc{
    
    return [DataHandler sharedInstance];
    
}



-(void) pushDown : (NSInteger) x {
    if(x + 4 >= kSizeOfArray)
        
        return;
    
    if([self.board[x+4] isEqualToNumber:@0]) {
        
        self.board[x+4] = self.board[x];
        
        self.board[x] = @0;
        
        [self pushDown:x+4];
        
    }
    else if([self.board[x+4] isEqualToNumber:self.board[x]])
    /*else if(self.board[x+4] == self.board[x])*/   {
        
        self.board[x+4] = [self getNext:self.board[x]];
        
        if(self.board[x+4] > self.maxNum)
            
            self.maxNum = self.board[x+4];
        
        self.board[x] = @0;
        
        //        self.filledCells--;
        
        [self pushDown:x+(2*4)];
        
        
        
    }
    
    else {
        
        [self pushDown:x+4];
        
    }
    
}

-(void) pushUp : (NSInteger) x {
    if(x - 4 < 0)
        
        return;
    
    if([self.board[x-4] isEqualToNumber: @0]) {
        
        self.board[x-4] = self.board[x];
        
        if(self.board[x-4] > self.maxNum)
            
            self.maxNum = self.board[x-4];
        
        self.board[x] = @0;
        
        [self pushUp:x-4];
        
    }
    else if([self.board[x-4] isEqualToNumber:self.board[x]])
    /*else if(self.board[x-4] == self.board[x])*/ {
        
        self.board[x-4] = [self getNext:self.board[x]];
        
        self.board[x] = @0;
        
        //        self.filledCells--;
        
        [self pushUp:x-(2*4)];
        
    }
    
    else {
        
        [self pushUp:x-4];
        
    }
    
}



-(void) pushLeft : (NSInteger) x {
    if(x % 4 == 0)
        
        return;
    
    if([self.board[x-1] isEqualToNumber: @0]) {
        
        self.board[x-1] = self.board[x];
        
        if(self.board[x-1] > self.maxNum)
            
            self.maxNum = self.board[x-1];
        
        self.board[x] = @0;
        
        [self pushLeft:x-1];
        
    }
    else if([self.board[x-1] isEqualToNumber:self.board[x]])
    /*else if(self.board[x-1] == self.board[x])*/ {
        
        self.board[x-1] = [self getNext:self.board[x]];
        
        self.board[x] = @0;
        
        //        self.filledCells--;
        if(x % _rows > 1)
            [self pushLeft:x-2];
        
    }
    
    else {
        [self pushLeft:x-1];
    }
}



-(void) pushRight : (NSInteger) x {
    if(x % 4 == 3)
        
        return;
    
    if([self.board[x+1] isEqualToNumber: @0]) {
        
        self.board[x+1] = self.board[x];
        
        if(self.board[x+1] > self.maxNum)
            
            self.maxNum = self.board[x+1];
        
        self.board[x] = @0;
        
        [self pushRight:x+1];
        
    }
    else if([self.board[x+1] isEqualToNumber:self.board[x]])
    /*else if(self.board[x+1] == self.board[x])*/ {
        
        self.board[x+1] = [self getNext:self.board[x]];
        
        self.board[x] = @0;
        
        //        self.filledCells--;
        if(x % _rows < 2)
            [self pushRight:x+2];
        
    }
    
    else {
        [self pushRight:x+1];
        
    }
}



-(void) arrangeUp : (NSInteger) x {
    
    if(x - 4 <= 0)
        
        return;
    
    if([self.board[x-4] isEqualToNumber:@0]) {
        
        self.board[x-4] = self.board[x];
        
        self.board[x] = @0;
        
        [self arrangeUp:x-4];
        
    }
    
    else
        
        [self arrangeUp:x-4];
    
}

-(void) arrangeDown : (NSInteger) x {
    
    if(x + 4 >= kSizeOfArray)
        
        return;
    
    if([self.board[x+4] isEqualToNumber:@0]){
        
        self.board[x+4] = self.board[x];
        
        self.board[x] = @0;
        
        [self arrangeDown:x+4];
        
    }
    
    else {
        
        [self arrangeDown:x+4];
        
    }
    
}

-(void) arrangeLeft : (NSInteger) x {
    
    if(x % 4 == 0)
        
        return;
    
    if([self.board[x-1] isEqualToNumber:@0]){
        
        self.board[x-1] = self.board[x];
        
        self.board[x] = @0;
        
        [self arrangeLeft:x-1];
        
    }
    
    else {
        
        [self arrangeLeft:x-1];
        
    }
    
}

-(void) arrangeRight : (NSInteger) x {
    
    if(x % 4 == 3)
        
        return;
    
    if([self.board[x+1] isEqualToNumber:@0]) {
        
        self.board[x+1] = self.board[x];
        
        self.board[x] = @0;
        
        [self arrangeRight:x+1];
        
    }
    
    else {
        
        [self arrangeRight:x+1];
        
    }
    
}

-(NSNumber*) getNext : (NSNumber*) x {
    
    if([x isEqualToNumber:@2])
        
        return @4;
    
    if([x isEqualToNumber:@4])
        
        return @8;
    
    if([x isEqualToNumber:@8])
        
        return @16;
    
    if([x isEqualToNumber:@16])
        
        return @32;
    
    if([x isEqualToNumber:@32])
        
        return @64;
    
    if([x isEqualToNumber:@64])
        
        return @128;
    
    if([x isEqualToNumber:@128])
        
        return @256;
    
    if([x isEqualToNumber:@256])
        
        return @512;
    
    if([x isEqualToNumber:@512])
        
        return @1024;
    
    if([x isEqualToNumber:@1024])
        
        return @2048;
    
    return @0;
    
}



-(BOOL) generateNumber {
    
    NSMutableArray* emptyCells = [NSMutableArray array];
    
    for(NSInteger i = 0; i < kSizeOfArray; ++i) {
        if([self.board[i] isEqualToNumber:@0]) {
            [emptyCells addObject:[NSNumber numberWithInteger:i]];
        }
    }
    NSInteger rand;
    NSInteger toFill;
    if([emptyCells count] == 0){
        return NO;
    }
    else if([emptyCells count] == 1) {
        toFill = [emptyCells[0] integerValue];
    } else {
        rand = arc4random()% ([emptyCells count]-1) + 0;
        toFill = [emptyCells[rand] integerValue];
    }

    self.board[toFill] = @2;
    
    return YES;
    
//    NSInteger br = 0;
//    
//    for(NSInteger i =0 ;i<kSizeOfArray;++i) {
//        
//        if(![self.board[i] isEqualToNumber:@0])
//            
//            br++;
//        
//    }
//    
//    if(br == kSizeOfArray)
//        
//        return NO;
//    
//    NSInteger toFill;
//    
//    do {
//        
//        toFill = arc4random()% (kSizeOfArray-1) + 0;
//        
//    }while (![self.board[toFill] isEqualToNumber:@0]);
//    
//    self.board[toFill] = @2;
//    
//    
//    
//    if(self.filledCells<kSizeOfArray && [self.board[toFill] isEqualToNumber:@0]){
//        
//        self.board[toFill] = @2;
//        
//    }
//    
//    return YES;
    
}





@end