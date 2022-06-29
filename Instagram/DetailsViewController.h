//
//  DetailsViewController.h
//  Pods
//
//  Created by Harini Sundaram on 6/29/22.
//

#import <UIKit/UIKit.h>
#import "Post.h"
#import "DateTools.h"

@import Parse;

NS_ASSUME_NONNULL_BEGIN

@interface DetailsViewController : UIViewController
@property (strong, nonatomic) IBOutlet PFImageView *photoImageView;
@property (strong, nonatomic) Post *post;



@property (weak, nonatomic) IBOutlet UILabel *captionLabel;
@property (weak, nonatomic) IBOutlet UILabel *commentCountLabel;
@property (weak, nonatomic) IBOutlet UILabel *likeCountLabel;
@property (weak, nonatomic) IBOutlet UILabel *authorLabel;

@end

NS_ASSUME_NONNULL_END
