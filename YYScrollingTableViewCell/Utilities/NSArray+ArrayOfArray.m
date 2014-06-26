//
//  NSArray+ArrayOfArray.m
//  GloveBox
//
//  Created by appazure on 9/17/13.
//  Copyright (c) 2013 appazure. All rights reserved.
//

#import "NSArray+ArrayOfArray.h"

@implementation NSArray (ArrayOfArray)

- (id)objectAtIndexPath:(NSIndexPath *)indexPath {
    return [[self objectAtIndex:[indexPath section]] objectAtIndex:[indexPath row]];
}

@end
