//
//  ViewController.h
//  Dino Dungeon
//
//  Created by Brent Kelly on 3/5/17.
//  Copyright © 2017 Brent Kelly. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AudioToolbox/AudioToolbox.h>

// Creates intergers for jumpvalue and life
int jumpvalue;
int life;

@interface ViewController : UIViewController<UIAlertViewDelegate>
{
    
    // Creates Outlets for all UIImageViews
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
    
    // Creates Outlets for UIButtons
    IBOutlet UIButton *Jump;
    IBOutlet UIButton *Left;
    IBOutlet UIButton *Right;
    IBOutlet UIButton *gMusic;
    
    // Creates Outlet for UILabal to show life
    IBOutlet UILabel *Life;
    
    // Creates timers
    NSTimer *fallingtimer;
    NSTimer *lefttimer;
    NSTimer *righttimer;

    // Creates a sound ID for each individual sound so it can be called
    SystemSoundID jumpButton;
    SystemSoundID Damage;
    SystemSoundID Falling;
    SystemSoundID eggCollect;
    SystemSoundID Music;
    
}

// Creates voids for lieft and right movements
-(void)goleft;
-(void)goright;

// Creates an IBAction to run code with starts and stops the left buttons movement
-(IBAction)startleft;
-(IBAction)stopleft;

// Creates an IBAction to run code with starts and stops the right buttons movement
-(IBAction)startright;
-(IBAction)stopright;

// Creates void to store falling code
-(void)fallingcode;

// Creates an IBAction to store both Code and AudioServices
-(IBAction)jumpcode:(id)sender;
-(IBAction)jumpSound:(id)sender;
-(IBAction)damageSound:(id)sender;
-(IBAction)fallSound:(id)sender;
-(IBAction)eggSound:(id)sender;
-(IBAction)gameMusic:(id)sender;

@end

