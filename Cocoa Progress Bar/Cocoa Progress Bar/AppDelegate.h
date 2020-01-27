//
//  AppDelegate.h
//  Cocoa Progress Bar
//
//  Created by Nikola Grujic on 26/01/2020.
//  Copyright © 2020 Mac Developers. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface AppDelegate : NSObject <NSApplicationDelegate>
{
    NSTimeInterval startTime;
    NSTimeInterval elapsedTime;
    NSTimeInterval timeLimit;
    NSTimer *timer;
}

@property (weak) IBOutlet NSWindow *window;
@property (weak) IBOutlet NSProgressIndicator *progressIndicator;
@property (weak) IBOutlet NSButton *startButton;

- (IBAction)start:(id)sender;

- (void)startTimer;
- (void)stopTimer;
- (void)timerTickHandler;
- (void)updateElapsedTime;
- (void)resetElapsedTime;

@end

