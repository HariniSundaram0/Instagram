//
//  feedCellTableViewCell.m
//  Instagram
//
//  Created by Harini Sundaram on 6/28/22.
//

#import "feedCellTableViewCell.h"

@implementation feedCellTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setPost:(Post *)post {
    _post = post;
    self.photoImageView.file = post[@"image"];
    [self.photoImageView loadInBackground];
}

@end
