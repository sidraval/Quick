//
//  QCKRaise.h
//  Nimble
//
//  Created by Brian Ivan Gesiak on 6/30/14.
//
//

#import <Foundation/Foundation.h>

@protocol Matcher;

@interface NMBRaise : NSObject

@property (nonatomic, strong) id<Matcher> matcher;

@end
