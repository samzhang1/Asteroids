//
//  sond.h
//  ant
//
//  Created by Annie Hua on 2014-03-31.
//  Copyright (c) 2014 sam. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import <AudioToolbox/AudioToolbox.h>

@interface audiosprite : UIViewController <AVAudioPlayerDelegate>
@property (strong, nonatomic) AVAudioPlayer *player;
-(void)initaudio;

@end
