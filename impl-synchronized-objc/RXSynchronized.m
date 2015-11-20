//
//  RXSynchronized.m
//  impl-synchronized-objc
//
//  Created by Xiaoxiang Ren on 11/19/15.
//  Copyright © 2015 Xiaoxiang Ren. All rights reserved.
//

#import "RXSynchronized.h"

@interface RXSynchronized ()

@property (nonatomic) NSMapTable *locksTable;

@end

@implementation RXSynchronized {
    OSSpinLock lockTableLock;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.locksTable = [NSMapTable weakToWeakObjectsMapTable];
        lockTableLock = OS_SPINLOCK_INIT;
    }
    return self;
}

- (void)synchronizedWithObject:(id)obj withSelector:(SEL)selector {
    NSRecursiveLock *lock = [self getLockForObj:obj];
    [lock lock];
    [obj performSelector:selector];
    [lock unlock];
}

- (NSRecursiveLock *)getLockForObj:(id)obj {
    OSSpinLockLock(&lockTableLock);
    NSRecursiveLock *lock = [self.locksTable objectForKey:obj];
    if (!lock) {
        lock = [[NSRecursiveLock alloc] init];
        [self.locksTable setObject:lock forKey:obj];
    }
    OSSpinLockUnlock(&lockTableLock);
    return lock;
}

@end
