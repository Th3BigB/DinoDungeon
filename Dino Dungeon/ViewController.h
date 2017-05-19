//
//  ViewController.h
//  Dino Dungeon
//
//  Created by Brent Kelly on 3/5/17.
//  Copyright © 2017 Brent Kelly. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AudioToolbox/AudioToolbox.h>

int jumpvalue;
int life;

@interface ViewController : UIViewController<UIAlertViewDelegate>
{
    IBOutlet UIImageView *Dino;
    IBOutlet UIImageView *Spikes;
    IBOutlet UIImageView *Spikes2;
    IBOutlet UIImageView *Spikes3;
    IBOutlet UIImageView *Spikes4;
    IBOutlet UIImageView *Egg;
    IBOutlet UIImageView *Floor;
    IBOutlet UIImageView *Fall;
  //IBOutletCollection (UIImageView) NSArray *Platform;//
    IBOutlet UIImageView *Platform;
    IBOutlet UIImageView *Platform2;
    IBOutlet UIImageView *Platform3;
    IBOutlet UIImageView *Platform4;
    IBOutlet UIImageView *Platform5;
    IBOutlet UIImageView *Platform6;
    IBOutlet UIImageView *Platform7;
    IBOutlet UIImageView *Platform8;
    IBOutlet UIImageView *Platform9;
    IBOutlet UIImageView *Platform10;
    
    IBOutlet UIButton *Jump;
    IBOutlet UIButton *Left;
    IBOutlet UIButton *Right;
    
    IBOutlet UILabel *Life;
    
    NSTimer *fallingtimer;
    NSTimer *lefttimer;
    NSTimer *righttimer;

    SystemSoundID jumpButton;
    SystemSoundID Damage;
    SystemSoundID Falling;
    SystemSoundID eggCollect;
    SystemSoundID Music;
    
}


-(void)goleft;
-(void)goright;

-(IBAction)startleft;
-(IBAction)stopleft;

-(IBAction)startright;
-(IBAction)stopright;

-(void)fallingcode;
-(IBAction)jumpcode:(id)sender;
-(IBAction)jumpSound:(id)sender;
-(IBAction)damageSound:(id)sender;
-(IBAction)fallSound:(id)sender;
-(IBAction)eggSound:(id)sender;
-(IBAction)gameMusic:(id)sender;

@end

