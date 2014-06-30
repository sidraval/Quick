//
//  QCKRaise.m
//  Nimble
//
//  Created by Brian Ivan Gesiak on 6/30/14.
//
//

#import "NMBRaise.h"
#import <Nimble/Nimble-Swift.h>

@interface NMBRaiseMatcher : NSObject <Matcher>

@end

@implementation NMBRaiseMatcher

#pragma mark - Matcher Protocol Methods

- (NSString *)failureMessage:(NSObject *)actual {
    return @"";
}

- (NSString *)negativeFailureMessage:(NSObject *)actual {
    return @"";
}

- (BOOL)match:(NSObject *)actual {
    return YES;
}

@end


@implementation NMBRaise

- (instancetype)init {
    self = [super init];
    if (self) {
        self.matcher = [NMBRaiseMatcher new];
    }
    return self;
}

@end
