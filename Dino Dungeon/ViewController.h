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

@interface ViewController : UIViewController

{
    IBOutlet UIImageView *Dino;
    IBOutlet UIImageView *Spikes;
    IBOutlet UIImageView *Egg;
    IBOutlet UIImageView *Floor;
  //IBOutletCollection (UIImageView) NSArray *Platform;//
    IBOutlet UIImageView *Platform;
    IBOutlet UIImageView *Platform2;
   
    IBOutlet UIButton *Jump;
    IBOutlet UIButton *Left;
    IBOutlet UIButton *Right;
    
    IBOutlet UILabel *Life;
    
    NSTimer *fallingtimer;
    NSTimer *lefttimer;
    NSTimer *righttimer;

    SystemSoundID jumpButton;
    
}

// @property (nonatomic, strong) IBOutletCollection(UIImageView) NSArray *Platform;//


-(void)goleft;
-(void)goright;

-(IBAction)startleft;
-(IBAction)stopleft;

-(IBAction)startright;
-(IBAction)stopright;

-(void)fallingcode;
-(IBAction)jumpcode:(id)sender;
-(IBAction)jumpSound:(id)sender;


@end

