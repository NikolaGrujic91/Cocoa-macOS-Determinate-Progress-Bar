//
//  AppDelegate.m
//  Cocoa Progress Bar
//
//  Created by Nikola Grujic on 26/01/2020.
//  Copyright © 2020 Mac Developers. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

- (void)awakeFromNib
{
    timeLimit = 100.0;
}

#pragma mark Action methods

- (IBAction)start:(id)sender
{
    [_startButton setEnabled:NO];
    [self resetElapsedTime];
    [self startTimer];
}

#pragma mark Additional methods

- (void)startTimer
{
    if (timer == nil)
    {
        timer = [NSTimer scheduledTimerWithTimeInterval:1.0
                                                 target:self
                                               selector:@selector(timerTickHandler)
                                               userInfo:nil
                                                repeats:YES];
    }
}

- (void)stopTimer
{
    [timer invalidate];
    timer = nil;
}

- (void)timerTickHandler
{
    [self updateElapsedTime];
    [_progressIndicator setDoubleValue:elapsedTime];
    
    if (elapsedTime >= timeLimit)
    {
        [_startButton setEnabled:YES];
        [self resetElapsedTime];
        [_progressIndicator setDoubleValue:0.0f];
        [self stopTimer];
    }
}

- (void)updateElapsedTime
{
    elapsedTime = [NSDate timeIntervalSinceReferenceDate] - startTime;
}

- (void)resetElapsedTime
{
    startTime = [NSDate timeIntervalSinceReferenceDate];
    [self updateElapsedTime];
}

@end
