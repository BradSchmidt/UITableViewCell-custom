//
//  informationLibrary.h
//  CustomTableViewCell
//
//  Created by Bradley Robert Schmidt on 7/21/14.
//  Copyright (c) 2014 Bradley Robert Schmidt. All rights reserved.
//

@class DetailedInformation;

#import <Foundation/Foundation.h>

@interface informationLibrary : NSObject

@property (nonatomic, strong) NSMutableArray *detailedForCell;

- (int)count;
- (DetailedInformation *)detailedInformationAtIndex:(int)index;

@end
