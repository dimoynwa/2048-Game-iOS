//
//  Pair.h
//  2048
//
//  Created by Synergy GFS on 7/19/16.
//  Copyright © 2016 TrainingCamp. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Pair : NSObject

@property(readonly) NSInteger row;
@property(readonly) NSInteger column;

-(instancetype) initWithRow: (NSInteger) row andColumn : (NSInteger) column;

@end
