//
//  ViewController.m
//  MusicPlay
//
//  Created by Hadi Hatunoglu on 25/06/13.
//  Copyright (c) 2013 Hadi Hatunoglu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    NSMutableArray *songsArray;
    MPMusicPlayerController *musicPlayer;
    NSArray *totalSongs;
}
@end

@implementation ViewController

- (void)viewDidLoad
{
    songsArray=[[NSMutableArray alloc]init];
    musicPlayer=[MPMusicPlayerController applicationMusicPlayer];
    MPMediaQuery *query=[MPMediaQuery songsQuery];
    [musicPlayer setQueueWithQuery:query];
    totalSongs=[query items];
    for (MPMediaItem *songs in totalSongs) {
        NSString *songName=[songs valueForProperty:MPMediaItemPropertyTitle];
        [songsArray addObject:songName];

    }
    NSLog(@"song names are %@",songsArray);
        


    
     
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}



#pragma mark tableview delegates

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [songsArray count];
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
}


-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier=@"CellIdentifier";
    
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell==nil) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        
    }
    
    UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame=CGRectMake(2, 6, 20, 30);
    btn.titleLabel.text=@"PP";
    [btn setImage:[UIImage imageNamed:@"Play-icon.png"] forState:UIControlStateNormal];
    btn.tag=indexPath.row;
    [btn addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [cell.contentView addSubview:btn];
    
    UILabel *songTitle=[[UILabel alloc]initWithFrame:CGRectMake(30, 6, 200, 30)];
    songTitle.text=[songsArray objectAtIndex:indexPath.row];
    [cell.contentView addSubview:songTitle];
    
    return cell;
}


-(void)btnClicked:(UIButton*)songNumber
{
    [musicPlayer setNowPlayingItem:[totalSongs objectAtIndex:songNumber.tag]];
    [musicPlayer play];
    
    NSLog(@"btn clicked at %d",songNumber.tag);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
