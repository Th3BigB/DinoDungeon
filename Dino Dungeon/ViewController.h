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

@interface ViewController : UIViewController

{
    IBOutlet UIImageView *Dino;
    IBOutlet UIImageView *Floor;
    IBOutlet UIButton *Jump;
    IBOutlet UIButton *Left;
    IBOutlet UIButton *Right;
    
    NSTimer *fallingtimer;
    
    NSTimer *lefttimer;
    NSTimer *righttimer;

    SystemSoundID jumpButton;
    
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

@end

