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

-(IBAction)jumpcode:(id)sender
{
    jumpvalue = 25;
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
}


-(void)goleft{
    Dino.center = CGPointMake(Dino.center.x - 7, Dino.center.y);
    
    if(CGRectIntersectsRect(Dino.frame, Platform.frame)){
        Dino.center = CGPointMake(Dino.center.x + 7, Platform.center.y);
    }
    
    if(CGRectIntersectsRect(Dino.frame, Platform2.frame)){
        Dino.center = CGPointMake(Dino.center.x + 7, Platform2.center.y);
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
    
    NSURL * jumpSound = [NSURL fileURLWithPath: [[NSBundle mainBundle] pathForResource:@"Jump" ofType:@"mp4"]];
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)jumpSound, & jumpButton);
    
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    
    fallingtimer = [NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(fallingcode) userInfo:nil repeats:YES];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
