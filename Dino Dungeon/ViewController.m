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
    jumpvalue = jumpvalue - 5;
    Dino.center = CGPointMake(Dino.center.x, Dino.center.y -jumpvalue);
    
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

-(IBAction)startleft
{
    lefttimer = [NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(goleft) userInfo:nil repeats:YES];
}


-(IBAction)stopleft
{
    [lefttimer invalidate];
}


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

-(IBAction)startright
{
    righttimer = [NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(goright) userInfo:nil repeats:YES];
}


-(IBAction)stopright
{
    [righttimer invalidate];
}


- (void)viewDidLoad {
    
    life = 3;
    Life.text = [NSString stringWithFormat:@"%i", life];
    
    NSURL * gameMusic = [NSURL fileURLWithPath: [[NSBundle mainBundle] pathForResource:@"DinoDungeonGameMusic" ofType:@"wav"]];
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
        
    fallingtimer = [NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(fallingcode) userInfo:nil repeats:YES];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
