//
//  TableView.h
//  CustomTableViewCell
//
//  Created by Bradley Robert Schmidt on 7/21/14.
//  Copyright (c) 2014 Bradley Robert Schmidt. All rights reserved.
//

@class informationLibrary;

#import <UIKit/UIKit.h>

@interface TableView : UITableViewController

@property (nonatomic, retain) informationLibrary *info;

- (void)createThumbnail:(UIImage *)image;
- (UIImage *)thumbnail;

@property (nonatomic, strong) UIImage *thumbnail;
@property (nonatomic, strong) NSData *dataThumb;
@end
