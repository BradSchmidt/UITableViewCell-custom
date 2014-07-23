//
//  CustomCellTableViewCell.m
//  CustomTableViewCell
//
//  Created by Bradley Robert Schmidt on 7/21/14.
//  Copyright (c) 2014 Bradley Robert Schmidt. All rights reserved.
//

#import "CustomCellTableViewCell.h"

@implementation CustomCellTableViewCell

@synthesize imageView = _imageView;
@synthesize label = _label;
@synthesize subLabel = _subLabel;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(5, 5, 34, 34)];
        [self addSubview:self.imageView];
        
        self.label = [[UILabel alloc] initWithFrame:CGRectMake(44, 5, [[UIScreen mainScreen] bounds].size.width - 44, 17)];
        [self addSubview:self.label];
        
        self.subLabel = [[UILabel alloc] initWithFrame:CGRectMake(44, 22, [[UIScreen mainScreen] bounds].size.width - 44, 17)];
        [self addSubview:self.subLabel];
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
