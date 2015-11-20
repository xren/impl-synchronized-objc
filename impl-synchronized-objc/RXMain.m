//
//  RXMain.m
//  impl-synchronized-objc
//
//  Created by Xiaoxiang Ren on 11/19/15.
//  Copyright © 2015 Xiaoxiang Ren. All rights reserved.
//

#import "RXMain.h"
#import "RXSynchronized.h"


@implementation RXMain

- (void)invoke
{
    RXSynchronized *sync = [[RXSynchronized alloc] init];
    [sync synchronizedWithObject:self withSelector:@selector(test)];
}

- (void)test
{
    NSLog(@"test");
}

@end
