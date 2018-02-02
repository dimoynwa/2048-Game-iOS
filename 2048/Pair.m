//
//  Pair.m
//  2048
//
//  Created by Synergy GFS on 7/19/16.
//  Copyright © 2016 TrainingCamp. All rights reserved.
//

#import "Pair.h"

@interface Pair ()

@property(readwrite) NSInteger row;
@property(readwrite) NSInteger column;

@end

@implementation Pair

-(instancetype) initWithRow: (NSInteger) row andColumn : (NSInteger) column {
    self = [super init];
    if(self) {
        self.row = row;
        self.column = column;
    }
    return self;
}

@end
