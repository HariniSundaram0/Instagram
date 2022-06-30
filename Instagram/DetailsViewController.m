//
//  DetailsViewController.m
//  Pods
//
//  Created by Harini Sundaram on 6/29/22.
//

#import "DetailsViewController.h"

@interface DetailsViewController ()

@end

@implementation DetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.photoImageView.file = self.post[@"image"];
    [self.photoImageView loadInBackground];
    self.captionLabel.text = self.post.caption;
    self.commentCountLabel.text = [NSString stringWithFormat:@"%@", self.post.commentCount];
    self.likeCountLabel.text = [NSString stringWithFormat:@"%@", self.post.likeCount];
//    cell.photo
    self.authorLabel.text = self.post.author.username;
    NSDate *curr_date = self.post.createdAt;
    NSString *final_date = [curr_date.shortTimeAgoSinceNow stringByAppendingString:@" ago"];
    [self.dateLabel setText: final_date];
//    self.dateLabel.text = self
    // Do any additional setup after loading the view.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
