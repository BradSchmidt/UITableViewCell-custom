//
//  informationLibrary.m
//  CustomTableViewCell
//
//  Created by Bradley Robert Schmidt on 7/21/14.
//  Copyright (c) 2014 Bradley Robert Schmidt. All rights reserved.
//

#import "informationLibrary.h"
#import "DetailedInformation.h"

@implementation informationLibrary
@synthesize detailedForCell;

- (id)init
{
    if (self = [super init]) {
        detailedForCell = [[NSMutableArray alloc] init];
        
        DetailedInformation *d1 = [[DetailedInformation alloc] init];
        d1.firstName = @"North Peak";
        d1.lastName = @"Near Saddlebag Lake";
        UIImage *i1 = [UIImage imageNamed:@"1.png"];
        d1.image = i1;
        [detailedForCell addObject:d1];
        
        DetailedInformation *d2 = [[DetailedInformation alloc] init];
        d2.firstName = @"Random Waterfall";
        d2.lastName = @"On the way to Mt. Conness";
        UIImage *i2 = [UIImage imageNamed:@"2.png"];
        d2.image = i2;
        [detailedForCell addObject:d2];
    }
    return self;
}

- (int)count
{
    return detailedForCell.count;
}

- (DetailedInformation *)detailedInformationAtIndex:(int)index
{
    return [detailedForCell objectAtIndex:index];
}
@end
