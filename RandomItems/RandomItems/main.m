//
//  main.m
//  RandomItems
//
//  Created by Matt on 3/1/14.
//  Copyright (c) 2014 Matthew Piccolella. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BNRItem.h"

int main(int argc, const char * argv[])
{
    @autoreleasepool {
        NSMutableArray *items = [[NSMutableArray alloc] init];
        
        int i = 0;
        for (i = 0; i < 10; i++) {
            BNRItem *hold = [BNRItem randomItem];
            [items addObject:hold];
        }
        for (BNRItem *item in items) {
            NSLog(@"%@", item);
        }
        
        NSLog(@"Deallocating items...");
        items = nil;
        
    }
    return 0;
}

