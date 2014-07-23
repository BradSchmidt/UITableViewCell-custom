//
//  TableView.m
//  CustomTableViewCell
//
//  Created by Bradley Robert Schmidt on 7/21/14.
//  Copyright (c) 2014 Bradley Robert Schmidt. All rights reserved.
//

#import "TableView.h"
#import "CustomCellTableViewCell.h"
#import "informationLibrary.h"
#import "DetailedInformation.h"

@interface TableView ()

@end

@implementation TableView

@synthesize info;
@synthesize dataThumb, thumbnail;

- (id)init
{
    self = [super initWithStyle:UITableViewStyleGrouped];
    if (self) {
        // Custom initialization
        info = [[informationLibrary alloc] init];
        UINavigationItem *n = [self navigationItem];
        NSMutableAttributedString *attr =[[NSMutableAttributedString alloc] initWithString:@"Custom Cells"];
        NSDictionary *dictionary = @{NSFontAttributeName: [UIFont italicSystemFontOfSize:25.0], NSForegroundColorAttributeName : [UIColor colorWithRed:0.0 green:122.0/255.0 blue:1.0 alpha:1.0]};
        
        NSString *substring = @"Custom Cells";
        NSRange r = [[attr string] rangeOfString:substring];
        [attr setAttributes:dictionary range:r];
        
        UILabel *navLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 320, 100)];
        navLabel.backgroundColor = [UIColor clearColor];
        navLabel.attributedText = attr;
        navLabel.textAlignment = NSTextAlignmentCenter;
        [n setTitleView:navLabel];
    }
    return self;
}
- (id)initWithStyle:(UITableViewStyle)style
{
    return [self init];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.info count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    DetailedInformation *details = [self.info detailedInformationAtIndex:indexPath.row];
    CustomCellTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CustomCellTableViewCell"];
    if (!cell) {
        cell = [[CustomCellTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CustomCellTableViewCell"];
    }
    
    [self createThumbnail:details.image];
    [[cell imageView] setImage:thumbnail];
    
    cell.label.text = details.firstName;
    
    NSDictionary *dictionary = @{NSFontAttributeName: [UIFont italicSystemFontOfSize:12.0]};
    NSMutableAttributedString *attributed = [[NSMutableAttributedString alloc] initWithString:details.lastName];
    NSRange r = [[attributed string] rangeOfString:details.lastName];
    [attributed setAttributes:dictionary range:r];
    cell.subLabel.attributedText = attributed;
    return cell;
}

- (void)createThumbnail:(UIImage *)image
{
    CGRect thumbnailSize = CGRectMake(0, 0, 34, 34);
    CGSize originalImageSize = [image size];
    
    float ratio = MAX(thumbnailSize.size.width / originalImageSize.width, thumbnailSize.size.height / originalImageSize.height);
    
    UIGraphicsBeginImageContextWithOptions(thumbnailSize.size, NO, 0.0);
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:thumbnailSize cornerRadius:5.0];
    [path addClip];
    
    CGRect rect;
    rect.size.width = ratio * originalImageSize.width;
    rect.size.height = ratio * originalImageSize.height;
    rect.origin.x = (thumbnailSize.size.width - rect.size.width) / 2.0;
    rect.origin.y = (thumbnailSize.size.height - rect.size.height) / 2.0;
    [image drawInRect:rect];
    
    UIImage *imageSmall = UIGraphicsGetImageFromCurrentImageContext();
    [self setThumbnail:imageSmall];
    NSData *data = UIImagePNGRepresentation(imageSmall);
    [self setDataThumb:data];
    
    UIGraphicsEndImageContext();
}

- (UIImage *)thumbnail
{
    if (!dataThumb) {
        return nil;
    }
    if (!dataThumb) {
        thumbnail = [UIImage imageWithData:dataThumb];
    }
    return thumbnail;
}

@end
