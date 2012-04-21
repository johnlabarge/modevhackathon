//
//  CameraViewController.m
//  thankxBuddyApp
//
//  Created by Doug Toppin on 4/21/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CameraViewController.h"

@implementation CameraViewController

@synthesize readerView, resultText;

- (void) viewDidLoad
{
    [super viewDidLoad];
    
    // the delegate receives decode results
    readerView.readerDelegate = self;
    
    // you can use this to support the simulator
    if(TARGET_IPHONE_SIMULATOR) {
        cameraSim = [[ZBarCameraSimulator alloc]
                     initWithViewController: self];
        cameraSim.readerView = readerView;
    }
}

- (void) viewDidUnload
{
  
    [super viewDidUnload];
}


@end
