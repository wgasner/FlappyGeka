//
//  GekaViewController.h
//  Flying Geka
//
//  Created by William Gasner on 5/4/14.
//  Copyright (c) 2014 Geka. All rights reserved.
//

#import <UIKit/UIKit.h>

int BirdFlight;
int RandomTopTunnelPosition;
int RandomBottomTunnelPosition;
int ScoreNumber;
NSInteger HighScoreNumber;

@interface GekaViewController : UIViewController

{
    
    IBOutlet UIImageView *Bird;
    IBOutlet UIImageView *Columntop;
    IBOutlet UIButton *StartGame;
    IBOutlet UIImageView *Columnbottom;
    IBOutlet UIImageView *floor;
    IBOutlet UIImageView *ceiling;
    IBOutlet UIButton *Exit;
    IBOutlet UILabel *ScoreLabel;
    
    
    NSTimer *BirdMovement;
    NSTimer *TunnelMovement;
    
    
}

-(IBAction)StartGame:(id)sender;
-(void) BirdMoving;
-(void) TunnelMoving;
-(void) PlaceTunnels;
-(void) Score;
-(void) Gameover;

@end

