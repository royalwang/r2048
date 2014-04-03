//
// Created by Viktor Belenyesi on 29/03/14.
// Copyright (c) 2014 Viktor Belenyesi. All rights reserved.
//

#import "RTTPoint.h"
#import "RTTMatrix.h"

@implementation RTTPoint

RTTPoint* point(short x, short y) {
    return [RTTPoint pointWithX:x y:y];
}

+ (instancetype)pointWithX:(short)x y:(short)y {
    return [[self alloc] initWithX:x y:y];
}

- (instancetype)initWithX:(short)x y:(short)y {
    self = [super init];
    if (self) {
        _x = x;
        _y = y;
    }
    return self;
}

- (RTTPoint* (^)())reverse {
    return ^{
        return point(self.y, self.x);
    };
}

- (RTTPoint* (^)())invert {
    return ^{
        return point(kMatrixSize - 1 - self.x, self.y);
    };
}

- (NSComparisonResult)compare:(RTTPoint*)otherPoint {
    if (self.x == otherPoint.x) {
        return COMPARE(self.y, otherPoint.y);
    }
    return COMPARE(self.x, otherPoint.x);
}

- (BOOL)isEqual:(id)object {
    RTTPoint* otherPoint = (RTTPoint*)object;
    return (otherPoint.x == self.x) && (otherPoint.y == self.y);
}

- (NSString *)description {
    return [NSString stringWithFormat:@"(%d, %d)", self.x, self.y];
}

@end
