//
//  main.m
//  impl-synchronized-objc
//
//  Created by Xiaoxiang Ren on 11/18/15.
//  Copyright © 2015 Xiaoxiang Ren. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RXMain.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        RXMain *main = [[RXMain alloc] init];
        [main invoke];
        // insert code here...
        NSLog(@"Hello, World!");
    }
    return 0;
}
