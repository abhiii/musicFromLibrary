//
//  ViewController.h
//  MusicPlay
//
//  Created by Hadi Hatunoglu on 25/06/13.
//  Copyright (c) 2013 Hadi Hatunoglu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>
@interface ViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong) IBOutlet UITableView *table;
@end
