//
//  sond.m
//  ant
//
//  Created by Annie Hua on 2014-03-31.
//  Copyright (c) 2014 sam. All rights reserved.
//

#import "audio.h"
//@interface audiosprite ()

//@end

@implementation audiosprite 


- (void)initaudio
{
    
	// Do any additional setup after loading the view, typically from a nib.
    NSString *fileName = @"love"; // Change this to your own file
    NSString *fileType = @"mp3";
    NSString *soundFilePath =
    [[NSBundle mainBundle] pathForResource:fileName ofType:fileType];
    NSURL *soundFileURL = [NSURL fileURLWithPath:soundFilePath];
    
    NSError *error;
    self.player =
    [[AVAudioPlayer alloc] initWithContentsOfURL:soundFileURL error:&error];
    if (error)
    {
        NSLog(@"Error creating the audio player: %@", error);
    }
    self.player.enableRate = YES; //Allows us to change the playback rate.
   
   self.player.meteringEnabled = YES; //Allows us to monitor levels
    
        self.player.rate = 1;
        self.player.pan = 3;
        self.player.volume = 1;
        self.player.numberOfLoops = -1;
        [self.player play ];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}
@end
