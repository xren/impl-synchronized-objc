//
//  RXSynchronized.h
//  impl-synchronized-objc
//
//  Created by Xiaoxiang Ren on 11/19/15.
//  Copyright © 2015 Xiaoxiang Ren. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RXSynchronized : NSObject

- (void)synchronizedWithObject:(id)obj withSelector:(SEL)selector;

@end
