//
//  HomeViewController.m
//  Instagram
//
//  Created by Harini Sundaram on 6/27/22.
//

#import "HomeViewController.h"
#import "Parse/Parse.h"
#import "AppDelegate.h"
#import "LoginViewController.h"
#import "SceneDelegate.h"
#import "feedCellTableViewCell.h"
#import "Post.h"
@import Parse;



@interface HomeViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSArray* postArray;

@end

@implementation HomeViewController
- (IBAction)logoutUser:(id)sender {
    [PFUser logOutInBackgroundWithBlock:^(NSError * _Nullable error) {
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        self.view.window.rootViewController = [storyboard instantiateViewControllerWithIdentifier:@"AuthenticatedViewController"];
        // PFUser.current() will now be nil
    }];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    UIRefreshControl *refreshControl = [[UIRefreshControl alloc] init];
    [refreshControl addTarget:self action:@selector(beginRefresh:) forControlEvents:UIControlEventValueChanged];
    [self.tableView insertSubview:refreshControl atIndex:0];

    
    self.tableView.delegate=self;
    self.tableView.dataSource=self;
    
    PFQuery *postQuery = [Post query];
    [postQuery orderByDescending:@"createdAt"];
    [postQuery includeKey:@"author"];
    postQuery.limit = 20;

    // fetch data asynchronously
    [postQuery findObjectsInBackgroundWithBlock:^(NSArray<Post *> * _Nullable posts, NSError * _Nullable error) {
        if (posts) {
            self.postArray = posts;
            [self.tableView reloadData];
        }
        else {
            NSLog(@"AHHHH something went wrong maybe");
            // handle error
        }
    }];
    
    
}
- (void)beginRefresh:(UIRefreshControl *)refreshControl {

        // Create NSURL and NSURLRequest
    PFQuery *postQuery = [Post query];
    [postQuery orderByDescending:@"createdAt"];
    [postQuery includeKey:@"author"];
    postQuery.limit = 20;
    [postQuery findObjectsInBackgroundWithBlock:^(NSArray<Post *> * _Nullable posts, NSError * _Nullable error) {
        if (posts) {
            self.postArray = posts;
            [self.tableView reloadData];
        }
        else {
            NSLog(@"AHHHH something went wrong maybe");
            // handle error
        }
    }];

           // Tell the refreshControl to stop spinning
            [refreshControl endRefreshing];

//        }];
    
//        [task resume];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.postArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    feedCellTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"feedCell"];
    
    Post* curr_post = self.postArray[indexPath.row];
    
    cell.post = curr_post;
    cell.photoImageView.file = curr_post[@"image"];
    [cell.photoImageView loadInBackground];
    
//    [cell.setPost:curr_post];
//    cell.setPost
    
    cell.captionLabel.text = curr_post.caption;
    cell.commentCountLabel.text = [NSString stringWithFormat:@"%@", curr_post.commentCount];
    cell.likeCountLabel.text = [NSString stringWithFormat:@"%@", curr_post.likeCount];
//    cell.photo
    cell.authorLabel.text = curr_post.author.username;
    
    
    
    
    
    
    
    return cell; 
    
    
    
    
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
