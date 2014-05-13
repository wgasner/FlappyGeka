//
//  GekaViewController.m
//  Flying Geka
//
//  Created by William Gasner on 5/4/14.
//  Copyright (c) 2014 Geka. All rights reserved.
//

#import "GekaViewController.h"

@interface GekaViewController ()

@end

@implementation GekaViewController

-(void) Gameover {
    
    if (ScoreNumber > HighScoreNumber) {
        [[NSUserDefaults standardUserDefaults] setInteger:ScoreNumber forKey:@"HighScoreSaved"];
    }
    
    [TunnelMovement invalidate];
    [BirdMovement invalidate];
    
    Exit.hidden = NO;
    Columntop.hidden = YES;
    Columnbottom.hidden = YES;
    Bird.hidden = YES;
}

-(void)Score {
    
    ScoreNumber = ScoreNumber + 1;
    ScoreLabel.text = [NSString stringWithFormat:@"%i", ScoreNumber];
}

-(IBAction)StartGame:(id)sender{
    
    Columntop.hidden = NO;
    Columnbottom.hidden = NO;
    
    StartGame.hidden = YES;
    
    BirdMovement = [NSTimer scheduledTimerWithTimeInterval: 0.05 target: self selector: @selector(BirdMoving) userInfo:nil repeats:YES];
    
    [self PlaceTunnels];
    
    TunnelMovement = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(TunnelMoving) userInfo:nil repeats:YES];
    
}


-(void)TunnelMoving{
    
    Columntop.center = CGPointMake(Columntop.center.x - 1, Columntop.center.y);
    Columnbottom.center = CGPointMake(Columnbottom.center.x - 1, Columnbottom.center.y);
    
    if (Columntop.center.x < -28) {
        [self PlaceTunnels];
    }
    if (Columntop.center.x == 30) {
        [self Score];
    }
    if (CGRectIntersectsRect(Bird.frame, Columntop.frame)) {
        
        [self Gameover];
    }
    if (CGRectIntersectsRect(Bird.frame, Columnbottom.frame)) {
        
        [self Gameover];
    }

    if (CGRectIntersectsRect(Bird.frame, floor.frame))
    {
    
    [self Gameover];
    }

    if (CGRectIntersectsRect(Bird.frame, ceiling.frame))
    {
    
    [self Gameover];
    }
    
    }


-(void)PlaceTunnels{
    
    RandomTopTunnelPosition = arc4random() %350;
    RandomTopTunnelPosition = RandomTopTunnelPosition - 228;
    RandomBottomTunnelPosition = RandomTopTunnelPosition + 600;
    //655
    
    Columntop.center = CGPointMake(340,RandomTopTunnelPosition);
    Columnbottom.center = CGPointMake(340, RandomBottomTunnelPosition);
    

}

-(void)BirdMoving {
    
    Bird.center = CGPointMake(Bird.center.x, Bird.center.y - BirdFlight);
    
    BirdFlight = BirdFlight - 5;
    
    if (BirdFlight < -15) {
        BirdFlight = -15;
    }
    
    if (BirdFlight > 0) {
        Bird.image = [UIImage imageNamed:@"gekaaaaa.png"];
    }
    
    if (BirdFlight < 0) {
        Bird.image = [UIImage imageNamed:@"gekaaaaa copy.png"];
    }
}


-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    BirdFlight = 30;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    
    Columntop.hidden = YES;
    Columnbottom.hidden = YES;
    
    Exit.hidden = YES;
    ScoreNumber = 0;
    
    HighScoreNumber = [[NSUserDefaults standardUserDefaults]integerForKey:@"HisghScoreSaved"];
    
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
