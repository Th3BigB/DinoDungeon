//
//  ViewController.m
//  Dino Dungeon
//
//  Created by Brent Kelly on 3/5/17.
//  Copyright © 2017 Brent Kelly. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController


// From the SystemSoundIDs, this creates a function to play the sounds
-(IBAction)jumpSound:(id)sender
{
    AudioServicesPlaySystemSound(jumpButton);
}

-(IBAction)eggSound:(id)sender
{
    AudioServicesPlaySystemSound(eggCollect);
}

-(IBAction)damageSound:(id)sender
{
    AudioServicesPlaySystemSound(Damage);
}

-(IBAction)fallSound:(id)sender
{
    AudioServicesPlaySystemSound(Falling);
}

-(IBAction)gameMusic:(id)sender
{
    AudioServicesPlaySystemSound(Music);
}

// Sets the jumpvalue, if the jump button is pressed it becomes disbaled for 0.35 seconds then re-enabled
-(IBAction)jumpcode:(id)sender
{
    jumpvalue = 28;
    Jump.enabled = NO;
    double delayInSeconds = 0.35;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        Jump.enabled = YES;
    });
}

-(void)fallingcode
{
    // This minuses 5 from the jump value in regards to the fallingtimer
    jumpvalue = jumpvalue - 5;
    
    // Sets Position of Dino after Jumping
    Dino.center = CGPointMake(Dino.center.x, Dino.center.y -jumpvalue);
    
    
    // Creates a frame around the floor and 10 platforms. When Dino intersects it sets new position
    if(CGRectIntersectsRect(Dino.frame, Floor.frame)){
        jumpvalue = 0;
        Dino.center = CGPointMake(Dino.center.x, Floor.center.y - 45);
    }
    
        if (CGRectIntersectsRect(Dino.frame, Platform.frame)){
            jumpvalue = 0;
            Dino.center = CGPointMake(Dino.center.x, Platform.center.y - 35);
    }
    
        if (CGRectIntersectsRect(Dino.frame, Platform2.frame)){
            jumpvalue = 0;
            Dino.center = CGPointMake(Dino.center.x, Platform2.center.y - 35);
    }
    
        if (CGRectIntersectsRect(Dino.frame, Platform3.frame)){
            jumpvalue = 0;
            Dino.center = CGPointMake(Dino.center.x, Platform3.center.y - 35);
    }
    
        if (CGRectIntersectsRect(Dino.frame, Platform4.frame)){
            jumpvalue = 0;
            Dino.center = CGPointMake(Dino.center.x, Platform4.center.y - 35);
    }
    
        if (CGRectIntersectsRect(Dino.frame, Platform5.frame)){
            jumpvalue = 0;
            Dino.center = CGPointMake(Dino.center.x, Platform5.center.y - 35);
    }
    
        if (CGRectIntersectsRect(Dino.frame, Platform6.frame)){
            jumpvalue = 0;
            Dino.center = CGPointMake(Dino.center.x, Platform6.center.y - 35);
    }
    
        if (CGRectIntersectsRect(Dino.frame, Platform7.frame)){
            jumpvalue = 0;
            Dino.center = CGPointMake(Dino.center.x, Platform7.center.y - 35);
    }
    
        if (CGRectIntersectsRect(Dino.frame, Platform8.frame)){
            jumpvalue = 0;
            Dino.center = CGPointMake(Dino.center.x, Platform8.center.y - 35);
    }
    
        if (CGRectIntersectsRect(Dino.frame, Platform9.frame)){
            jumpvalue = 0;
            Dino.center = CGPointMake(Dino.center.x, Platform9.center.y - 35);
    }
    
        if (CGRectIntersectsRect(Dino.frame, Platform10.frame)){
            jumpvalue = 0;
            Dino.center = CGPointMake(Dino.center.x, Platform10.center.y - 35);
    }
    
    // When Dino intersects with Egg, play eggCollect Sound and create alertview
    if (CGRectIntersectsRect(Dino.frame, Egg.frame)){
        Egg.center = CGPointMake(Egg.center.x, Egg.center.y - 500);
        AudioServicesPlaySystemSound(eggCollect);
        NSString *title = @"LEVEL COMPLETED";
        NSString *message = @"You retrieved the stolen egg!";
        NSString *option = @"Back to Level Select!";
        Left.enabled = NO;
        Right.enabled = NO;
        Jump.enabled = NO;
        
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *button = [UIAlertAction actionWithTitle:option style:UIAlertActionStyleCancel handler:nil];
        [alert addAction:button];
        
        [self presentViewController:alert animated:YES completion:nil];
    }
    
    // When Dino intersects with Fall, play Falling Sound and create alertview as become 0
    if (CGRectIntersectsRect(Dino.frame, Fall.frame)){
        
        life = life - 4;
        AudioServicesPlaySystemSound(Falling);
        Fall.center = CGPointMake(Fall.center.x, Fall.center.y - 500);
        
        Left.enabled = NO;
        Right.enabled = NO;
        Jump.enabled = NO;
        
        if (life >= 0) {
            Life.text = [NSString stringWithFormat:@"%i", life];
        }
        
        else{
            //Game Over Code
            NSString *title = @"GAME OVER";
            NSString *message = @"You have fallen and died!";
            NSString *option = @"Back to Level Select";
            
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *button = [UIAlertAction actionWithTitle:option style:UIAlertActionStyleCancel handler:nil];
            [alert addAction:button];
            
            [self presentViewController:alert animated:YES completion:nil];
            
            if (button){
                
            }
        }

    }
    
        // When Dino intersects with Spikes, play Damage Sound and create alertview when lives = 0
        if (CGRectIntersectsRect(Dino.frame, Spikes.frame)){
            
            life = life - 1;
            AudioServicesPlaySystemSound(Damage);
            Spikes.center = CGPointMake(Spikes.center.x, Spikes.center.y - 500);
          
            
        if (life >= 0) {
            Life.text = [NSString stringWithFormat:@"%i", life];
            }
            
        else{
            //Game Over Code
            NSString *title = @"GAME OVER";
            NSString *message = @"You have died!";
            NSString *option = @"Back to Level Select";
            
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *button = [UIAlertAction actionWithTitle:option style:UIAlertActionStyleCancel handler:nil];
            [alert addAction:button];

            if (button){

            }
        }
    }
}

// When Dino intersects with platforms, change value of the x-axis in regards to Dino. This makes it so Dino can't walk through plaforms.
-(void)goleft{
    Dino.center = CGPointMake(Dino.center.x - 7, Dino.center.y);
    
    if(CGRectIntersectsRect(Dino.frame, Platform.frame)){
        Dino.center = CGPointMake(Dino.center.x + 7, Platform.center.y);
    }
    
    if(CGRectIntersectsRect(Dino.frame, Platform2.frame)){
        Dino.center = CGPointMake(Dino.center.x + 7, Platform2.center.y);
    }
    
    if(CGRectIntersectsRect(Dino.frame, Platform3.frame)){
        Dino.center = CGPointMake(Dino.center.x + 7, Platform3.center.y);
    }
    
    if(CGRectIntersectsRect(Dino.frame, Platform4.frame)){
        Dino.center = CGPointMake(Dino.center.x + 7, Platform4.center.y);
    }
    
    if(CGRectIntersectsRect(Dino.frame, Platform5.frame)){
        Dino.center = CGPointMake(Dino.center.x + 7, Platform5.center.y);
    }
    
    if(CGRectIntersectsRect(Dino.frame, Platform6.frame)){
        Dino.center = CGPointMake(Dino.center.x + 7, Platform6.center.y);
    }
    
    if(CGRectIntersectsRect(Dino.frame, Platform7.frame)){
        Dino.center = CGPointMake(Dino.center.x + 7, Platform7.center.y);
    }
    
    if(CGRectIntersectsRect(Dino.frame, Platform8.frame)){
        Dino.center = CGPointMake(Dino.center.x + 7, Platform8.center.y);
    }
    
    if(CGRectIntersectsRect(Dino.frame, Platform9.frame)){
        Dino.center = CGPointMake(Dino.center.x + 7, Platform9.center.y);
    }
    
    if(CGRectIntersectsRect(Dino.frame, Platform10.frame)){
        Dino.center = CGPointMake(Dino.center.x + 7, Platform10.center.y);
    }
}

// Holds timer function for goleft
-(IBAction)startleft
{
    lefttimer = [NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(goleft) userInfo:nil repeats:YES];
}

// Invalidates lefttimer
-(IBAction)stopleft
{
    [lefttimer invalidate];
}

// When Dino intersects with platforms, change value of the x-axis in regards to Dino. This makes it so Dino can't walk through plaforms.
-(void)goright{
    Dino.center = CGPointMake(Dino.center.x + 7, Dino.center.y);
    
    if(CGRectIntersectsRect(Dino.frame, Platform.frame)){
        Dino.center = CGPointMake(Dino.center.x - 7, Platform.center.y);
    }
    
    if(CGRectIntersectsRect(Dino.frame, Platform2.frame)){
        Dino.center = CGPointMake(Dino.center.x - 7, Platform2.center.y);
    }
    
    if(CGRectIntersectsRect(Dino.frame, Platform3.frame)){
        Dino.center = CGPointMake(Dino.center.x - 7, Platform3.center.y);
    }
    
    if(CGRectIntersectsRect(Dino.frame, Platform4.frame)){
        Dino.center = CGPointMake(Dino.center.x - 7, Platform4.center.y);
    }
    
    if(CGRectIntersectsRect(Dino.frame, Platform5.frame)){
        Dino.center = CGPointMake(Dino.center.x - 7, Platform5.center.y);
    }
    
    if(CGRectIntersectsRect(Dino.frame, Platform6.frame)){
        Dino.center = CGPointMake(Dino.center.x - 7, Platform6.center.y);
    }
    
    if(CGRectIntersectsRect(Dino.frame, Platform7.frame)){
        Dino.center = CGPointMake(Dino.center.x - 7, Platform7.center.y);
    }
    
    if(CGRectIntersectsRect(Dino.frame, Platform8.frame)){
        Dino.center = CGPointMake(Dino.center.x - 7, Platform8.center.y);
    }
    
    if(CGRectIntersectsRect(Dino.frame, Platform9.frame)){
        Dino.center = CGPointMake(Dino.center.x - 7, Platform9.center.y);
    }
    
    if(CGRectIntersectsRect(Dino.frame, Platform10.frame)){
        Dino.center = CGPointMake(Dino.center.x - 7, Platform10.center.y);
    }
}

// Holds timer function for goright
-(IBAction)startright
{
    righttimer = [NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(goright) userInfo:nil repeats:YES];
}

// Invalidates righttimer
-(IBAction)stopright
{
    [righttimer invalidate];
}


- (void)viewDidLoad {
    
    //Sets life value
    life = 3;
    //Life label display
    Life.text = [NSString stringWithFormat:@"%i", life];
    
    
    // Creates path for music and sounds
    NSURL * gameMusic = [NSURL fileURLWithPath: [[NSBundle mainBundle] pathForResource:@"DDGameMusic" ofType:@"mp4"]];
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)gameMusic, & Music);
    
    NSURL * jumpSound = [NSURL fileURLWithPath: [[NSBundle mainBundle] pathForResource:@"Jump" ofType:@"mp4"]];
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)jumpSound, & jumpButton);
    
    NSURL * damageSound = [NSURL fileURLWithPath: [[NSBundle mainBundle] pathForResource:@"DamageSound" ofType:@"wav"]];
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)damageSound, & Damage);
    
    NSURL * fallSound = [NSURL fileURLWithPath: [[NSBundle mainBundle] pathForResource:@"FallingSound" ofType:@"wav"]];
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)fallSound, & Falling);
    
    NSURL * eggSound = [NSURL fileURLWithPath: [[NSBundle mainBundle] pathForResource:@"Egg Collect Sound" ofType:@"wav"]];
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)eggSound, & eggCollect);
    
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //Sets fallingtimer
    fallingtimer = [NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(fallingcode) userInfo:nil repeats:YES];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
